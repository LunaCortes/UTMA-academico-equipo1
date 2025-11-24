# Convertir manual Markdown a DOCX usando Pandoc
# Uso: Ejecutar desde la raíz del proyecto (PowerShell)
# Ejemplo: ./manual/convert-manual.ps1

param(
    [string]$Input = "manual/UTMA-Academico-Manual.md",
    [string]$Output = "manual/UTMA-Academico-Manual.docx"
)

function Check-Pandoc {
    try {
        $p = & pandoc --version 2>$null
        return $true
    } catch {
        return $false
    }
}

if (-not (Check-Pandoc)) {
    Write-Host "Pandoc no está instalado en este entorno." -ForegroundColor Yellow
    Write-Host "Instala Pandoc y luego ejecuta este script nuevamente." -ForegroundColor Yellow
    Write-Host "Instalación en Windows: https://pandoc.org/installing.html" -ForegroundColor Cyan
    Write-Host "O en Chocolatey: choco install pandoc" -ForegroundColor Cyan
    exit 1
}

Write-Host "Convirtiendo '$Input' -> '$Output'..." -ForegroundColor Green

# Ejecutar pandoc con opciones recomendadas
$pandocArgs = @(
    $Input,
    "-s",
    "-o", $Output,
    "--from=markdown",
    "--toc",                        # tabla de contenidos
    "--toc-depth=3",
    "--standalone",
    "--resource-path=.",
    "--metadata=title:UTMA Académico - Manual",
    "--variable=geometry:margin=1in"
)

$p = & pandoc @pandocArgs

if ($LASTEXITCODE -eq 0) {
    Write-Host "Conversión finalizada: $Output" -ForegroundColor Green
} else {
    Write-Host "Error en la conversión. Código de salida: $LASTEXITCODE" -ForegroundColor Red
}
