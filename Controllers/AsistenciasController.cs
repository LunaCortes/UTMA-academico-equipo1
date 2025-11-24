using System;
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
    /// Endpoints para registrar asistencias.
    /// Comentarios añadidos para explicar cada paso y validaciones.
    /// </summary>
    [ApiController]
    [Route("api/[controller]")]
    [Authorize]
    public class AsistenciasController : ControllerBase
    {
        private readonly AcademicoDbContext _db;

        /// <summary>
        /// Constructor con inyección de DbContext.
        /// </summary>
        public AsistenciasController(AcademicoDbContext db)
        {
            // El DbContext se inyecta desde el contenedor de DI y se usa para acceder a la BD
            _db = db;
        }

        /// <summary>
        /// Registra una asistencia (presente/ausente) para un alumno en una fecha y materia.
        /// Flujo:
        /// - Validar DTO de entrada (campos requeridos).
        /// - Verificar existencia de alumno y materia en la BD.
        /// - Mapear el valor booleano `Presente` al código esperado en la BD ('A'/'F').
        /// - Guardar la entidad y devolver 201 Created con la asistencia creada.
        /// </summary>
        [HttpPost]
        public async Task<IActionResult> Post([FromBody] AsistenciaCreateDto dto)
        {
            // Validación automática de atributos del DTO
            if (!ModelState.IsValid)
                throw ExceptionCatalog.BadRequest("Datos inválidos");

            // Verificar existencia de alumno
            var alumno = await _db.Alumnos.FindAsync(dto.AlumnoId);
            if (alumno == null)
                throw ExceptionCatalog.AlumnoNotFound(dto.AlumnoId);

            // Verificar existencia de materia
            var materia = await _db.Materias.FindAsync(dto.MateriaId);
            if (materia == null)
                throw ExceptionCatalog.MateriaNotFound(dto.MateriaId);

            // Mapear Presente (true/false) al valor de BD: 'A' = presente, 'F' = falta
            var estatus = dto.Presente ? "A" : "F";

            var entidad = new Asistencia
            {
                AlumnoId = dto.AlumnoId,
                MateriaId = dto.MateriaId,
                Fecha = dto.Fecha.Date,
                Estatus = estatus,
                CodEstatus = "AC" // marcamos como activa por defecto
            };

            // Agregar y persistir en BD
            await _db.Asistencias.AddAsync(entidad);
            await _db.SaveChangesAsync();

            // Devolver 201 con la entidad creada (CreatedAtAction apunta al GET por id)
            return CreatedAtAction(nameof(GetById), new { id = entidad.Id }, entidad);
        }

        /// <summary>
        /// Obtener una asistencia por id. Incluye relaciones a Alumno y Materia para contexto.
        /// </summary>
        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            var a = await _db.Asistencias
                .Include(x => x.Alumno)
                .Include(x => x.Materia)
                .FirstOrDefaultAsync(x => x.Id == id);

            if (a == null)
                throw ExceptionCatalog.BadRequest("Asistencia no encontrada");

            return Ok(a);
        }
    }
}
