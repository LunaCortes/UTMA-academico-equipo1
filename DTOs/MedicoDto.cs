using System;

namespace utma_academico_aspnetcore.DTOs
{
    /// <summary>
    /// DTO para respuesta de médico
    /// </summary>
    public class MedicoDto
    {
        public int IdMedico { get; set; }
        public string NombreMedico { get; set; } = null!;
        public string ApellidoPaternoMedico { get; set; } = null!;
        public string? ApellidoMaternoMedico { get; set; }
        public string CedulaProfesionalMedico { get; set; } = null!;
        public int IdEspecialidad { get; set; }
        public string? NombreEspecialidad { get; set; }
        public string? TelefonoMedico { get; set; }
        public string? EmailMedico { get; set; }
        public string? ConsultorioMedico { get; set; }
        public TimeSpan HorarioInicioMedico { get; set; }
        public TimeSpan HorarioFinMedico { get; set; }
        public bool Activo { get; set; }
        public int? IdUsuario { get; set; }
    }

    /// <summary>
    /// DTO para crear un nuevo médico
    /// </summary>
    public class CrearMedicoDto
    {
        public string NombreMedico { get; set; } = null!;
        public string ApellidoPaternoMedico { get; set; } = null!;
        public string? ApellidoMaternoMedico { get; set; }
        public string CedulaProfesionalMedico { get; set; } = null!;
        public int IdEspecialidad { get; set; }
        public string? TelefonoMedico { get; set; }
        public string? EmailMedico { get; set; }
        public string? ConsultorioMedico { get; set; }
        public TimeSpan HorarioInicioMedico { get; set; } = new TimeSpan(8, 0, 0);
        public TimeSpan HorarioFinMedico { get; set; } = new TimeSpan(18, 0, 0);
        public int? IdUsuario { get; set; }
    }
}

