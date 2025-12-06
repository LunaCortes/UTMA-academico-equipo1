using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using utma_academico_aspnetcore.Data;
using utma_academico_aspnetcore.Models;
using utma_academico_aspnetcore.Exceptions;

namespace utma_academico_aspnetcore.Services
{
    /// <summary>
    /// Servicio para gestión de pacientes
    /// </summary>
    public class PacienteService
    {
        private readonly AcademicoDbContext _db;

        public PacienteService(AcademicoDbContext db)
        {
            _db = db;
        }

        /// <summary>
        /// Valida que el email del paciente no esté duplicado
        /// </summary>
        public async Task<bool> ValidarEmailUnicoAsync(string email, int? idPacienteExcluir = null)
        {
            if (string.IsNullOrEmpty(email))
                return true;

            var existe = await _db.Pacientes
                .AnyAsync(p => p.emailPaciente == email
                    && (idPacienteExcluir == null || p.idPaciente != idPacienteExcluir));

            return !existe;
        }

        /// <summary>
        /// Valida que el número de seguro social no esté duplicado
        /// </summary>
        public async Task<bool> ValidarNumeroSeguroSocialUnicoAsync(string numeroSeguroSocial, int? idPacienteExcluir = null)
        {
            if (string.IsNullOrEmpty(numeroSeguroSocial))
                return true;

            var existe = await _db.Pacientes
                .AnyAsync(p => p.numeroSeguroSocial == numeroSeguroSocial
                    && (idPacienteExcluir == null || p.idPaciente != idPacienteExcluir));

            return !existe;
        }
    }
}

