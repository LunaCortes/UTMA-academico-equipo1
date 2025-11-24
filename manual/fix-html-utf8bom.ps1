# Reescribe manual/UTMA-Academico-Manual.html con codificación UTF-8 incluyendo BOM
# Uso: ejecutar desde la raíz del proyecto en PowerShell (Windows)
#   .\manual\fix-html-utf8bom.ps1

$path = Join-Path -Path (Get-Location) -ChildPath "manual/UTMA-Academico-Manual.html"
if (-not (Test-Path $path)) {
    Write-Host "Archivo no encontrado: $path" -ForegroundColor Red
    exit 1
}

try {
    $content = Get-Content -Path $path -Raw -ErrorAction Stop
    # Escribir usando la clase .NET con UTF8 que incluye BOM
    [System.IO.File]::WriteAllText($path, $content, [System.Text.Encoding]::UTF8)
    Write-Host "Archivo reescrito con UTF-8 (con BOM): $path" -ForegroundColor Green
} catch {
    Write-Host "Error al reescribir el archivo: $_" -ForegroundColor Red
    exit 1
}
