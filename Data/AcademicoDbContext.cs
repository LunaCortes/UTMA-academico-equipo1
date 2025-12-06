using Microsoft.EntityFrameworkCore;
using utma_academico_aspnetcore.Models;

namespace utma_academico_aspnetcore.Data
{
    // DbContext de EF Core que representa la conexión a la base de datos y los conjuntos (DbSet)
    // Sistema de Gestión de Citas Médicas
    public class AcademicoDbContext : DbContext
    {
        // Constructor que recibe opciones (cadena de conexión y proveedor) desde Program.cs
        public AcademicoDbContext(DbContextOptions<AcademicoDbContext> options) : base(options)
        {
        }

        // Cada DbSet representa una tabla en la BD y permite consultas LINQ
        // Catálogos
        public DbSet<Rol> Roles { get; set; } = null!;
        public DbSet<EstadoCita> EstadosCita { get; set; } = null!;
        public DbSet<Especialidad> Especialidades { get; set; } = null!;

        // Entidades principales
        public DbSet<UsuarioMedico> Usuarios { get; set; } = null!;
        public DbSet<Paciente> Pacientes { get; set; } = null!;
        public DbSet<Medico> Medicos { get; set; } = null!;
        public DbSet<HorarioDisponible> HorariosDisponibles { get; set; } = null!;
        public DbSet<CitaMedica> CitasMedicas { get; set; } = null!;

        // Aquí podemos ajustar mapeos adicionales si fuera necesario
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            // Configuración de tablas
            modelBuilder.Entity<Rol>().ToTable("catRoles");
            modelBuilder.Entity<EstadoCita>().ToTable("catEstadosCita");
            modelBuilder.Entity<Especialidad>().ToTable("catEspecialidades");
            modelBuilder.Entity<UsuarioMedico>().ToTable("usuarios");
            modelBuilder.Entity<Paciente>().ToTable("catPacientes");
            modelBuilder.Entity<Medico>().ToTable("catMedicos");
            modelBuilder.Entity<HorarioDisponible>().ToTable("horariosDisponibles");
            modelBuilder.Entity<CitaMedica>().ToTable("citasMedicas");

            // Configuración de relaciones
            // Usuario -> Rol
            modelBuilder.Entity<UsuarioMedico>()
                .HasOne(u => u.Rol)
                .WithMany(r => r.Usuarios)
                .HasForeignKey(u => u.idRol)
                .OnDelete(DeleteBehavior.Restrict);

            // Paciente -> Usuario
            modelBuilder.Entity<Paciente>()
                .HasOne(p => p.Usuario)
                .WithOne(u => u.Paciente)
                .HasForeignKey<Paciente>(p => p.idUsuario)
                .OnDelete(DeleteBehavior.SetNull);

            // Medico -> Especialidad
            modelBuilder.Entity<Medico>()
                .HasOne(m => m.Especialidad)
                .WithMany(e => e.Medicos)
                .HasForeignKey(m => m.idEspecialidad)
                .OnDelete(DeleteBehavior.Restrict);

            // Medico -> Usuario
            modelBuilder.Entity<Medico>()
                .HasOne(m => m.Usuario)
                .WithOne(u => u.Medico)
                .HasForeignKey<Medico>(m => m.idUsuario)
                .OnDelete(DeleteBehavior.SetNull);

            // HorarioDisponible -> Medico
            modelBuilder.Entity<HorarioDisponible>()
                .HasOne(h => h.Medico)
                .WithMany(m => m.HorariosDisponibles)
                .HasForeignKey(h => h.idMedico)
                .OnDelete(DeleteBehavior.Cascade);

            // CitaMedica -> Paciente
            modelBuilder.Entity<CitaMedica>()
                .HasOne(c => c.Paciente)
                .WithMany(p => p.CitasMedicas)
                .HasForeignKey(c => c.idPaciente)
                .OnDelete(DeleteBehavior.Restrict);

            // CitaMedica -> Medico
            modelBuilder.Entity<CitaMedica>()
                .HasOne(c => c.Medico)
                .WithMany(m => m.CitasMedicas)
                .HasForeignKey(c => c.idMedico)
                .OnDelete(DeleteBehavior.Restrict);

            // CitaMedica -> EstadoCita
            modelBuilder.Entity<CitaMedica>()
                .HasOne(c => c.EstadoCita)
                .WithMany(e => e.CitasMedicas)
                .HasForeignKey(c => c.idEstadoCita)
                .OnDelete(DeleteBehavior.Restrict);

            // Índices únicos
            modelBuilder.Entity<UsuarioMedico>()
                .HasIndex(u => u.emailUsuario)
                .IsUnique();

            modelBuilder.Entity<UsuarioMedico>()
                .HasIndex(u => u.nombreUsuario)
                .IsUnique();

            modelBuilder.Entity<Medico>()
                .HasIndex(m => m.cedulaProfesionalMedico)
                .IsUnique();

            modelBuilder.Entity<Paciente>()
                .HasIndex(p => p.emailPaciente)
                .IsUnique();

            modelBuilder.Entity<Paciente>()
                .HasIndex(p => p.numeroSeguroSocial)
                .IsUnique();
        }
    }
}
