using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using utma_academico_aspnetcore.Data;
using Microsoft.AspNetCore.Authorization;
using Microsoft.Extensions.Configuration;

namespace utma_academico_aspnetcore.Controllers
{
    /// <summary>
    /// Endpoints para reportes académicos.
    /// </summary>
    [ApiController]
    [Route("api/[controller]")]
    [Authorize]
    public class ReportesController : ControllerBase
    {
        private readonly AcademicoDbContext _db;
        private readonly IConfiguration _configuration;

        /// <summary>
        /// Constructor con inyección del DbContext y IConfiguration
        /// </summary>
        public ReportesController(AcademicoDbContext db, IConfiguration configuration)
        {
            _db = db;
            _configuration = configuration;
        }

        /// <summary>
        /// Devuelve los alumnos con promedio menor que el umbral.
        /// Parámetros opcionales de consulta:
        /// - umbral: decimal (por defecto 8.0)
        /// - incluirInactivos: bool (por defecto false) -> incluir calificaciones con cualquier tCodEstatus
        /// - incluirCeros: bool (por defecto false) -> incluir calificaciones con valor 0
        /// Esto permite probar distintos filtros sin tocar código ni configuración.
        /// </summary>
        [HttpGet("bajo-rendimiento")]
        public async Task<IActionResult> BajoRendimiento([FromQuery] decimal? umbral = null, [FromQuery] bool incluirInactivos = false, [FromQuery] bool incluirCeros = false)
        {
            // Umbral por defecto: 8.0
            var defaultUmbral = 8.0m;
            decimal umbralFinal = umbral ?? (_configuration.GetValue<decimal?>("Reportes:Umbral") ?? defaultUmbral);

            // Detectar escala en base de datos (max)
            var maxValor = await _db.Calificaciones
                .Where(c => c.CalificacionValor != null)
                .MaxAsync(c => (decimal?)c.CalificacionValor) ?? 0m;

            var escala100 = maxValor > 10m;
            var comparacionUmbral = escala100 ? umbralFinal * 10m : umbralFinal;

            // Construir query base para calificaciones según flags
            var calificacionesQuery = _db.Calificaciones.AsQueryable();

            if (!incluirInactivos)
            {
                calificacionesQuery = calificacionesQuery.Where(c => c.CodEstatus == "AC");
            }

            if (!incluirCeros)
            {
                calificacionesQuery = calificacionesQuery.Where(c => c.CalificacionValor > 0);
            }

            // Calcular promedio global por alumno directamente en la BD
            var promedioGlobalQuery = calificacionesQuery
                .GroupBy(c => c.AlumnoId)
                .Select(g => new
                {
                    AlumnoId = g.Key,
                    Promedio = g.Average(c => c.CalificacionValor)
                });

            // Filtrar alumnos con promedio < comparacionUmbral
            var alumnosBajoQuery = from p in promedioGlobalQuery
                                   where p.Promedio < comparacionUmbral
                                   join a in _db.Alumnos on p.AlumnoId equals a.Id
                                   select new
                                   {
                                       a.Id,
                                       a.Matricula,
                                       a.Nombre,
                                       a.ApellidoPaterno,
                                       a.ApellidoMaterno,
                                       Promedio = escala100 ? p.Promedio / 10m : p.Promedio
                                   };

            var list = await alumnosBajoQuery
                .OrderBy(x => x.Promedio)
                .ToListAsync();

            var result = list.Select(x => new
            {
                x.Id,
                x.Matricula,
                Nombre = string.Join(' ', new[] { x.Nombre, x.ApellidoPaterno, x.ApellidoMaterno }.Where(s => !string.IsNullOrEmpty(s))),
                Promedio = decimal.Round(x.Promedio, 2)
            }).ToList();

            return Ok(result);
        }
    }
}
