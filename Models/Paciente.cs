using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace utma_academico_aspnetcore.Models
{
    /// <summary>
    /// Modelo para la tabla catPacientes - Datos de pacientes
    /// </summary>
    [Table("catPacientes")]
    public class Paciente
    {
        [Key]
        [Column("idPaciente")]
        public int idPaciente { get; set; }

        [Required]
        [Column("nombrePaciente")]
        public string nombrePaciente { get; set; } = null!;

        [Required]
        [Column("apellidoPaternoPaciente")]
        public string apellidoPaternoPaciente { get; set; } = null!;

        [Column("apellidoMaternoPaciente")]
        public string? apellidoMaternoPaciente { get; set; }

        [Required]
        [Column("fechaNacimientoPaciente")]
        public DateTime fechaNacimientoPaciente { get; set; }

        [Column("telefonoPaciente")]
        public string? telefonoPaciente { get; set; }

        [Column("emailPaciente")]
        public string? emailPaciente { get; set; }

        [Column("direccionPaciente")]
        public string? direccionPaciente { get; set; }

        [Column("numeroSeguroSocial")]
        public string? numeroSeguroSocial { get; set; }

        [Column("tipoSangrePaciente")]
        public string? tipoSangrePaciente { get; set; }

        [Column("alergiasPaciente")]
        public string? alergiasPaciente { get; set; }

        [Column("idUsuario")]
        public int? idUsuario { get; set; }

        [Column("fechaCreacion")]
        public DateTime fechaCreacion { get; set; }

        [Column("fechaActualizacion")]
        public DateTime fechaActualizacion { get; set; }

        // Navigation properties
        [ForeignKey("idUsuario")]
        [JsonIgnore]
        public UsuarioMedico? Usuario { get; set; }

        [JsonIgnore]
        public ICollection<CitaMedica> CitasMedicas { get; set; } = new List<CitaMedica>();
    }
}

