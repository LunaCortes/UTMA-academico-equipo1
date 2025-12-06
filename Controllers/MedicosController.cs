using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Authorization;
using utma_academico_aspnetcore.Data;
using utma_academico_aspnetcore.DTOs;
using utma_academico_aspnetcore.Models;
using utma_academico_aspnetcore.Services;
using utma_academico_aspnetcore.Exceptions;

namespace utma_academico_aspnetcore.Controllers
{
    /// <summary>
    /// Endpoints para gestión de médicos
    /// </summary>
    [ApiController]
    [Route("api/[controller]")]
    [Authorize]
    public class MedicosController : ControllerBase
    {
        private readonly AcademicoDbContext _db;
        private readonly MedicoService _medicoService;

        public MedicosController(AcademicoDbContext db, MedicoService medicoService)
        {
            _db = db;
            _medicoService = medicoService;
        }

        /// <summary>
        /// Obtiene todos los médicos activos
        /// </summary>
        [HttpGet]
        public async Task<IActionResult> GetAll()
        {
            var medicos = await _db.Medicos
                .AsNoTracking()
                .Include(m => m.Especialidad)
                .Where(m => m.activo)
                .Select(m => new MedicoDto
                {
                    IdMedico = m.idMedico,
                    NombreMedico = m.nombreMedico,
                    ApellidoPaternoMedico = m.apellidoPaternoMedico,
                    ApellidoMaternoMedico = m.apellidoMaternoMedico,
                    CedulaProfesionalMedico = m.cedulaProfesionalMedico,
                    IdEspecialidad = m.idEspecialidad,
                    NombreEspecialidad = m.Especialidad != null ? m.Especialidad.nombreEspecialidad : null,
                    TelefonoMedico = m.telefonoMedico,
                    EmailMedico = m.emailMedico,
                    ConsultorioMedico = m.consultorioMedico,
                    HorarioInicioMedico = m.horarioInicioMedico,
                    HorarioFinMedico = m.horarioFinMedico,
                    Activo = m.activo,
                    IdUsuario = m.idUsuario
                })
                .ToListAsync();

            return Ok(medicos);
        }

        /// <summary>
        /// Obtiene un médico por ID
        /// </summary>
        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            var medico = await _db.Medicos
                .AsNoTracking()
                .Include(m => m.Especialidad)
                .Where(m => m.idMedico == id)
                .Select(m => new MedicoDto
                {
                    IdMedico = m.idMedico,
                    NombreMedico = m.nombreMedico,
                    ApellidoPaternoMedico = m.apellidoPaternoMedico,
                    ApellidoMaternoMedico = m.apellidoMaternoMedico,
                    CedulaProfesionalMedico = m.cedulaProfesionalMedico,
                    IdEspecialidad = m.idEspecialidad,
                    NombreEspecialidad = m.Especialidad != null ? m.Especialidad.nombreEspecialidad : null,
                    TelefonoMedico = m.telefonoMedico,
                    EmailMedico = m.emailMedico,
                    ConsultorioMedico = m.consultorioMedico,
                    HorarioInicioMedico = m.horarioInicioMedico,
                    HorarioFinMedico = m.horarioFinMedico,
                    Activo = m.activo,
                    IdUsuario = m.idUsuario
                })
                .FirstOrDefaultAsync();

            if (medico == null)
                throw ExceptionCatalog.BadRequest($"Médico con id {id} no encontrado.");

            return Ok(medico);
        }

        /// <summary>
        /// Crea un nuevo médico
        /// </summary>
        [HttpPost]
        [Authorize(Roles = "Administrador")]
        public async Task<IActionResult> Create([FromBody] CrearMedicoDto dto)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            // Validar cédula única
            var cedulaUnica = await _medicoService.ValidarCedulaUnicaAsync(dto.CedulaProfesionalMedico);
            if (!cedulaUnica)
                throw ExceptionCatalog.BadRequest("La cédula profesional ya está registrada.");

            // Validar especialidad
            var especialidadValida = await _medicoService.ValidarEspecialidadAsync(dto.IdEspecialidad);
            if (!especialidadValida)
                throw ExceptionCatalog.BadRequest("La especialidad especificada no existe.");

            var medico = new Medico
            {
                nombreMedico = dto.NombreMedico,
                apellidoPaternoMedico = dto.ApellidoPaternoMedico,
                apellidoMaternoMedico = dto.ApellidoMaternoMedico,
                cedulaProfesionalMedico = dto.CedulaProfesionalMedico,
                idEspecialidad = dto.IdEspecialidad,
                telefonoMedico = dto.TelefonoMedico,
                emailMedico = dto.EmailMedico,
                consultorioMedico = dto.ConsultorioMedico,
                horarioInicioMedico = dto.HorarioInicioMedico,
                horarioFinMedico = dto.HorarioFinMedico,
                activo = true,
                idUsuario = dto.IdUsuario,
                fechaCreacion = System.DateTime.UtcNow,
                fechaActualizacion = System.DateTime.UtcNow
            };

            _db.Medicos.Add(medico);
            await _db.SaveChangesAsync();

            return CreatedAtAction(nameof(GetById), new { id = medico.idMedico }, medico);
        }

        /// <summary>
        /// Actualiza un médico existente
        /// </summary>
        [HttpPut("{id}")]
        [Authorize(Roles = "Administrador")]
        public async Task<IActionResult> Update(int id, [FromBody] CrearMedicoDto dto)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            var medico = await _db.Medicos.FindAsync(id);
            if (medico == null)
                throw ExceptionCatalog.BadRequest($"Médico con id {id} no encontrado.");

            // Validar cédula única
            var cedulaUnica = await _medicoService.ValidarCedulaUnicaAsync(dto.CedulaProfesionalMedico, id);
            if (!cedulaUnica)
                throw ExceptionCatalog.BadRequest("La cédula profesional ya está registrada.");

            // Validar especialidad
            var especialidadValida = await _medicoService.ValidarEspecialidadAsync(dto.IdEspecialidad);
            if (!especialidadValida)
                throw ExceptionCatalog.BadRequest("La especialidad especificada no existe.");

            medico.nombreMedico = dto.NombreMedico;
            medico.apellidoPaternoMedico = dto.ApellidoPaternoMedico;
            medico.apellidoMaternoMedico = dto.ApellidoMaternoMedico;
            medico.cedulaProfesionalMedico = dto.CedulaProfesionalMedico;
            medico.idEspecialidad = dto.IdEspecialidad;
            medico.telefonoMedico = dto.TelefonoMedico;
            medico.emailMedico = dto.EmailMedico;
            medico.consultorioMedico = dto.ConsultorioMedico;
            medico.horarioInicioMedico = dto.HorarioInicioMedico;
            medico.horarioFinMedico = dto.HorarioFinMedico;
            medico.idUsuario = dto.IdUsuario;
            medico.fechaActualizacion = System.DateTime.UtcNow;

            await _db.SaveChangesAsync();

            return NoContent();
        }

        /// <summary>
        /// Desactiva un médico (soft delete)
        /// </summary>
        [HttpDelete("{id}")]
        [Authorize(Roles = "Administrador")]
        public async Task<IActionResult> Delete(int id)
        {
            var medico = await _db.Medicos.FindAsync(id);
            if (medico == null)
                throw ExceptionCatalog.BadRequest($"Médico con id {id} no encontrado.");

            medico.activo = false;
            medico.fechaActualizacion = System.DateTime.UtcNow;

            await _db.SaveChangesAsync();

            return NoContent();
        }
    }
}

