using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using utma_academico_aspnetcore.Data;
using utma_academico_aspnetcore.Exceptions;

namespace utma_academico_aspnetcore.Services
{
    /// <summary>
    /// Servicio para gestión de médicos
    /// </summary>
    public class MedicoService
    {
        private readonly AcademicoDbContext _db;

        public MedicoService(AcademicoDbContext db)
        {
            _db = db;
        }

        /// <summary>
        /// Valida que la cédula profesional no esté duplicada
        /// </summary>
        public async Task<bool> ValidarCedulaUnicaAsync(string cedula, int? idMedicoExcluir = null)
        {
            var existe = await _db.Medicos
                .AnyAsync(m => m.cedulaProfesionalMedico == cedula
                    && (idMedicoExcluir == null || m.idMedico != idMedicoExcluir));

            return !existe;
        }

        /// <summary>
        /// Valida que la especialidad existe
        /// </summary>
        public async Task<bool> ValidarEspecialidadAsync(int idEspecialidad)
        {
            return await _db.Especialidades.AnyAsync(e => e.idEspecialidad == idEspecialidad);
        }
    }
}

