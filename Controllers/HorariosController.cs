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
    /// Endpoints para gestión de horarios disponibles
    /// </summary>
    [ApiController]
    [Route("api/[controller]")]
    [Authorize]
    public class HorariosController : ControllerBase
    {
        private readonly AcademicoDbContext _db;
        private readonly HorarioService _horarioService;

        public HorariosController(AcademicoDbContext db, HorarioService horarioService)
        {
            _db = db;
            _horarioService = horarioService;
        }

        /// <summary>
        /// Obtiene todos los horarios disponibles
        /// </summary>
        [HttpGet]
        public async Task<IActionResult> GetAll([FromQuery] int? idMedico = null)
        {
            var query = _db.HorariosDisponibles
                .AsNoTracking()
                .Include(h => h.Medico)
                .AsQueryable();

            if (idMedico.HasValue)
                query = query.Where(h => h.idMedico == idMedico.Value);

            var horarios = await query
                .Select(h => new HorarioDisponibleDto
                {
                    IdHorarioDisponible = h.idHorarioDisponible,
                    IdMedico = h.idMedico,
                    NombreMedico = h.Medico != null 
                        ? $"{h.Medico.nombreMedico} {h.Medico.apellidoPaternoMedico}" 
                        : null,
                    FechaDisponible = h.fechaDisponible,
                    HoraInicioDisponible = h.horaInicioDisponible,
                    HoraFinDisponible = h.horaFinDisponible,
                    Disponible = h.disponible
                })
                .ToListAsync();

            return Ok(horarios);
        }

        /// <summary>
        /// Obtiene un horario por ID
        /// </summary>
        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            var horario = await _db.HorariosDisponibles
                .AsNoTracking()
                .Include(h => h.Medico)
                .Where(h => h.idHorarioDisponible == id)
                .Select(h => new HorarioDisponibleDto
                {
                    IdHorarioDisponible = h.idHorarioDisponible,
                    IdMedico = h.idMedico,
                    NombreMedico = h.Medico != null 
                        ? $"{h.Medico.nombreMedico} {h.Medico.apellidoPaternoMedico}" 
                        : null,
                    FechaDisponible = h.fechaDisponible,
                    HoraInicioDisponible = h.horaInicioDisponible,
                    HoraFinDisponible = h.horaFinDisponible,
                    Disponible = h.disponible
                })
                .FirstOrDefaultAsync();

            if (horario == null)
                throw ExceptionCatalog.BadRequest($"Horario con id {id} no encontrado.");

            return Ok(horario);
        }

        /// <summary>
        /// Crea un nuevo horario disponible
        /// </summary>
        [HttpPost]
        [Authorize(Roles = "Administrador,Médico")]
        public async Task<IActionResult> Create([FromBody] CrearHorarioDisponibleDto dto)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            // Validar médico
            var medicoValido = await _horarioService.ValidarMedicoAsync(dto.IdMedico);
            if (!medicoValido)
                throw ExceptionCatalog.BadRequest("El médico especificado no existe o no está activo.");

            // Validar horario único
            var horarioUnico = await _horarioService.ValidarHorarioUnicoAsync(
                dto.IdMedico, 
                dto.FechaDisponible, 
                dto.HoraInicioDisponible
            );
            if (!horarioUnico)
                throw ExceptionCatalog.BadRequest("Ya existe un horario para este médico en la fecha y hora especificadas.");

            var horario = new HorarioDisponible
            {
                idMedico = dto.IdMedico,
                fechaDisponible = dto.FechaDisponible.Date,
                horaInicioDisponible = dto.HoraInicioDisponible,
                horaFinDisponible = dto.HoraFinDisponible,
                disponible = true,
                fechaCreacion = System.DateTime.UtcNow,
                fechaActualizacion = System.DateTime.UtcNow
            };

            _db.HorariosDisponibles.Add(horario);
            await _db.SaveChangesAsync();

            return CreatedAtAction(nameof(GetById), new { id = horario.idHorarioDisponible }, horario);
        }

        /// <summary>
        /// Actualiza un horario disponible
        /// </summary>
        [HttpPut("{id}")]
        [Authorize(Roles = "Administrador,Médico")]
        public async Task<IActionResult> Update(int id, [FromBody] CrearHorarioDisponibleDto dto)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            var horario = await _db.HorariosDisponibles.FindAsync(id);
            if (horario == null)
                throw ExceptionCatalog.BadRequest($"Horario con id {id} no encontrado.");

            // Validar médico
            var medicoValido = await _horarioService.ValidarMedicoAsync(dto.IdMedico);
            if (!medicoValido)
                throw ExceptionCatalog.BadRequest("El médico especificado no existe o no está activo.");

            // Validar horario único
            var horarioUnico = await _horarioService.ValidarHorarioUnicoAsync(
                dto.IdMedico, 
                dto.FechaDisponible, 
                dto.HoraInicioDisponible,
                id
            );
            if (!horarioUnico)
                throw ExceptionCatalog.BadRequest("Ya existe un horario para este médico en la fecha y hora especificadas.");

            horario.idMedico = dto.IdMedico;
            horario.fechaDisponible = dto.FechaDisponible.Date;
            horario.horaInicioDisponible = dto.HoraInicioDisponible;
            horario.horaFinDisponible = dto.HoraFinDisponible;
            horario.fechaActualizacion = System.DateTime.UtcNow;

            await _db.SaveChangesAsync();

            return NoContent();
        }

        /// <summary>
        /// Elimina un horario disponible
        /// </summary>
        [HttpDelete("{id}")]
        [Authorize(Roles = "Administrador,Médico")]
        public async Task<IActionResult> Delete(int id)
        {
            var horario = await _db.HorariosDisponibles.FindAsync(id);
            if (horario == null)
                throw ExceptionCatalog.BadRequest($"Horario con id {id} no encontrado.");

            _db.HorariosDisponibles.Remove(horario);
            await _db.SaveChangesAsync();

            return NoContent();
        }
    }
}

