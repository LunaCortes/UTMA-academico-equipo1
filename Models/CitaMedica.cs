using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace utma_academico_aspnetcore.Models
{
    /// <summary>
    /// Modelo para la tabla citasMedicas - Citas médicas agendadas
    /// </summary>
    [Table("citasMedicas")]
    public class CitaMedica
    {
        [Key]
        [Column("idCitaMedica")]
        public int idCitaMedica { get; set; }

        [Required]
        [Column("idPaciente")]
        public int idPaciente { get; set; }

        [Required]
        [Column("idMedico")]
        public int idMedico { get; set; }

        [Required]
        [Column("fechaCita")]
        public DateTime fechaCita { get; set; }

        [Required]
        [Column("horaCita")]
        public TimeSpan horaCita { get; set; }

        [Required]
        [Column("idEstadoCita")]
        public int idEstadoCita { get; set; } = 1;

        [Column("motivoCita")]
        public string? motivoCita { get; set; }

        [Column("observacionesCita")]
        public string? observacionesCita { get; set; }

        [Column("duracionEstimadaCita")]
        public int duracionEstimadaCita { get; set; } = 30;

        [Column("costoConsulta")]
        public decimal? costoConsulta { get; set; }

        [Column("fechaCreacion")]
        public DateTime fechaCreacion { get; set; }

        [Column("fechaActualizacion")]
        public DateTime fechaActualizacion { get; set; }

        // Navigation properties
        [ForeignKey("idPaciente")]
        [JsonIgnore]
        public Paciente? Paciente { get; set; }

        [ForeignKey("idMedico")]
        [JsonIgnore]
        public Medico? Medico { get; set; }

        [ForeignKey("idEstadoCita")]
        [JsonIgnore]
        public EstadoCita? EstadoCita { get; set; }
    }
}

