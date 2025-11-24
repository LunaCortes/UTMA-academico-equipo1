using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using utma_academico.Controllers;
using utma_academico.Data;
using utma_academico.DTOs;
using utma_academico.Models;
using utma_academico.Tests.Helpers;
using Xunit;

namespace utma_academico.Tests.Controllers
{
    public class CalificacionesControllerTests
    {
        [Fact]
        public async Task Post_Throws_BadRequest_When_ModelState_Invalid()
        {
            using var db = TestHelpers.CreateInMemoryContext();
            var ctrl = new CalificacionesController(db);
            ctrl.ModelState.AddModelError("x", "err");

            await Assert.ThrowsAsync<utma_academico.Exceptions.ApiException>(() => ctrl.Post(new CalificacionCreateDto()));
        }

        [Fact]
        public async Task Post_Throws_AlumnoNotFound_When_Alumno_Missing()
        {
            using var db = TestHelpers.CreateInMemoryContext();
            db.Materias.Add(new Materia { Clave = "M1", Nombre = "Mat" });
            await db.SaveChangesAsync();

            var ctrl = new CalificacionesController(db);
            var dto = new CalificacionCreateDto { AlumnoId = 999, MateriaId = 1, Parcial = 1, Calificacion = 8 };

            await Assert.ThrowsAsync<utma_academico.Exceptions.ApiException>(() => ctrl.Post(dto));
        }

        [Fact]
        public async Task Post_Succeeds_When_Valid()
        {
            using var db = TestHelpers.CreateInMemoryContext();
            db.Alumnos.Add(new Alumno { Matricula = "A1", Nombre = "N", ApellidoPaterno = "P" });
            db.Materias.Add(new Materia { Clave = "M1", Nombre = "Mat" });
            await db.SaveChangesAsync();

            var ctrl = new CalificacionesController(db);
            var dto = new CalificacionCreateDto { AlumnoId = 1, MateriaId = 1, Parcial = 2, Calificacion = 9 };
            var result = await ctrl.Post(dto) as CreatedAtActionResult;
            Assert.NotNull(result);

            // Ensure saved in DB
            var saved = await db.Calificaciones.FirstOrDefaultAsync();
            Assert.NotNull(saved);
            Assert.Equal(9, saved.CalificacionValor);
        }

        [Fact]
        public async Task GetById_Throws_BadRequest_When_Not_Found()
        {
            using var db = TestHelpers.CreateInMemoryContext();
            var ctrl = new CalificacionesController(db);
            await Assert.ThrowsAsync<utma_academico.Exceptions.ApiException>(() => ctrl.GetById(1));
        }
    }
}
