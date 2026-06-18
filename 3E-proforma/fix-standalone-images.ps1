#Requires -Version 5.1
<#
.SYNOPSIS
    Converts standalone block-level <img> tags in docs/ markdown files to
    Markdown image syntax that Dhub's editor can render visually.

.DESCRIPTION
    Scans all .md and .mdx files under the docs/ folder recursively.
    Any line whose ONLY content is a self-closing <img src="..."> tag is
    converted to standard Markdown: ![](path)

    Inline <img> tags embedded within text lines (e.g. icon images inside
    table cells or paragraphs) are left untouched.

    Run this script whenever new doc files are added that contain standalone
    <img> tags generated from a Flare export.

.EXAMPLE
    .\fix-standalone-images.ps1
#>

$ErrorActionPreference = "Stop"

$DocsFolder = Join-Path $PSScriptRoot "docs"

# Matches a line where the ONLY content is a standalone <img> tag
$pattern = [System.Text.RegularExpressions.Regex]::new(
    '^(\s*)<img\s+src="([^"]+)"[^>]*/>\s*$',
    [System.Text.RegularExpressions.RegexOptions]::Multiline
)

$changedFiles = 0
$changedLines = 0

Write-Host ""
Write-Host "Scanning docs folder for standalone <img> tags..."

Get-ChildItem -Path $DocsFolder -Recurse -Include "*.md","*.mdx" | ForEach-Object {
    $file     = $_
    $original = [System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8)
    $count    = 0

    $updated = $pattern.Replace($original, {
        param($m)
        $script:count++
        $m.Groups[1].Value + "![](" + $m.Groups[2].Value + ")"
    })

    if ($updated -ne $original) {
        [System.IO.File]::WriteAllText($file.FullName, $updated, [System.Text.UTF8Encoding]::new($false))
        $changedFiles++
        $changedLines += $count
        Write-Host "  Updated (${count}x): $($file.FullName.Substring($DocsFolder.Length + 1))"
    }
}

Write-Host ""
Write-Host "Done. $changedFiles files updated, $changedLines standalone img tags converted to Markdown."
Write-Host ""
