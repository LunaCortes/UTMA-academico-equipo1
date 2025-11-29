using System;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using utma_academico_aspnetcore.Data;
using utma_academico_aspnetcore.DTOs;
using utma_academico_aspnetcore.Models;
using Microsoft.AspNetCore.Authorization;
using utma_academico_aspnetcore.Exceptions;

namespace utma_academico_aspnetcore.Controllers
{
    /// <summary>
    /// Endpoints para manejar calificaciones (CRUD completo).
    /// Comentarios añadidos para explicar la lógica de validación y persistencia.
    /// </summary>
    [ApiController]
    [Route("api/[controller]")]
    [Authorize]
    public class CalificacionesController : ControllerBase
    {
        private readonly AcademicoDbContext _db;

        /// <summary>
        /// Constructor con inyección de DbContext.
        /// </summary>
        public CalificacionesController(AcademicoDbContext db)
        {
            _db = db;
        }

        /// <summary>
        /// Obtiene todas las calificaciones activas.
        /// </summary>
        [HttpGet]
        public async Task<IActionResult> GetAll()
        {
            var calificaciones = await _db.Calificaciones
                .AsNoTracking()
                .Where(c => c.CodEstatus == "AC")
                .Include(c => c.Alumno)
                .Include(c => c.Materia)
                .Select(c => new
                {
                    c.Id,
                    AlumnoId = c.AlumnoId,
                    AlumnoNombre = c.Alumno != null ? $"{c.Alumno.Nombre} {c.Alumno.ApellidoPaterno}" : null,
                    MateriaId = c.MateriaId,
                    MateriaNombre = c.Materia != null ? c.Materia.Nombre : null,
                    c.Parcial,
                    c.CalificacionValor,
                    c.Fecha,
                    c.Tipo,
                    c.CodEstatus
                })
                .ToListAsync();

            return Ok(calificaciones);
        }

        /// <summary>
        /// Obtiene una calificación por su id.
        /// </summary>
        /// <param name="id">Id de la calificación</param>
        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            // Incluir las relaciones a Alumno y Materia para devolver contexto completo
            var cal = await _db.Calificaciones
                .Include(c => c.Alumno)
                .Include(c => c.Materia)
                .FirstOrDefaultAsync(c => c.Id == id);

            if (cal == null)
                throw ExceptionCatalog.BadRequest("Calificación no encontrada");

            return Ok(cal);
        }

        /// <summary>
        /// Registra una nueva calificación para un alumno en una materia.
        /// Validaciones aplicadas:
        /// - El alumno y la materia deben existir.
        /// - El parcial debe estar entre 1 y 3.
        /// - La calificación numérica debe estar en el rango permitido (según DTO 0-100).
        /// </summary>
        /// <param name="dto">Datos de la calificación</param>
        [HttpPost]
        public async Task<IActionResult> Post([FromBody] CalificacionCreateDto dto)
        {
            // Validación de modelo (atributos [Required], [Range], etc.)
            if (!ModelState.IsValid)
                throw ExceptionCatalog.BadRequest("Datos inválidos");

            // Verificar existencia del alumno
            var alumno = await _db.Alumnos.FindAsync(dto.AlumnoId);
            if (alumno == null)
                throw ExceptionCatalog.AlumnoNotFound(dto.AlumnoId);

            // Verificar existencia de la materia
            var materia = await _db.Materias.FindAsync(dto.MateriaId);
            if (materia == null)
                throw ExceptionCatalog.MateriaNotFound(dto.MateriaId);

            // Validar parcial
            if (dto.Parcial < 1 || dto.Parcial > 3)
                throw ExceptionCatalog.BadRequest("Parcial inválido. Debe ser 1, 2 o 3.");

            // Validar rango de calificación (se repite por claridad aunque DTO ya lo valida)
            if (dto.Calificacion < 0 || dto.Calificacion > 100)
                throw ExceptionCatalog.BadRequest("Calificación inválida. Debe estar entre 0 y 100.");

            // Mapear DTO a entidad
            var entidad = new Calificacion
            {
                AlumnoId = dto.AlumnoId,
                MateriaId = dto.MateriaId,
                Parcial = dto.Parcial,
                CalificacionValor = dto.Calificacion,
                Fecha = DateTime.UtcNow.Date, // asignamos fecha actual (UTC)
                Tipo = "OR", // tipo por defecto (OR = ordinario)
                CodEstatus = "AC" // marca la fila como activa
            };

            // Agregar y guardar cambios en la BD
            await _db.Calificaciones.AddAsync(entidad);
            await _db.SaveChangesAsync();

            // Devolver 201 Created con la entidad creada
            return CreatedAtAction(nameof(GetById), new { id = entidad.Id }, entidad);
        }

        /// <summary>
        /// Actualiza una calificación existente.
        /// </summary>
        /// <param name="id">Id de la calificación</param>
        /// <param name="dto">Datos actualizados</param>
        [HttpPut("{id}")]
        public async Task<IActionResult> Put(int id, [FromBody] CalificacionUpdateDto dto)
        {
            if (!ModelState.IsValid)
                throw ExceptionCatalog.BadRequest("Datos inválidos");

            var calificacion = await _db.Calificaciones.FindAsync(id);
            if (calificacion == null)
                throw ExceptionCatalog.BadRequest("Calificación no encontrada");

            // Verificar existencia del alumno
            var alumno = await _db.Alumnos.FindAsync(dto.AlumnoId);
            if (alumno == null)
                throw ExceptionCatalog.AlumnoNotFound(dto.AlumnoId);

            // Verificar existencia de la materia
            var materia = await _db.Materias.FindAsync(dto.MateriaId);
            if (materia == null)
                throw ExceptionCatalog.MateriaNotFound(dto.MateriaId);

            // Validar parcial
            if (dto.Parcial < 1 || dto.Parcial > 3)
                throw ExceptionCatalog.BadRequest("Parcial inválido. Debe ser 1, 2 o 3.");

            // Validar rango de calificación
            if (dto.Calificacion < 0 || dto.Calificacion > 100)
                throw ExceptionCatalog.BadRequest("Calificación inválida. Debe estar entre 0 y 100.");

            // Actualizar propiedades
            calificacion.AlumnoId = dto.AlumnoId;
            calificacion.MateriaId = dto.MateriaId;
            calificacion.Parcial = dto.Parcial;
            calificacion.CalificacionValor = dto.Calificacion;
            
            if (!string.IsNullOrEmpty(dto.Tipo))
                calificacion.Tipo = dto.Tipo;
            
            if (!string.IsNullOrEmpty(dto.CodEstatus))
                calificacion.CodEstatus = dto.CodEstatus;

            await _db.SaveChangesAsync();

            // Recargar con relaciones para devolver contexto completo
            await _db.Entry(calificacion).Reference(c => c.Alumno).LoadAsync();
            await _db.Entry(calificacion).Reference(c => c.Materia).LoadAsync();

            return Ok(calificacion);
        }

        /// <summary>
        /// Elimina (marca como inactivo) una calificación.
        /// </summary>
        /// <param name="id">Id de la calificación</param>
        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var calificacion = await _db.Calificaciones.FindAsync(id);
            if (calificacion == null)
                throw ExceptionCatalog.BadRequest("Calificación no encontrada");

            // Soft delete: marcar como eliminado en lugar de borrar físicamente
            calificacion.CodEstatus = "EL";
            await _db.SaveChangesAsync();

            return NoContent();
        }
    }
}
