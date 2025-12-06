using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using utma_academico_aspnetcore.Data;
using utma_academico_aspnetcore.DTOs;
using utma_academico_aspnetcore.Services;
using utma_academico_aspnetcore.Exceptions;
using Microsoft.AspNetCore.Authorization;
using BCrypt.Net;

namespace utma_academico_aspnetcore.Controllers
{
    /// <summary>
    /// Endpoint de autenticación para obtener tokens JWT.
    /// </summary>
    [ApiController]
    [Route("api/[controller]")]
    public class AuthController : ControllerBase
    {
        private readonly AcademicoDbContext _db;
        private readonly JwtService _jwtService;

        public AuthController(AcademicoDbContext db, JwtService jwtService)
        {
            _db = db;
            _jwtService = jwtService;
        }

        /// <summary>
        /// Obtener token JWT usando email y contraseña.
        /// Valida las credenciales con BCrypt y genera un token con información de usuario y rol.
        /// </summary>
        /// <param name="dto">Email y contraseña del usuario</param>
        [HttpPost("login")]
        [AllowAnonymous]
        public async Task<IActionResult> Login([FromBody] LoginMedicoDto? dto)
        {
            // Validar que el DTO no sea null
            if (dto == null)
            {
                return BadRequest(new { 
                    message = "El cuerpo de la petición es requerido. Debe incluir emailUsuario y passwordUsuario.",
                    errors = new { 
                        dto = new[] { "El objeto de login es requerido" }
                    }
                });
            }

            // Limpiar caracteres de nueva línea y espacios en blanco
            if (!string.IsNullOrEmpty(dto.EmailUsuario))
                dto.EmailUsuario = dto.EmailUsuario.Trim();
            
            if (!string.IsNullOrEmpty(dto.PasswordUsuario))
                dto.PasswordUsuario = dto.PasswordUsuario.Trim().Replace("\n", "").Replace("\r", "");

            // Validación del modelo
            if (!ModelState.IsValid)
            {
                var errors = ModelState
                    .Where(x => x.Value?.Errors.Count > 0)
                    .ToDictionary(
                        kvp => kvp.Key,
                        kvp => kvp.Value?.Errors.Select(e => e.ErrorMessage).ToArray() ?? Array.Empty<string>()
                    );
                
                return BadRequest(new { 
                    message = "Error de validación",
                    errors = errors
                });
            }

            // Buscar usuario por email
            var usuario = await _db.Usuarios
                .Include(u => u.Rol)
                .FirstOrDefaultAsync(u => u.emailUsuario == dto.EmailUsuario);

            if (usuario == null)
                throw ExceptionCatalog.Unauthorized("Credenciales inválidas.");

            if (!usuario.activo)
                throw ExceptionCatalog.Unauthorized("Usuario inactivo.");

            // Validar contraseña con BCrypt
            if (!BCrypt.Net.BCrypt.Verify(dto.PasswordUsuario, usuario.passwordUsuario))
                throw ExceptionCatalog.Unauthorized("Credenciales inválidas.");

            // Obtener nombre del rol
            var nombreRol = usuario.Rol?.nombreRol ?? "Usuario";

            // Generar token con información de usuario y rol
            var (token, expires) = _jwtService.GenerateToken(
                usuario.idUsuario,
                usuario.emailUsuario,
                nombreRol
            );

            // Retornar token en DTO
            return Ok(new TokenResponseDto
            {
                Token = token,
                ExpiresAt = expires
            });
        }
    }
}
