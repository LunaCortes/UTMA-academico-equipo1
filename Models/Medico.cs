using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace utma_academico_aspnetcore.Models
{
    /// <summary>
    /// Modelo para la tabla catMedicos - Datos de médicos
    /// </summary>
    [Table("catMedicos")]
    public class Medico
    {
        [Key]
        [Column("idMedico")]
        public int idMedico { get; set; }

        [Required]
        [Column("nombreMedico")]
        public string nombreMedico { get; set; } = null!;

        [Required]
        [Column("apellidoPaternoMedico")]
        public string apellidoPaternoMedico { get; set; } = null!;

        [Column("apellidoMaternoMedico")]
        public string? apellidoMaternoMedico { get; set; }

        [Required]
        [Column("cedulaProfesionalMedico")]
        public string cedulaProfesionalMedico { get; set; } = null!;

        [Required]
        [Column("idEspecialidad")]
        public int idEspecialidad { get; set; }

        [Column("telefonoMedico")]
        public string? telefonoMedico { get; set; }

        [Column("emailMedico")]
        public string? emailMedico { get; set; }

        [Column("consultorioMedico")]
        public string? consultorioMedico { get; set; }

        [Column("horarioInicioMedico")]
        public TimeSpan horarioInicioMedico { get; set; } = new TimeSpan(8, 0, 0);

        [Column("horarioFinMedico")]
        public TimeSpan horarioFinMedico { get; set; } = new TimeSpan(18, 0, 0);

        [Column("activo")]
        public bool activo { get; set; } = true;

        [Column("idUsuario")]
        public int? idUsuario { get; set; }

        [Column("fechaCreacion")]
        public DateTime fechaCreacion { get; set; }

        [Column("fechaActualizacion")]
        public DateTime fechaActualizacion { get; set; }

        // Navigation properties
        [ForeignKey("idEspecialidad")]
        [JsonIgnore]
        public Especialidad? Especialidad { get; set; }

        [ForeignKey("idUsuario")]
        [JsonIgnore]
        public UsuarioMedico? Usuario { get; set; }

        [JsonIgnore]
        public ICollection<HorarioDisponible> HorariosDisponibles { get; set; } = new List<HorarioDisponible>();

        [JsonIgnore]
        public ICollection<CitaMedica> CitasMedicas { get; set; } = new List<CitaMedica>();
    }
}

