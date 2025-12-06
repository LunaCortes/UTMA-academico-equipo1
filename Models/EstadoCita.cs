using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace utma_academico_aspnetcore.Models
{
    /// <summary>
    /// Modelo para la tabla catEstadosCita - Estados posibles de una cita médica
    /// </summary>
    [Table("catEstadosCita")]
    public class EstadoCita
    {
        [Key]
        [Column("idEstadoCita")]
        public int idEstadoCita { get; set; }

        [Required]
        [Column("nombreEstado")]
        public string nombreEstado { get; set; } = null!;

        [Column("descripcionEstado")]
        public string? descripcionEstado { get; set; }

        [Column("fechaCreacion")]
        public DateTime fechaCreacion { get; set; }

        [Column("fechaActualizacion")]
        public DateTime fechaActualizacion { get; set; }

        // Navigation property
        [JsonIgnore]
        public ICollection<CitaMedica> CitasMedicas { get; set; } = new List<CitaMedica>();
    }
}

