using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace utma_academico_aspnetcore.Models
{
    // Mapea la tabla `cat_materias` en la base de datos
    [Table("cat_materias")]
    public class Materia
    {
        // PK -> eCodMateria
        [Key]
        [Column("eCodMateria")]
        public int Id { get; set; }

        // Clave de la materia (tClave) - campo requerido
        [Required]
        [Column("tClave")]
        public string Clave { get; set; } = null!;

        // Nombre de la materia (tNombre)
        [Required]
        [Column("tNombre")]
        public string Nombre { get; set; } = null!;

        // Créditos de la materia (eCreditos)
        [Column("eCreditos")]
        public int Creditos { get; set; }

        // Código de estatus (tCodEstatus) - por ejemplo 'AC'
        [Column("tCodEstatus")]
        public string? CodEstatus { get; set; }

        // Relaciones: colecciones de navegación hacia calificaciones y asistencias
        // Se ignoran en la serialización JSON para evitar ciclos de referencia
        [JsonIgnore]
        public ICollection<Calificacion>? Calificaciones { get; set; } = new List<Calificacion>();

        [JsonIgnore]
        public ICollection<Asistencia>? Asistencias { get; set; } = new List<Asistencia>();
    }
}
