using System;

namespace utma_academico_aspnetcore.DTOs
{
    /// <summary>
    /// DTO para respuesta de horario disponible
    /// </summary>
    public class HorarioDisponibleDto
    {
        public int IdHorarioDisponible { get; set; }
        public int IdMedico { get; set; }
        public string? NombreMedico { get; set; }
        public DateTime FechaDisponible { get; set; }
        public TimeSpan HoraInicioDisponible { get; set; }
        public TimeSpan HoraFinDisponible { get; set; }
        public bool Disponible { get; set; }
    }

    /// <summary>
    /// DTO para crear un nuevo horario disponible
    /// </summary>
    public class CrearHorarioDisponibleDto
    {
        public int IdMedico { get; set; }
        public DateTime FechaDisponible { get; set; }
        public TimeSpan HoraInicioDisponible { get; set; }
        public TimeSpan HoraFinDisponible { get; set; }
    }
}

