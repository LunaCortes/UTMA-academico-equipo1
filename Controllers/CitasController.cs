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
    /// Endpoints para gestión de citas médicas
    /// </summary>
    [ApiController]
    [Route("api/[controller]")]
    [Authorize]
    public class CitasController : ControllerBase
    {
        private readonly AcademicoDbContext _db;
        private readonly CitaService _citaService;

        public CitasController(AcademicoDbContext db, CitaService citaService)
        {
            _db = db;
            _citaService = citaService;
        }

        /// <summary>
        /// Obtiene todas las citas médicas
        /// </summary>
        [HttpGet]
        public async Task<IActionResult> GetAll([FromQuery] int? idPaciente = null, [FromQuery] int? idMedico = null)
        {
            var query = _db.CitasMedicas
                .AsNoTracking()
                .Include(c => c.Paciente)
                .Include(c => c.Medico)
                .Include(c => c.EstadoCita)
                .AsQueryable();

            if (idPaciente.HasValue)
                query = query.Where(c => c.idPaciente == idPaciente.Value);

            if (idMedico.HasValue)
                query = query.Where(c => c.idMedico == idMedico.Value);

            var citas = await query
                .Select(c => new CitaMedicaDto
                {
                    IdCitaMedica = c.idCitaMedica,
                    IdPaciente = c.idPaciente,
                    NombrePaciente = c.Paciente != null 
                        ? $"{c.Paciente.nombrePaciente} {c.Paciente.apellidoPaternoPaciente}" 
                        : null,
                    IdMedico = c.idMedico,
                    NombreMedico = c.Medico != null 
                        ? $"{c.Medico.nombreMedico} {c.Medico.apellidoPaternoMedico}" 
                        : null,
                    FechaCita = c.fechaCita,
                    HoraCita = c.horaCita,
                    IdEstadoCita = c.idEstadoCita,
                    NombreEstadoCita = c.EstadoCita != null ? c.EstadoCita.nombreEstado : null,
                    MotivoCita = c.motivoCita,
                    ObservacionesCita = c.observacionesCita,
                    DuracionEstimadaCita = c.duracionEstimadaCita,
                    CostoConsulta = c.costoConsulta
                })
                .OrderByDescending(c => c.FechaCita)
                .ThenByDescending(c => c.HoraCita)
                .ToListAsync();

            return Ok(citas);
        }

        /// <summary>
        /// Obtiene una cita por ID
        /// </summary>
        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            var cita = await _db.CitasMedicas
                .AsNoTracking()
                .Include(c => c.Paciente)
                .Include(c => c.Medico)
                .Include(c => c.EstadoCita)
                .Where(c => c.idCitaMedica == id)
                .Select(c => new CitaMedicaDto
                {
                    IdCitaMedica = c.idCitaMedica,
                    IdPaciente = c.idPaciente,
                    NombrePaciente = c.Paciente != null 
                        ? $"{c.Paciente.nombrePaciente} {c.Paciente.apellidoPaternoPaciente}" 
                        : null,
                    IdMedico = c.idMedico,
                    NombreMedico = c.Medico != null 
                        ? $"{c.Medico.nombreMedico} {c.Medico.apellidoPaternoMedico}" 
                        : null,
                    FechaCita = c.fechaCita,
                    HoraCita = c.horaCita,
                    IdEstadoCita = c.idEstadoCita,
                    NombreEstadoCita = c.EstadoCita != null ? c.EstadoCita.nombreEstado : null,
                    MotivoCita = c.motivoCita,
                    ObservacionesCita = c.observacionesCita,
                    DuracionEstimadaCita = c.duracionEstimadaCita,
                    CostoConsulta = c.costoConsulta
                })
                .FirstOrDefaultAsync();

            if (cita == null)
                throw ExceptionCatalog.BadRequest($"Cita con id {id} no encontrada.");

            return Ok(cita);
        }

        /// <summary>
        /// Crea una nueva cita médica
        /// </summary>
        [HttpPost]
        [Authorize(Roles = "Administrador,Recepcionista,Paciente")]
        public async Task<IActionResult> Create([FromBody] CrearCitaMedicaDto dto)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            var cita = new CitaMedica
            {
                idPaciente = dto.IdPaciente,
                idMedico = dto.IdMedico,
                fechaCita = dto.FechaCita.Date,
                horaCita = dto.HoraCita,
                idEstadoCita = 1, // Programada por defecto
                motivoCita = dto.MotivoCita,
                observacionesCita = dto.ObservacionesCita,
                duracionEstimadaCita = dto.DuracionEstimadaCita,
                costoConsulta = dto.CostoConsulta
            };

            await _citaService.CrearCitaAsync(cita);

            return CreatedAtAction(nameof(GetById), new { id = cita.idCitaMedica }, cita);
        }

        /// <summary>
        /// Actualiza el estado de una cita
        /// </summary>
        [HttpPut("{id}/estado")]
        [Authorize(Roles = "Administrador,Médico,Recepcionista")]
        public async Task<IActionResult> ActualizarEstado(int id, [FromBody] int nuevoEstado)
        {
            var cita = await _citaService.ActualizarEstadoCitaAsync(id, nuevoEstado);
            return Ok(cita);
        }

        /// <summary>
        /// Actualiza una cita médica
        /// </summary>
        [HttpPut("{id}")]
        [Authorize(Roles = "Administrador,Recepcionista")]
        public async Task<IActionResult> Update(int id, [FromBody] CrearCitaMedicaDto dto)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            var cita = await _db.CitasMedicas.FindAsync(id);
            if (cita == null)
                throw ExceptionCatalog.BadRequest($"Cita con id {id} no encontrada.");

            // Validar disponibilidad (excluyendo la cita actual)
            var disponible = await _citaService.ValidarDisponibilidadAsync(
                dto.IdMedico, 
                dto.FechaCita, 
                dto.HoraCita, 
                id
            );
            if (!disponible)
                throw ExceptionCatalog.BadRequest("El horario seleccionado no está disponible.");

            cita.idPaciente = dto.IdPaciente;
            cita.idMedico = dto.IdMedico;
            cita.fechaCita = dto.FechaCita.Date;
            cita.horaCita = dto.HoraCita;
            cita.motivoCita = dto.MotivoCita;
            cita.observacionesCita = dto.ObservacionesCita;
            cita.duracionEstimadaCita = dto.DuracionEstimadaCita;
            cita.costoConsulta = dto.CostoConsulta;
            cita.fechaActualizacion = System.DateTime.UtcNow;

            await _db.SaveChangesAsync();

            return NoContent();
        }

        /// <summary>
        /// Elimina una cita médica
        /// </summary>
        [HttpDelete("{id}")]
        [Authorize(Roles = "Administrador")]
        public async Task<IActionResult> Delete(int id)
        {
            var cita = await _db.CitasMedicas.FindAsync(id);
            if (cita == null)
                throw ExceptionCatalog.BadRequest($"Cita con id {id} no encontrada.");

            _db.CitasMedicas.Remove(cita);
            await _db.SaveChangesAsync();

            return NoContent();
        }
    }
}

