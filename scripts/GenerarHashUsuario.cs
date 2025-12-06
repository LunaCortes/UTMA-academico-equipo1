// Script para generar hash BCrypt de contraseñas
// Compilar y ejecutar: dotnet script GenerarHashUsuario.cs
// O usar en un proyecto de consola

using BCrypt.Net;

class Program
{
    static void Main(string[] args)
    {
        Console.WriteLine("=== Generador de Hash BCrypt para Usuarios ===\n");
        
        // Contraseña a hashear
        string password = "admin123"; // Cambia esta contraseña
        
        // Generar hash
        string hash = BCrypt.Net.BCrypt.HashPassword(password);
        
        Console.WriteLine($"Contraseña: {password}");
        Console.WriteLine($"Hash BCrypt: {hash}\n");
        
        // SQL para insertar usuario
        Console.WriteLine("SQL para insertar usuario:");
        Console.WriteLine($"INSERT INTO usuarios (nombreUsuario, emailUsuario, passwordUsuario, idRol, activo, fechaCreacion, fechaActualizacion)");
        Console.WriteLine($"VALUES ('nuevo_usuario', 'nuevo@clinica.com', '{hash}', 1, TRUE, NOW(), NOW());");
    }
}

