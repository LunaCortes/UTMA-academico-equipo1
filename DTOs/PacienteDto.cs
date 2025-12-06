using System;

namespace utma_academico_aspnetcore.DTOs
{
    /// <summary>
    /// DTO para respuesta de paciente
    /// </summary>
    public class PacienteDto
    {
        public int IdPaciente { get; set; }
        public string NombrePaciente { get; set; } = null!;
        public string ApellidoPaternoPaciente { get; set; } = null!;
        public string? ApellidoMaternoPaciente { get; set; }
        public DateTime FechaNacimientoPaciente { get; set; }
        public string? TelefonoPaciente { get; set; }
        public string? EmailPaciente { get; set; }
        public string? DireccionPaciente { get; set; }
        public string? NumeroSeguroSocial { get; set; }
        public string? TipoSangrePaciente { get; set; }
        public string? AlergiasPaciente { get; set; }
        public int? IdUsuario { get; set; }
    }

    /// <summary>
    /// DTO para crear un nuevo paciente
    /// </summary>
    public class CrearPacienteDto
    {
        public string NombrePaciente { get; set; } = null!;
        public string ApellidoPaternoPaciente { get; set; } = null!;
        public string? ApellidoMaternoPaciente { get; set; }
        public DateTime FechaNacimientoPaciente { get; set; }
        public string? TelefonoPaciente { get; set; }
        public string? EmailPaciente { get; set; }
        public string? DireccionPaciente { get; set; }
        public string? NumeroSeguroSocial { get; set; }
        public string? TipoSangrePaciente { get; set; }
        public string? AlergiasPaciente { get; set; }
        public int? IdUsuario { get; set; }
    }
}

