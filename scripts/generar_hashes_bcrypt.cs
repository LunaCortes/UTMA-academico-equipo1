// Script temporal para generar hashes BCrypt
// Ejecutar: dotnet script generar_hashes_bcrypt.cs

using BCrypt.Net;

Console.WriteLine("=== Generador de Hashes BCrypt ===\n");

var passwords = new Dictionary<string, string>
{
    { "admin123", "admin@clinica.com" },
    { "medico123", "martinez@clinica.com" },
    { "paciente123", "juan.perez@email.com" },
    { "recep123", "recepcion@clinica.com" }
};

Console.WriteLine("-- Script SQL para actualizar contraseñas con BCrypt\n");
Console.WriteLine("USE sistemaGestionCitasMedicas;\n");

foreach (var (password, email) in passwords)
{
    var hash = BCrypt.Net.BCrypt.HashPassword(password);
    Console.WriteLine($"-- Contraseña: {password} (usuario: {email})");
    Console.WriteLine($"UPDATE usuarios SET passwordUsuario = '{hash}' WHERE emailUsuario = '{email}';");
    Console.WriteLine();
}

Console.WriteLine("\n-- Verificar actualización");
Console.WriteLine("SELECT idUsuario, nombreUsuario, emailUsuario, LEFT(passwordUsuario, 30) as hash_preview FROM usuarios;");

