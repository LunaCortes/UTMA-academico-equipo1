using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Authorization;
using utma_academico_aspnetcore.Data;

namespace utma_academico_aspnetcore.Controllers
{
    /// <summary>
    /// Endpoints para consultar catálogos del sistema
    /// </summary>
    [ApiController]
    [Route("api/[controller]")]
    [Authorize]
    public class CatalogosController : ControllerBase
    {
        private readonly AcademicoDbContext _db;

        public CatalogosController(AcademicoDbContext db)
        {
            _db = db;
        }

        /// <summary>
        /// Obtiene todos los roles disponibles
        /// </summary>
        [HttpGet("roles")]
        public async Task<IActionResult> GetRoles()
        {
            var roles = await _db.Roles
                .AsNoTracking()
                .Select(r => new { r.idRol, r.nombreRol, r.descripcionRol })
                .ToListAsync();

            return Ok(roles);
        }

        /// <summary>
        /// Obtiene todas las especialidades médicas
        /// </summary>
        [HttpGet("especialidades")]
        public async Task<IActionResult> GetEspecialidades()
        {
            var especialidades = await _db.Especialidades
                .AsNoTracking()
                .Select(e => new { e.idEspecialidad, e.nombreEspecialidad, e.descripcionEspecialidad })
                .ToListAsync();

            return Ok(especialidades);
        }

        /// <summary>
        /// Obtiene todos los estados de cita
        /// </summary>
        [HttpGet("estados-cita")]
        public async Task<IActionResult> GetEstadosCita()
        {
            var estados = await _db.EstadosCita
                .AsNoTracking()
                .Select(e => new { e.idEstadoCita, e.nombreEstado, e.descripcionEstado })
                .ToListAsync();

            return Ok(estados);
        }
    }
}

