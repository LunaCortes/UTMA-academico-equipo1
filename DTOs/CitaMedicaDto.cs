using System;

namespace utma_academico_aspnetcore.DTOs
{
    /// <summary>
    /// DTO para respuesta de cita médica
    /// </summary>
    public class CitaMedicaDto
    {
        public int IdCitaMedica { get; set; }
        public int IdPaciente { get; set; }
        public string? NombrePaciente { get; set; }
        public int IdMedico { get; set; }
        public string? NombreMedico { get; set; }
        public DateTime FechaCita { get; set; }
        public TimeSpan HoraCita { get; set; }
        public int IdEstadoCita { get; set; }
        public string? NombreEstadoCita { get; set; }
        public string? MotivoCita { get; set; }
        public string? ObservacionesCita { get; set; }
        public int DuracionEstimadaCita { get; set; }
        public decimal? CostoConsulta { get; set; }
    }

    /// <summary>
    /// DTO para crear una nueva cita médica
    /// </summary>
    public class CrearCitaMedicaDto
    {
        public int IdPaciente { get; set; }
        public int IdMedico { get; set; }
        public DateTime FechaCita { get; set; }
        public TimeSpan HoraCita { get; set; }
        public string? MotivoCita { get; set; }
        public string? ObservacionesCita { get; set; }
        public int DuracionEstimadaCita { get; set; } = 30;
        public decimal? CostoConsulta { get; set; }
    }
}

