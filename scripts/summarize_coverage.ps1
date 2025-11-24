$path = 'tests\utma-academico.Tests\TestResults\b3f23029-09f2-47e6-883f-3a70a8f0ea9a\coverage.cobertura.xml'
if (!(Test-Path $path)) { Write-Error "Coverage file not found: $path"; exit 1 }
[xml]$doc = Get-Content $path

# collect all class nodes
$classes = @()
if ($doc.coverage.packages -ne $null) {
    $packages = $doc.coverage.packages.package
    foreach ($p in $packages) {
        if ($p.classes -ne $null) {
            $classes += $p.classes.class
        }
    }
}
else {
    $classes = $doc.coverage.packages.package.classes.class
}

# dictionary: filename -> dictionary of lineNumber->covered(bool)
$fileMap = @{}
foreach ($c in $classes) {
    $file = $c.filename
    if (-not $fileMap.ContainsKey($file)) { $fileMap[$file] = @{} }
    $linesNode = $c.lines
    if ($linesNode -ne $null) {
        foreach ($line in $linesNode.line) {
            $num = [int]$line.number
            $hits = [int]$line.hits
            if (-not $fileMap[$file].ContainsKey($num)) {
                $fileMap[$file][$num] = ($hits -gt 0)
            } else {
                # if already recorded, mark covered if any occurrence has hits > 0
                $fileMap[$file][$num] = ($fileMap[$file][$num] -or ($hits -gt 0))
            }
        }
    }
}

# produce sorted summary
$summary = @()
foreach ($kv in $fileMap.GetEnumerator()) {
    $file = $kv.Key
    $linesDict = $kv.Value
    $total = $linesDict.Keys.Count
    if ($total -eq 0) { $percent = 100.0 } else {
        $covered = ($linesDict.GetEnumerator() | Where-Object { $_.Value -eq $true }).Count
        $percent = ($covered / $total) * 100.0
    }
    $summary += [PSCustomObject]@{ File = $file; Covered = $covered; Total = $total; Percent = $percent }
}

$summary | Sort-Object -Property Percent -Descending | ForEach-Object { "{0} {1:N2}% ({2}/{3})" -f $_.File, $_.Percent, $_.Covered, $_.Total }
