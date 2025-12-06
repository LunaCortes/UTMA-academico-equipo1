using BCrypt.Net;

string password = "admin29";
string hash = BCrypt.Net.BCrypt.HashPassword(password);
Console.WriteLine($"Contraseña: {password}");
Console.WriteLine($"Hash BCrypt: {hash}");
