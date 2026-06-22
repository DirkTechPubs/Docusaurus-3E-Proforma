#Requires -Version 5.1
<#
.SYNOPSIS
    Generates a Dhub navigation.json from a MadCap Flare .fltoc file.

.DESCRIPTION
    Parses a Flare TOC file and maps its hierarchy to the Dhub navigation.json
    format used by Dhub CMS.

    Rules applied to each TocEntry:
      - Title only (no Link), with children  -> group
      - Title + Link, no children            -> page  (path resolved from docs/)
      - Title + Link + children              -> group (Flare repeats parent page
                                               as first child; parent link dropped)
      - Title "[pct]=System.LinkedTitle[pct]"-> label derived from Link filename

    The top-level tab is always labelled "Guides".

    If navigation.json already exists in the project root a backup copy named
    navigation.json.bak is written before overwriting.

.PARAMETER FltocPath
    Full path to the .fltoc file to process. If omitted you will be prompted.

.EXAMPLE
    .\generate-navigation.ps1
    .\generate-navigation.ps1 -FltocPath "C:\MyProject\TOCs\Guide.fltoc"
#>

[CmdletBinding()]
param(
    [string]$FltocPath
)

$ErrorActionPreference = "Stop"

# --- Paths ---
$ProjectRoot = $PSScriptRoot
$DocsFolder  = Join-Path $ProjectRoot "docs"
$OutputPath  = Join-Path $ProjectRoot "navigation.json"
$BackupPath  = Join-Path $ProjectRoot "navigation.json.bak"

# --- Input ---
if (-not $FltocPath) {
    $FltocPath = Read-Host "Enter the full path to the .fltoc file"
}

# Strip any surrounding quotes the user may have included
$FltocPath = $FltocPath.Trim('"').Trim("'").Trim()

if (-not (Test-Path -LiteralPath $FltocPath)) {
    Write-Error "File not found: $FltocPath"
    exit 1
}

# --- Build docs file index ---
# Key   = lowercase basename  (e.g. "accessing-3e-proforma")
# Value = project-relative forward-slash path
#         (e.g. "docs/Getting-Started/Accessing-3E-Proforma.md")
Write-Host ""
Write-Host "Indexing docs folder..."
$fileIndex = @{}
Get-ChildItem -Path $DocsFolder -Recurse -Include "*.md", "*.mdx" | ForEach-Object {
    # Normalize key the same way as labels: collapse consecutive hyphens
    $key          = ($_.BaseName -replace '-{2,}', '-').ToLower()
    $relativePath = "docs/" + ($_.FullName.Substring($DocsFolder.Length + 1) -replace '\\', '/')
    # First match wins (shallower paths preferred)
    if (-not $fileIndex.ContainsKey($key)) {
        $fileIndex[$key] = $relativePath
    }
}
Write-Host "  Indexed $($fileIndex.Count) doc files."

# --- Helper: normalise a label to a lookup key ---
function Get-NormalizedKey {
    param([string]$label)
    # Replace runs of whitespace with hyphens, collapse consecutive hyphens, lowercase.
    # "Accessing 3E Proforma"    -> "accessing-3e-proforma"
    # "Proforma Details - Costs Tab" -> "proforma-details-costs-tab"
    return (($label.Trim() -replace '\s+', '-') -replace '-{2,}', '-').ToLower()
}

# --- Helper: find a doc file path by label ---
function Resolve-DocPath {
    param([string]$label)
    $key = Get-NormalizedKey $label
    if ($Script:fileIndex.ContainsKey($key)) {
        return $Script:fileIndex[$key]
    }
    Write-Warning "  No doc file matched for '$label'  (lookup key: '$key') -- entry skipped"
    return $null
}

# --- Helper: derive a human-readable label from a Flare Link value ---
function Get-LabelFromLink {
    # "/Content/3E Proforma/Accessing 3E Proforma.htm" -> "Accessing 3E Proforma"
    param([string]$link)
    $fileName = [System.IO.Path]::GetFileName($link)
    return [System.IO.Path]::GetFileNameWithoutExtension($fileName)
}

# --- Recursive converter ---
function Convert-TocEntry {
    param([System.Xml.XmlElement]$entry)

    $title = $entry.GetAttribute("Title")
    $link  = $entry.GetAttribute("Link")

    # Resolve display label
    $linkedTitleToken = '[%=System.LinkedTitle%]'
    if ($title -eq $linkedTitleToken) {
        if ($link) {
            $label = Get-LabelFromLink $link
        } else {
            Write-Warning "  LinkedTitle with no Link attribute -- skipping entry"
            return $null
        }
    } else {
        $label = $title.Trim()
    }

    if (-not $label) {
        Write-Warning "  Empty label -- skipping entry"
        return $null
    }

    # Determine node type from child count
    $childXmlNodes = $entry.SelectNodes("TocEntry")
    $hasChildren   = ($childXmlNodes.Count -gt 0)

    if ($hasChildren) {
        # Group -- recurse into children.
        # When a Link is also present, Flare typically repeats the parent page
        # as the first child entry, so the parent Link is intentionally dropped.
        $kids = [System.Collections.Generic.List[object]]::new()
        foreach ($child in $childXmlNodes) {
            $converted = Convert-TocEntry -entry $child
            if ($null -ne $converted) {
                $kids.Add($converted)
            }
        }
        if ($kids.Count -eq 0) {
            Write-Warning "  '$label' group has no resolvable children -- skipping"
            return $null
        }
        return [ordered]@{
            label    = $label
            type     = "group"
            children = $kids.ToArray()
        }
    } elseif ($link) {
        # Page -- resolve the markdown file path from docs/
        # If no matching file is found, skip this entry entirely
        $filePath = Resolve-DocPath $label
        if ($null -eq $filePath) {
            return $null
        }
        return [ordered]@{
            label = $label
            type  = "page"
            path  = $filePath
        }
    } else {
        # Title-only leaf with no children and no link -- nothing useful to emit
        Write-Warning "  '$label' has no Link and no children -- skipping"
        return $null
    }
}

# --- Parse fltoc ---
Write-Host ""
Write-Host "Parsing: $FltocPath"
[xml]$xml = Get-Content -LiteralPath $FltocPath -Raw -Encoding UTF8

$rootEntries = $xml.CatapultToc.SelectNodes("TocEntry")
$topLevel    = [System.Collections.Generic.List[object]]::new()

foreach ($entry in $rootEntries) {
    $node = Convert-TocEntry -entry $entry
    if ($null -ne $node) {
        $topLevel.Add($node)
    }
}

# --- Assemble navigation structure ---
$navigation = @(
    [ordered]@{
        label    = "Guides"
        type     = "tab"
        path     = "docs"
        children = $topLevel.ToArray()
    }
)

$json = ConvertTo-Json -InputObject $navigation -Depth 20

# --- Backup existing navigation.json ---
if (Test-Path -LiteralPath $OutputPath) {
    Copy-Item -LiteralPath $OutputPath -Destination $BackupPath -Force
    Write-Host ""
    Write-Host "Backed up existing navigation.json -> navigation.json.bak"
}

# --- Write output (UTF-8, no BOM) ---
[System.IO.File]::WriteAllText(
    $OutputPath,
    $json,
    [System.Text.UTF8Encoding]::new($false)
)

Write-Host ""
Write-Host "Done. navigation.json written to:"
Write-Host "  $OutputPath"
Write-Host ""
