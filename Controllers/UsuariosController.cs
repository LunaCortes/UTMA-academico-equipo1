using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Authorization;
using utma_academico_aspnetcore.Data;
using utma_academico_aspnetcore.DTOs;
using utma_academico_aspnetcore.Models;
using BCrypt.Net;

namespace utma_academico_aspnetcore.Controllers
{
    /// <summary>
    /// Endpoints para gestión de usuarios
    /// </summary>
    [ApiController]
    [Route("api/[controller]")]
    [Authorize(Roles = "Administrador")]
    public class UsuariosController : ControllerBase
    {
        private readonly AcademicoDbContext _db;

        public UsuariosController(AcademicoDbContext db)
        {
            _db = db;
        }

        /// <summary>
        /// Obtiene todos los usuarios
        /// </summary>
        [HttpGet]
        public async Task<IActionResult> GetAll()
        {
            var usuarios = await _db.Usuarios
                .AsNoTracking()
                .Include(u => u.Rol)
                .Select(u => new UsuarioDto
                {
                    IdUsuario = u.idUsuario,
                    NombreUsuario = u.nombreUsuario,
                    EmailUsuario = u.emailUsuario,
                    IdRol = u.idRol,
                    NombreRol = u.Rol != null ? u.Rol.nombreRol : null,
                    Activo = u.activo
                })
                .ToListAsync();

            return Ok(usuarios);
        }

        /// <summary>
        /// Obtiene un usuario por ID
        /// </summary>
        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            var usuario = await _db.Usuarios
                .AsNoTracking()
                .Include(u => u.Rol)
                .Where(u => u.idUsuario == id)
                .Select(u => new UsuarioDto
                {
                    IdUsuario = u.idUsuario,
                    NombreUsuario = u.nombreUsuario,
                    EmailUsuario = u.emailUsuario,
                    IdRol = u.idRol,
                    NombreRol = u.Rol != null ? u.Rol.nombreRol : null,
                    Activo = u.activo
                })
                .FirstOrDefaultAsync();

            if (usuario == null)
                return NotFound();

            return Ok(usuario);
        }

        /// <summary>
        /// Crea un nuevo usuario
        /// </summary>
        [HttpPost]
        public async Task<IActionResult> Create([FromBody] CrearUsuarioDto dto)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            // Validar email único
            var emailExiste = await _db.Usuarios.AnyAsync(u => u.emailUsuario == dto.EmailUsuario);
            if (emailExiste)
                return BadRequest("El email ya está registrado.");

            // Validar nombre de usuario único
            var nombreExiste = await _db.Usuarios.AnyAsync(u => u.nombreUsuario == dto.NombreUsuario);
            if (nombreExiste)
                return BadRequest("El nombre de usuario ya está registrado.");

            // Validar rol
            var rolExiste = await _db.Roles.AnyAsync(r => r.idRol == dto.IdRol);
            if (!rolExiste)
                return BadRequest("El rol especificado no existe.");

            // Hash de contraseña con BCrypt
            var passwordHash = BCrypt.Net.BCrypt.HashPassword(dto.PasswordUsuario);

            var usuario = new UsuarioMedico
            {
                nombreUsuario = dto.NombreUsuario,
                emailUsuario = dto.EmailUsuario,
                passwordUsuario = passwordHash,
                idRol = dto.IdRol,
                activo = true,
                fechaCreacion = System.DateTime.UtcNow,
                fechaActualizacion = System.DateTime.UtcNow
            };

            _db.Usuarios.Add(usuario);
            await _db.SaveChangesAsync();

            return CreatedAtAction(nameof(GetById), new { id = usuario.idUsuario }, usuario);
        }
    }
}

