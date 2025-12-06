using System;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using utma_academico_aspnetcore.Data;
using utma_academico_aspnetcore.Exceptions;

namespace utma_academico_aspnetcore.Services
{
    /// <summary>
    /// Servicio para gestión de horarios disponibles
    /// </summary>
    public class HorarioService
    {
        private readonly AcademicoDbContext _db;

        public HorarioService(AcademicoDbContext db)
        {
            _db = db;
        }

        /// <summary>
        /// Valida que no exista un horario duplicado para el mismo médico
        /// </summary>
        public async Task<bool> ValidarHorarioUnicoAsync(int idMedico, DateTime fechaDisponible, TimeSpan horaInicio, int? idHorarioExcluir = null)
        {
            var existe = await _db.HorariosDisponibles
                .AnyAsync(h => h.idMedico == idMedico
                    && h.fechaDisponible.Date == fechaDisponible.Date
                    && h.horaInicioDisponible == horaInicio
                    && (idHorarioExcluir == null || h.idHorarioDisponible != idHorarioExcluir));

            return !existe;
        }

        /// <summary>
        /// Valida que el médico existe
        /// </summary>
        public async Task<bool> ValidarMedicoAsync(int idMedico)
        {
            return await _db.Medicos.AnyAsync(m => m.idMedico == idMedico && m.activo);
        }
    }
}

