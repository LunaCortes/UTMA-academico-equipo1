using System;
using utma_academico.Models;
using Xunit;

namespace utma_academico.Tests.Models
{
    public class ModelsTests
    {
        [Fact]
        public void Can_Create_And_Set_Alumno()
        {
            var a = new Alumno
            {
                Id = 1,
                Matricula = "M1",
                Nombre = "N",
                ApellidoPaterno = "P",
                ApellidoMaterno = "M",
                Grupo = "G",
                Turno = "T",
                FechaRegistro = DateTime.UtcNow,
                CodEstatus = "AC"
            };

            Assert.Equal(1, a.Id);
            Assert.Equal("M1", a.Matricula);
            Assert.NotNull(a.Calificaciones);
            Assert.NotNull(a.Asistencias);
        }

        [Fact]
        public void Can_Create_Other_Models()
        {
            var m = new Materia { Id = 1, Clave = "C", Nombre = "Nombre", Creditos = 3 };
            var c = new Calificacion { Id = 1, AlumnoId = 1, MateriaId = 1, Parcial = 1, CalificacionValor = 9.5m, Tipo = "OR", Fecha = DateTime.UtcNow };
            var s = new Asistencia { Id = 1, AlumnoId = 1, MateriaId = 1, Fecha = DateTime.UtcNow, Estatus = "A" };

            Assert.Equal(1, m.Id);
            Assert.Equal(1, c.AlumnoId);
            Assert.Equal("A", s.Estatus);
        }
    }
}
