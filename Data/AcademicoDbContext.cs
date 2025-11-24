using Microsoft.EntityFrameworkCore;
using utma_academico_aspnetcore.Models;

namespace utma_academico_aspnetcore.Data
{
    // DbContext de EF Core que representa la conexión a la base de datos y los conjuntos (DbSet)
    public class AcademicoDbContext : DbContext
    {
        // Constructor que recibe opciones (cadena de conexión y proveedor) desde Program.cs
        public AcademicoDbContext(DbContextOptions<AcademicoDbContext> options) : base(options)
        {
        }

        // Cada DbSet representa una tabla en la BD y permite consultas LINQ
        public DbSet<Alumno> Alumnos { get; set; } = null!;
        public DbSet<Materia> Materias { get; set; } = null!;
        public DbSet<Calificacion> Calificaciones { get; set; } = null!;
        public DbSet<Asistencia> Asistencias { get; set; } = null!;
        public DbSet<Usuario> Usuarios { get; set; } = null!;

        // Aquí podemos ajustar mapeos adicionales si fuera necesario
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            // Aseguramos que EF conozca las tablas (los atributos [Table] en las entidades ya hacen esto,
            // pero aquí se muestra explícitamente cómo forzarlo si se necesitara)
            modelBuilder.Entity<Alumno>().ToTable("pro_alumnos");
            modelBuilder.Entity<Materia>().ToTable("cat_materias");
            modelBuilder.Entity<Calificacion>().ToTable("pro_calificaciones");
            modelBuilder.Entity<Asistencia>().ToTable("pro_asistencias");
            modelBuilder.Entity<Usuario>().ToTable("cat_usuarios");

            // Relaciones y restricciones adicionales podrían declararse aquí si se requieren más reglas
        }
    }
}
