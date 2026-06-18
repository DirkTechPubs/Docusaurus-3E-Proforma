#Requires -Version 5.1
$ErrorActionPreference = "Stop"
$DocsFolder = "c:\GitHub\Docusaurus-3E-Proforma\3E-proforma\docs"

$SI = [System.Text.RegularExpressions.RegexOptions]::Singleline -bor [System.Text.RegularExpressions.RegexOptions]::IgnoreCase

$reTable = [regex]::new('<table[^>]*>.*?</table>', $SI)
$reThead = [regex]::new('<thead[^>]*>(.*?)</thead>', $SI)
$reTbody = [regex]::new('<tbody[^>]*>(.*?)</tbody>', $SI)
$reTr    = [regex]::new('<tr[^>]*>(.*?)</tr>', $SI)
$reTh    = [regex]::new('<th[^>]*>(.*?)</th>', $SI)
$reTd    = [regex]::new('<td([^>]*)>(.*?)</td>', $SI)
$reP     = [regex]::new('<p[^>]*>(.*?)</p>', $SI)

function Convert-Cell {
    param([string]$html)
    # Merge multiple <p> tags, joining with <br/>; discard whitespace-only paragraphs
    if ($html -match '(?i)<p') {
        $parts = @($reP.Matches($html) | ForEach-Object { $_.Groups[1].Value.Trim() } |
                   Where-Object { $_.Trim() -ne '' -and $_ -ne '&nbsp;' -and
                                  $_ -notmatch '^[\s\u00A0\u00C2\u00A0]+$' })
        $html = if ($parts.Count -gt 0) { $parts -join '<br/>' } else { '' }
    }
    # Escape | that are outside HTML tags
    $sb = [System.Text.StringBuilder]::new()
    $in = $false
    foreach ($c in $html.ToCharArray()) {
        if    ($c -eq '<')               { $in = $true;  [void]$sb.Append($c) }
        elseif($c -eq '>')               { $in = $false; [void]$sb.Append($c) }
        elseif($c -eq '|' -and -not $in) { [void]$sb.Append('\|') }
        else                             { [void]$sb.Append($c) }
    }
    return $sb.ToString().Trim()
}

function Convert-Table {
    param([string]$tbl)
    # Skip tables with rowspan — can't be represented in Markdown pipe tables
    if ($tbl -match 'rowspan=') { return $null }

    $thM = $reThead.Match($tbl)
    $tbM = $reTbody.Match($tbl)
    if (-not $thM.Success -or -not $tbM.Success) { return $null }

    $hrM = $reTr.Match($thM.Groups[1].Value)
    if (-not $hrM.Success) { return $null }

    $hdrs = @($reTh.Matches($hrM.Groups[1].Value) |
              ForEach-Object { Convert-Cell $_.Groups[1].Value })
    if ($hdrs.Count -eq 0) { return $null }
    $cols = $hdrs.Count

    $out = [System.Collections.Generic.List[string]]::new()
    $out.Add('| ' + ($hdrs -join ' | ') + ' |')
    $out.Add(('|---' * $cols) + '|')

    foreach ($trM in $reTr.Matches($tbM.Groups[1].Value)) {
        $row = [System.Collections.Generic.List[string]]::new()
        foreach ($tdM in $reTd.Matches($trM.Groups[1].Value)) {
            $span = 1
            if ($tdM.Groups[1].Value -match 'colspan="(\d+)"') { $span = [int]$Matches[1] }
            $row.Add((Convert-Cell $tdM.Groups[2].Value))
            for ($x = 1; $x -lt $span; $x++) { $row.Add('') }
        }
        while ($row.Count -lt $cols) { $row.Add('') }
        $take = [Math]::Min($row.Count, $cols)
        $out.Add('| ' + ($row.GetRange(0, $take).ToArray() -join ' | ') + ' |')
    }
    return $out.ToArray() -join "`n"
}

$fc = 0; $tc = 0; $sk = 0
Write-Host ""
Write-Host "Converting HTML tables to Markdown pipe tables..."

Get-ChildItem -Path $DocsFolder -Recurse -Include "*.md","*.mdx" | ForEach-Object {
    $file = $_
    $orig = [System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8)
    $ms   = $reTable.Matches($orig)
    if ($ms.Count -eq 0) { return }

    $n = 0; $sb = [System.Text.StringBuilder]::new(); $li = 0
    foreach ($m in $ms) {
        [void]$sb.Append($orig.Substring($li, $m.Index - $li))
        $md = Convert-Table $m.Value
        if ($null -ne $md) {
            [void]$sb.Append($md); $n++
        } else {
            if ($m.Value -match 'rowspan=') {
                Write-Host "  Kept as HTML (rowspan): $($file.Name)"
                $script:sk++
            } else {
                Write-Warning "  Could not convert table in: $($file.Name)"
            }
            [void]$sb.Append($m.Value)
        }
        $li = $m.Index + $m.Length
    }
    [void]$sb.Append($orig.Substring($li))
    $upd = $sb.ToString()
    if ($upd -ne $orig) {
        [System.IO.File]::WriteAllText($file.FullName, $upd, [System.Text.UTF8Encoding]::new($false))
        $fc++; $tc += $n
        Write-Host "  Updated (${n}x): $($file.FullName.Substring($DocsFolder.Length + 1))"
    }
}
Write-Host ""
Write-Host "Done. $fc files updated, $tc tables converted, $sk tables kept as HTML (rowspan)."
Write-Host ""
