using BCrypt.Net;

Console.WriteLine("-- Script SQL para actualizar contraseñas con BCrypt");
Console.WriteLine("USE sistemaGestionCitasMedicas;");
Console.WriteLine();

var passwords = new Dictionary<string, string>
{
    { "admin123", "admin@clinica.com" },
    { "medico123", "martinez@clinica.com" },
    { "paciente123", "juan.perez@email.com" },
    { "recep123", "recepcion@clinica.com" }
};

foreach (var (password, email) in passwords)
{
    var hash = BCrypt.Net.BCrypt.HashPassword(password);
    Console.WriteLine($"-- Contraseña: {password} (usuario: {email})");
    Console.WriteLine($"UPDATE usuarios SET passwordUsuario = '{hash}' WHERE emailUsuario = '{email}';");
    Console.WriteLine();
}

Console.WriteLine("-- Verificar actualización");
Console.WriteLine("SELECT idUsuario, nombreUsuario, emailUsuario, LEFT(passwordUsuario, 30) as hash_preview FROM usuarios;");
