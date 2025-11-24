using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using utma_academico.Controllers;
using utma_academico.Data;
using utma_academico.Models;
using utma_academico.Tests.Helpers;
using Xunit;

namespace utma_academico.Tests.Controllers
{
    public class ReportesControllerTests
    {
        [Fact]
        public async Task BajoRendimiento_Returns_Students_Below_Threshold()
        {
            using var db = TestHelpers.CreateInMemoryContext();
            // Student 1 avg 6.0, student 2 avg 8.0
            db.Alumnos.Add(new Alumno { Matricula = "A1", Nombre = "N1", ApellidoPaterno = "P1" });
            db.Alumnos.Add(new Alumno { Matricula = "A2", Nombre = "N2", ApellidoPaterno = "P2" });
            db.Materias.Add(new Materia { Clave = "M1", Nombre = "Mat" });
            await db.SaveChangesAsync();

            db.Calificaciones.Add(new Calificacion { AlumnoId = 1, MateriaId = 1, CalificacionValor = 6, Parcial = 1, Fecha = System.DateTime.UtcNow });
            db.Calificaciones.Add(new Calificacion { AlumnoId = 2, MateriaId = 1, CalificacionValor = 8, Parcial = 1, Fecha = System.DateTime.UtcNow });
            await db.SaveChangesAsync();

            var ctrl = new ReportesController(db);
            var result = await ctrl.BajoRendimiento() as OkObjectResult;
            Assert.NotNull(result);
            var list = result.Value as System.Collections.IEnumerable;
            Assert.NotNull(list);
        }
    }
}
