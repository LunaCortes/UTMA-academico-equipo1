using System;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using utma_academico_aspnetcore.Data;
using utma_academico_aspnetcore.Models;
using utma_academico_aspnetcore.Exceptions;

namespace utma_academico_aspnetcore.Services
{
    /// <summary>
    /// Servicio para gestión de citas médicas
    /// </summary>
    public class CitaService
    {
        private readonly AcademicoDbContext _db;

        public CitaService(AcademicoDbContext db)
        {
            _db = db;
        }

        /// <summary>
        /// Valida que no exista una cita duplicada para el mismo médico en la misma fecha y hora
        /// </summary>
        public async Task<bool> ValidarDisponibilidadAsync(int idMedico, DateTime fechaCita, TimeSpan horaCita, int? idCitaExcluir = null)
        {
            var existeCita = await _db.CitasMedicas
                .AnyAsync(c => c.idMedico == idMedico
                    && c.fechaCita.Date == fechaCita.Date
                    && c.horaCita == horaCita
                    && (idCitaExcluir == null || c.idCitaMedica != idCitaExcluir)
                    && c.idEstadoCita != 3); // No considerar citas canceladas

            return !existeCita;
        }

        /// <summary>
        /// Valida que el horario esté disponible
        /// </summary>
        public async Task<bool> ValidarHorarioDisponibleAsync(int idMedico, DateTime fechaCita, TimeSpan horaCita)
        {
            var horario = await _db.HorariosDisponibles
                .FirstOrDefaultAsync(h => h.idMedico == idMedico
                    && h.fechaDisponible.Date == fechaCita.Date
                    && h.horaInicioDisponible <= horaCita
                    && h.horaFinDisponible >= horaCita
                    && h.disponible);

            return horario != null;
        }

        /// <summary>
        /// Crea una nueva cita médica
        /// </summary>
        public async Task<CitaMedica> CrearCitaAsync(CitaMedica cita)
        {
            // Validar que el paciente existe
            var paciente = await _db.Pacientes.FindAsync(cita.idPaciente);
            if (paciente == null)
                throw ExceptionCatalog.BadRequest("El paciente especificado no existe.");

            // Validar que el médico existe y está activo
            var medico = await _db.Medicos.FindAsync(cita.idMedico);
            if (medico == null)
                throw ExceptionCatalog.BadRequest("El médico especificado no existe.");
            if (!medico.activo)
                throw ExceptionCatalog.BadRequest("El médico especificado no está activo.");

            // Validar disponibilidad
            var disponible = await ValidarDisponibilidadAsync(cita.idMedico, cita.fechaCita, cita.horaCita);
            if (!disponible)
                throw ExceptionCatalog.BadRequest("El horario seleccionado no está disponible.");

            // Validar que el estado de cita existe
            var estadoCita = await _db.EstadosCita.FindAsync(cita.idEstadoCita);
            if (estadoCita == null)
                throw ExceptionCatalog.BadRequest("El estado de cita especificado no existe.");

            // Establecer fecha de creación
            cita.fechaCreacion = DateTime.UtcNow;
            cita.fechaActualizacion = DateTime.UtcNow;

            _db.CitasMedicas.Add(cita);
            await _db.SaveChangesAsync();

            return cita;
        }

        /// <summary>
        /// Actualiza el estado de una cita
        /// </summary>
        public async Task<CitaMedica> ActualizarEstadoCitaAsync(int idCita, int nuevoEstado)
        {
            var cita = await _db.CitasMedicas.FindAsync(idCita);
            if (cita == null)
                throw ExceptionCatalog.BadRequest("La cita especificada no existe.");

            var estado = await _db.EstadosCita.FindAsync(nuevoEstado);
            if (estado == null)
                throw ExceptionCatalog.BadRequest("El estado de cita especificado no existe.");

            cita.idEstadoCita = nuevoEstado;
            cita.fechaActualizacion = DateTime.UtcNow;

            await _db.SaveChangesAsync();

            return cita;
        }
    }
}

