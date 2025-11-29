using System;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using utma_academico_aspnetcore.Data;
using Microsoft.AspNetCore.Authorization;
using utma_academico_aspnetcore.Exceptions;
using utma_academico_aspnetcore.DTOs;

namespace utma_academico_aspnetcore.Controllers
{
    /// <summary>
    /// Endpoints para gestionar alumnos (CRUD completo).
    /// Comentarios añadidos para explicar cada paso y consulta.
    /// </summary>
    [ApiController]
    [Route("api/[controller]")]
    [Authorize]
    public class AlumnosController : ControllerBase
    {
        private readonly AcademicoDbContext _db;

        /// <summary>
        /// Constructor con inyección del DbContext
        /// </summary>
        public AlumnosController(AcademicoDbContext db)
        {
            // El DbContext se inyecta desde DI; se usa para consultar la BD
            _db = db;
        }

        /// <summary>
        /// Obtiene todos los alumnos activos.
        /// </summary>
        [HttpGet]
        public async Task<IActionResult> GetAll()
        {
            var alumnos = await _db.Alumnos
                .AsNoTracking()
                .Where(a => a.CodEstatus == "AC")
                .Select(a => new
                {
                    a.Id,
                    a.Matricula,
                    a.Nombre,
                    a.ApellidoPaterno,
                    a.ApellidoMaterno,
                    a.Grupo,
                    a.Turno,
                    a.FechaRegistro,
                    a.CodEstatus
                })
                .ToListAsync();

            return Ok(alumnos);
        }

        /// <summary>
        /// Obtiene un alumno por su id.
        /// </summary>
        /// <param name="id">Id del alumno</param>
        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            var alumno = await _db.Alumnos
                .AsNoTracking()
                .FirstOrDefaultAsync(a => a.Id == id);

            if (alumno == null)
                throw ExceptionCatalog.AlumnoNotFound(id);

            return Ok(alumno);
        }

        /// <summary>
        /// Crea un nuevo alumno.
        /// Validaciones:
        /// - Matrícula única
        /// - Campos requeridos
        /// </summary>
        /// <param name="dto">Datos del alumno</param>
        [HttpPost]
        public async Task<IActionResult> Post([FromBody] AlumnoCreateDto dto)
        {
            if (!ModelState.IsValid)
                throw ExceptionCatalog.BadRequest("Datos inválidos");

            // Verificar que la matrícula no exista
            var matriculaExiste = await _db.Alumnos
                .AnyAsync(a => a.Matricula == dto.Matricula);
            
            if (matriculaExiste)
                throw ExceptionCatalog.BadRequest($"La matrícula '{dto.Matricula}' ya existe.");

            var alumno = new Models.Alumno
            {
                Matricula = dto.Matricula,
                Nombre = dto.Nombre,
                ApellidoPaterno = dto.ApellidoPaterno,
                ApellidoMaterno = dto.ApellidoMaterno,
                Grupo = dto.Grupo,
                Turno = dto.Turno,
                FechaRegistro = DateTime.UtcNow,
                CodEstatus = "AC"
            };

            await _db.Alumnos.AddAsync(alumno);
            await _db.SaveChangesAsync();

            return CreatedAtAction(nameof(GetById), new { id = alumno.Id }, alumno);
        }

        /// <summary>
        /// Actualiza un alumno existente.
        /// </summary>
        /// <param name="id">Id del alumno</param>
        /// <param name="dto">Datos actualizados</param>
        [HttpPut("{id}")]
        public async Task<IActionResult> Put(int id, [FromBody] AlumnoUpdateDto dto)
        {
            if (!ModelState.IsValid)
                throw ExceptionCatalog.BadRequest("Datos inválidos");

            var alumno = await _db.Alumnos.FindAsync(id);
            if (alumno == null)
                throw ExceptionCatalog.AlumnoNotFound(id);

            // Verificar que la matrícula no esté en uso por otro alumno
            var matriculaExiste = await _db.Alumnos
                .AnyAsync(a => a.Matricula == dto.Matricula && a.Id != id);
            
            if (matriculaExiste)
                throw ExceptionCatalog.BadRequest($"La matrícula '{dto.Matricula}' ya está en uso por otro alumno.");

            // Actualizar propiedades
            alumno.Matricula = dto.Matricula;
            alumno.Nombre = dto.Nombre;
            alumno.ApellidoPaterno = dto.ApellidoPaterno;
            alumno.ApellidoMaterno = dto.ApellidoMaterno;
            alumno.Grupo = dto.Grupo;
            alumno.Turno = dto.Turno;
            
            if (!string.IsNullOrEmpty(dto.CodEstatus))
                alumno.CodEstatus = dto.CodEstatus;

            await _db.SaveChangesAsync();

            return Ok(alumno);
        }

        /// <summary>
        /// Elimina (marca como inactivo) un alumno.
        /// </summary>
        /// <param name="id">Id del alumno</param>
        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var alumno = await _db.Alumnos.FindAsync(id);
            if (alumno == null)
                throw ExceptionCatalog.AlumnoNotFound(id);

            // Soft delete: marcar como eliminado en lugar de borrar físicamente
            alumno.CodEstatus = "EL";
            await _db.SaveChangesAsync();

            return NoContent();
        }

        /// <summary>
        /// Retorna el historial académico de un alumno: calificaciones y asistencias.
        /// - Busca el alumno por id (AsNoTracking para no rastrear la entidad en EF Core).
        /// - Consulta calificaciones y asistencias por alumno, incluyendo nombre de la materia.
        /// - Devuelve un objeto con la información consolidada.
        /// </summary>
        /// <param name="id">Id del alumno</param>
        [HttpGet("{id}/historial")]
        public async Task<IActionResult> Historial(int id)
        {
            // Buscar alumno en la tabla `pro_alumnos` por su Id
            var alumno = await _db.Alumnos
                .AsNoTracking() // mejora lecturas cuando no se modificará la entidad
                .FirstOrDefaultAsync(a => a.Id == id);

            if (alumno == null)
                // Lanzamos una excepción del catálogo que nuestro middleware convertirá en 404
                throw ExceptionCatalog.AlumnoNotFound(id);

            // Consultar calificaciones del alumno incluyendo la relación de Materia
            // Se proyecta a un DTO anónimo para devolver solo campos necesarios
            var calificaciones = await _db.Calificaciones
                .Where(c => c.AlumnoId == id)
                .Include(c => c.Materia) // incluir para poder obtener el nombre de la materia
                .Select(c => new
                {
                    c.Id,
                    c.Parcial,
                    Calificacion = c.CalificacionValor,
                    Fecha = c.Fecha,
                    MateriaId = c.MateriaId,
                    MateriaNombre = c.Materia != null ? c.Materia.Nombre : null
                })
                .ToListAsync();

            // Consultar asistencias del alumno, también proyectando campos relevantes
            var asistencias = await _db.Asistencias
                .Where(a => a.AlumnoId == id)
                .Include(a => a.Materia)
                .Select(a => new
                {
                    a.Id,
                    Fecha = a.Fecha,
                    Presente = a.Estatus == "A", // 'A' = presente en la BD
                    MateriaId = a.MateriaId,
                    MateriaNombre = a.Materia != null ? a.Materia.Nombre : null
                })
                .ToListAsync();

            // Devolver el historial consolidado: datos del alumno + listas
            return Ok(new
            {
                Alumno = new
                {
                    alumno.Id,
                    alumno.Matricula,
                    // Construimos nombre completo de forma segura (omitimos nulos)
                    Nombre = string.Join(' ', new[] { alumno.Nombre, alumno.ApellidoPaterno, alumno.ApellidoMaterno }.Where(x => !string.IsNullOrEmpty(x)))
                },
                Calificaciones = calificaciones,
                Asistencias = asistencias
            });
        }
    }
}
