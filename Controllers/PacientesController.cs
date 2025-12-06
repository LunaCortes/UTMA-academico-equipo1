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
    /// Endpoints para gestión de pacientes
    /// </summary>
    [ApiController]
    [Route("api/[controller]")]
    [Authorize]
    public class PacientesController : ControllerBase
    {
        private readonly AcademicoDbContext _db;
        private readonly PacienteService _pacienteService;

        public PacientesController(AcademicoDbContext db, PacienteService pacienteService)
        {
            _db = db;
            _pacienteService = pacienteService;
        }

        /// <summary>
        /// Obtiene todos los pacientes
        /// </summary>
        [HttpGet]
        public async Task<IActionResult> GetAll()
        {
            var pacientes = await _db.Pacientes
                .AsNoTracking()
                .Select(p => new PacienteDto
                {
                    IdPaciente = p.idPaciente,
                    NombrePaciente = p.nombrePaciente,
                    ApellidoPaternoPaciente = p.apellidoPaternoPaciente,
                    ApellidoMaternoPaciente = p.apellidoMaternoPaciente,
                    FechaNacimientoPaciente = p.fechaNacimientoPaciente,
                    TelefonoPaciente = p.telefonoPaciente,
                    EmailPaciente = p.emailPaciente,
                    DireccionPaciente = p.direccionPaciente,
                    NumeroSeguroSocial = p.numeroSeguroSocial,
                    TipoSangrePaciente = p.tipoSangrePaciente,
                    AlergiasPaciente = p.alergiasPaciente,
                    IdUsuario = p.idUsuario
                })
                .ToListAsync();

            return Ok(pacientes);
        }

        /// <summary>
        /// Obtiene un paciente por ID
        /// </summary>
        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            var paciente = await _db.Pacientes
                .AsNoTracking()
                .Where(p => p.idPaciente == id)
                .Select(p => new PacienteDto
                {
                    IdPaciente = p.idPaciente,
                    NombrePaciente = p.nombrePaciente,
                    ApellidoPaternoPaciente = p.apellidoPaternoPaciente,
                    ApellidoMaternoPaciente = p.apellidoMaternoPaciente,
                    FechaNacimientoPaciente = p.fechaNacimientoPaciente,
                    TelefonoPaciente = p.telefonoPaciente,
                    EmailPaciente = p.emailPaciente,
                    DireccionPaciente = p.direccionPaciente,
                    NumeroSeguroSocial = p.numeroSeguroSocial,
                    TipoSangrePaciente = p.tipoSangrePaciente,
                    AlergiasPaciente = p.alergiasPaciente,
                    IdUsuario = p.idUsuario
                })
                .FirstOrDefaultAsync();

            if (paciente == null)
                throw ExceptionCatalog.BadRequest($"Paciente con id {id} no encontrado.");

            return Ok(paciente);
        }

        /// <summary>
        /// Crea un nuevo paciente
        /// </summary>
        [HttpPost]
        [Authorize(Roles = "Administrador,Recepcionista")]
        public async Task<IActionResult> Create([FromBody] CrearPacienteDto dto)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            // Validar email único
            if (!string.IsNullOrEmpty(dto.EmailPaciente))
            {
                var emailUnico = await _pacienteService.ValidarEmailUnicoAsync(dto.EmailPaciente);
                if (!emailUnico)
                    throw ExceptionCatalog.BadRequest("El email ya está registrado para otro paciente.");
            }

            // Validar número de seguro social único
            if (!string.IsNullOrEmpty(dto.NumeroSeguroSocial))
            {
                var nssUnico = await _pacienteService.ValidarNumeroSeguroSocialUnicoAsync(dto.NumeroSeguroSocial);
                if (!nssUnico)
                    throw ExceptionCatalog.BadRequest("El número de seguro social ya está registrado.");
            }

            var paciente = new Paciente
            {
                nombrePaciente = dto.NombrePaciente,
                apellidoPaternoPaciente = dto.ApellidoPaternoPaciente,
                apellidoMaternoPaciente = dto.ApellidoMaternoPaciente,
                fechaNacimientoPaciente = dto.FechaNacimientoPaciente,
                telefonoPaciente = dto.TelefonoPaciente,
                emailPaciente = dto.EmailPaciente,
                direccionPaciente = dto.DireccionPaciente,
                numeroSeguroSocial = dto.NumeroSeguroSocial,
                tipoSangrePaciente = dto.TipoSangrePaciente,
                alergiasPaciente = dto.AlergiasPaciente,
                idUsuario = dto.IdUsuario,
                fechaCreacion = System.DateTime.UtcNow,
                fechaActualizacion = System.DateTime.UtcNow
            };

            _db.Pacientes.Add(paciente);
            await _db.SaveChangesAsync();

            return CreatedAtAction(nameof(GetById), new { id = paciente.idPaciente }, paciente);
        }

        /// <summary>
        /// Actualiza un paciente existente
        /// </summary>
        [HttpPut("{id}")]
        [Authorize(Roles = "Administrador,Recepcionista")]
        public async Task<IActionResult> Update(int id, [FromBody] CrearPacienteDto dto)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            var paciente = await _db.Pacientes.FindAsync(id);
            if (paciente == null)
                throw ExceptionCatalog.BadRequest($"Paciente con id {id} no encontrado.");

            // Validar email único
            if (!string.IsNullOrEmpty(dto.EmailPaciente))
            {
                var emailUnico = await _pacienteService.ValidarEmailUnicoAsync(dto.EmailPaciente, id);
                if (!emailUnico)
                    throw ExceptionCatalog.BadRequest("El email ya está registrado para otro paciente.");
            }

            // Validar número de seguro social único
            if (!string.IsNullOrEmpty(dto.NumeroSeguroSocial))
            {
                var nssUnico = await _pacienteService.ValidarNumeroSeguroSocialUnicoAsync(dto.NumeroSeguroSocial, id);
                if (!nssUnico)
                    throw ExceptionCatalog.BadRequest("El número de seguro social ya está registrado.");
            }

            paciente.nombrePaciente = dto.NombrePaciente;
            paciente.apellidoPaternoPaciente = dto.ApellidoPaternoPaciente;
            paciente.apellidoMaternoPaciente = dto.ApellidoMaternoPaciente;
            paciente.fechaNacimientoPaciente = dto.FechaNacimientoPaciente;
            paciente.telefonoPaciente = dto.TelefonoPaciente;
            paciente.emailPaciente = dto.EmailPaciente;
            paciente.direccionPaciente = dto.DireccionPaciente;
            paciente.numeroSeguroSocial = dto.NumeroSeguroSocial;
            paciente.tipoSangrePaciente = dto.TipoSangrePaciente;
            paciente.alergiasPaciente = dto.AlergiasPaciente;
            paciente.idUsuario = dto.IdUsuario;
            paciente.fechaActualizacion = System.DateTime.UtcNow;

            await _db.SaveChangesAsync();

            return NoContent();
        }

        /// <summary>
        /// Elimina un paciente
        /// </summary>
        [HttpDelete("{id}")]
        [Authorize(Roles = "Administrador")]
        public async Task<IActionResult> Delete(int id)
        {
            var paciente = await _db.Pacientes.FindAsync(id);
            if (paciente == null)
                throw ExceptionCatalog.BadRequest($"Paciente con id {id} no encontrado.");

            _db.Pacientes.Remove(paciente);
            await _db.SaveChangesAsync();

            return NoContent();
        }
    }
}

