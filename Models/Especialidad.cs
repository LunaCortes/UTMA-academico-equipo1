using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace utma_academico_aspnetcore.Models
{
    /// <summary>
    /// Modelo para la tabla catEspecialidades - Especialidades médicas
    /// </summary>
    [Table("catEspecialidades")]
    public class Especialidad
    {
        [Key]
        [Column("idEspecialidad")]
        public int idEspecialidad { get; set; }

        [Required]
        [Column("nombreEspecialidad")]
        public string nombreEspecialidad { get; set; } = null!;

        [Column("descripcionEspecialidad")]
        public string? descripcionEspecialidad { get; set; }

        [Column("fechaCreacion")]
        public DateTime fechaCreacion { get; set; }

        [Column("fechaActualizacion")]
        public DateTime fechaActualizacion { get; set; }

        // Navigation property
        [JsonIgnore]
        public ICollection<Medico> Medicos { get; set; } = new List<Medico>();
    }
}

