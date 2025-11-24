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
    public class AlumnosControllerTests
    {
        [Fact]
        public async Task Historial_Throws_AlumnoNotFound_When_Missing()
        {
            using var db = TestHelpers.CreateInMemoryContext();
            var ctrl = new AlumnosController(db);
            await Assert.ThrowsAsync<utma_academico.Exceptions.ApiException>(() => ctrl.Historial(1));
        }

        [Fact]
        public async Task Historial_Returns_Data_When_Exists()
        {
            using var db = TestHelpers.CreateInMemoryContext();
            db.Alumnos.Add(new Alumno { Matricula = "A1", Nombre = "N", ApellidoPaterno = "P" });
            db.Materias.Add(new Materia { Clave = "M1", Nombre = "Mat" });
            await db.SaveChangesAsync();

            db.Calificaciones.Add(new Calificacion { AlumnoId = 1, MateriaId = 1, CalificacionValor = 6, Parcial = 1, Fecha = System.DateTime.UtcNow });
            db.Asistencias.Add(new Asistencia { AlumnoId = 1, MateriaId = 1, Fecha = System.DateTime.UtcNow, Estatus = "A" });
            await db.SaveChangesAsync();

            var ctrl = new AlumnosController(db);
            var result = await ctrl.Historial(1) as OkObjectResult;
            Assert.NotNull(result);
            var obj = result.Value as dynamic;
            Assert.NotNull(obj);
        }
    }
}
