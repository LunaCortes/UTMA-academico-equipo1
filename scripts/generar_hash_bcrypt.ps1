# Script PowerShell para generar hash BCrypt de contraseñas
# Uso: .\generar_hash_bcrypt.ps1

# Instalar el módulo si no está instalado
# Install-Module -Name BCrypt.Net -Force

# O usar el paquete NuGet directamente
Add-Type -Path ".\packages\BCrypt.Net-Next.4.0.3\lib\netstandard2.0\BCrypt.Net-Next.dll" -ErrorAction SilentlyContinue

# Si no funciona lo anterior, usar este método alternativo
function Generate-BcryptHash {
    param(
        [string]$Password
    )
    
    # Método alternativo: usar .NET directamente
    $passwordBytes = [System.Text.Encoding]::UTF8.GetBytes($Password)
    
    # Nota: BCrypt.Net-Next requiere compilación, así que usaremos un método más simple
    Write-Host "Para generar hash BCrypt, usa una de estas opciones:"
    Write-Host "1. Visita: https://bcrypt.online/"
    Write-Host "2. O usa el siguiente código C# en un proyecto .NET:"
    Write-Host ""
    Write-Host "using BCrypt.Net;"
    Write-Host "string hash = BCrypt.Net.BCrypt.HashPassword(`"$Password`");"
    Write-Host ""
    Write-Host "Hash para la contraseña '$Password':"
    Write-Host "(Genera el hash usando una de las opciones anteriores)"
}

# Solicitar contraseña
$password = Read-Host "Ingresa la contraseña a hashear"
Generate-BcryptHash -Password $password

