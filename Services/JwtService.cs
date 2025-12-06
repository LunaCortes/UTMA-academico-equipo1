using System;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;

namespace utma_academico_aspnetcore.Services
{
    /// <summary>
    /// Servicio para generar tokens JWT con información de usuario y rol.
    /// </summary>
    public class JwtService
    {
        private readonly IConfiguration _configuration;

        public JwtService(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        /// <summary>
        /// Genera token JWT con claims: idUsuario, email, rol
        /// </summary>
        public (string token, DateTime expires) GenerateToken(int userId, string email, string rol)
        {
            // Leer configuración con valores por defecto
            var key = _configuration["Jwt:Key"] ?? "VerySecret_SymmetricKey_ChangeThisInProduction_UTMA2025";
            var issuer = _configuration["Jwt:Issuer"] ?? "UTMA";
            var audience = _configuration["Jwt:Audience"] ?? "UTMA";
            var durationMinutes = int.TryParse(_configuration["Jwt:DurationMinutes"], out var m) ? m : 120;

            // Crear la clave de seguridad y credenciales para firmar el token
            var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(key));
            var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);

            var expires = DateTime.UtcNow.AddMinutes(durationMinutes);

            // Claims: sub (idUsuario), email, role, name (email)
            var claims = new[]
            {
                new Claim(JwtRegisteredClaimNames.Sub, userId.ToString()),
                new Claim(JwtRegisteredClaimNames.Email, email),
                new Claim(ClaimTypes.Role, rol),
                new Claim(ClaimTypes.Name, email),
                new Claim("idUsuario", userId.ToString()),
                new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString())
            };

            // Construir y serializar token
            var token = new JwtSecurityToken(
                issuer: issuer,
                audience: audience,
                claims: claims,
                expires: expires,
                signingCredentials: credentials
            );

            var encodedToken = new JwtSecurityTokenHandler().WriteToken(token);
            return (encodedToken, expires);
        }
    }
}
