#Requires -Version 5.1
<#
.SYNOPSIS
    Collapses multi-line HTML tables in docs/ markdown files to single lines
    so Dhub's editor renders them visually rather than as raw code blocks.

.DESCRIPTION
    Scans all .md and .mdx files under the docs/ folder recursively.
    For each HTML table that spans multiple lines:
      - Removes the <colgroup>...</colgroup> block (Flare print-width hints,
        not needed on the web)
      - Collapses <table>, <thead>, <tbody>, and </table> onto a single line

    Single-line HTML tables are recognised and rendered visually by Dhub.
    Multi-line HTML blocks are displayed as raw code by Dhub's editor.

    Run this script whenever new doc files are added from a Flare export.

.EXAMPLE
    .\fix-multiline-tables.ps1
#>

$ErrorActionPreference = "Stop"

$DocsFolder = Join-Path $PSScriptRoot "docs"

# Matches a full HTML table block spanning multiple lines.
# Captures: (1) table attributes, (2) thead content, (3) tbody content.
$pattern = [System.Text.RegularExpressions.Regex]::new(
    '<table([^>]*)>\s*(?:<colgroup>.*?</colgroup>\s*)?(<thead>.*?</thead>)\s*(<tbody>.*?</tbody>)\s*</table>',
    [System.Text.RegularExpressions.RegexOptions]::Singleline
)

$changedFiles  = 0
$changedTables = 0

Write-Host ""
Write-Host "Scanning docs folder for multi-line HTML tables..."

Get-ChildItem -Path $DocsFolder -Recurse -Include "*.md","*.mdx" | ForEach-Object {
    $file     = $_
    $original = [System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8)
    $matches  = $pattern.Matches($original)
    if ($matches.Count -eq 0) { return }

    # Only process files where a table actually spans multiple lines
    $hasMultiLine = $false
    foreach ($m in $matches) {
        if ($m.Value -match "`n") { $hasMultiLine = $true; break }
    }
    if (-not $hasMultiLine) { return }

    $count   = 0
    $updated = $pattern.Replace($original, {
        param($m)
        $attrs = $m.Groups[1].Value
        $thead = $m.Groups[2].Value
        $tbody = $m.Groups[3].Value
        if ($m.Value -match "`n") { $script:count++ }
        "<table$attrs>$thead$tbody</table>"
    })

    if ($updated -ne $original) {
        [System.IO.File]::WriteAllText($file.FullName, $updated, [System.Text.UTF8Encoding]::new($false))
        $changedFiles++
        $changedTables += $count
        Write-Host "  Updated (${count}x): $($file.FullName.Substring($DocsFolder.Length + 1))"
    }
}

Write-Host ""
Write-Host "Done. $changedFiles files updated, $changedTables multi-line tables collapsed."
Write-Host ""
