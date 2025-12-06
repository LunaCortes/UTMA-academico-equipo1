using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace utma_academico_aspnetcore.Models
{
    /// <summary>
    /// Modelo para la tabla horariosDisponibles - Horarios disponibles de médicos
    /// </summary>
    [Table("horariosDisponibles")]
    public class HorarioDisponible
    {
        [Key]
        [Column("idHorarioDisponible")]
        public int idHorarioDisponible { get; set; }

        [Required]
        [Column("idMedico")]
        public int idMedico { get; set; }

        [Required]
        [Column("fechaDisponible")]
        public DateTime fechaDisponible { get; set; }

        [Required]
        [Column("horaInicioDisponible")]
        public TimeSpan horaInicioDisponible { get; set; }

        [Required]
        [Column("horaFinDisponible")]
        public TimeSpan horaFinDisponible { get; set; }

        [Column("disponible")]
        public bool disponible { get; set; } = true;

        [Column("fechaCreacion")]
        public DateTime fechaCreacion { get; set; }

        [Column("fechaActualizacion")]
        public DateTime fechaActualizacion { get; set; }

        // Navigation property
        [ForeignKey("idMedico")]
        [JsonIgnore]
        public Medico? Medico { get; set; }
    }
}

