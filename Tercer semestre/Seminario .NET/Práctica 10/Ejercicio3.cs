using Microsoft.EntityFrameworkCore;
using Escuela;

//EscuelaSqlite.Inicializar();

using var db = new EscuelaContext(); // Crear objeto de contexto

// USING

// INCISO A

//Esta consulta obtiene el nombre de los alumnos que figuran en la tabla de examenes (se encuentran repetidos)
var query = db.Alumnos.Join(db.Examenes,
                            a => a.AlumnoId,
                            e => e.AlumnoId,
                            (a, e) => a.Nombre);
var filtradoOrdenado = query.Distinct().OrderBy(nom => nom).ToList();
filtradoOrdenado.ForEach(alum => Console.WriteLine(alum));

Console.WriteLine();

//Esta es otra forma de hacer el ejercicio
var query2 = db.Alumnos.Include(a => a.Examenes);
query2.Where(a => a.Examenes.Count > 0)
    .OrderBy(nom => nom) //Ordenar por nombre
    .ToList() //Pasarlo a lista para así poder utilizar ForEach()
    .ForEach(alum => Console.WriteLine(alum.Nombre));

//      INCISO B

var query2 = db.Cursos.Where(c => c.Examenes.Count > 0)
                      .Select(c => new
                            {
                                Título = c.Titulo,
                                Cantidad = c.Examenes.Count
                            })
                      .OrderBy(obj => obj.Cantidad);
query2.ToList().ForEach(obj => Console.WriteLine(obj));

Console.WriteLine();

//      INCISO C

var query3 = db.Alumnos.Join(db.Examenes,
                            a => a.AlumnoId,
                            e => e.AlumnoId,
                            (a, e) => new
                            {
                                Alumno = a.Nombre,
                                Curso = e.CursoId,
                                Nota = e.Nota
                            });
var query3dos = db.Cursos.Join(query3,
                              c => c.CursoId,
                              q => q.Curso,
                              (c, q) => new
                              {
                                Alumno = q.Alumno,
                                Curso = c.Titulo,
                                Nota = q.Nota
                              });
query3dos.OrderBy(obj => obj.Alumno).ToList().ForEach(obj => Console.WriteLine(obj));

Console.WriteLine();

//      INCISO D

var query3filtrado = query3dos.Where(obj => obj.Nota >= 6);
query3filtrado.OrderBy(obj => obj.Alumno).ToList().ForEach(obj => Console.WriteLine(obj));

Console.WriteLine();

//      INCISO E

var query4 = db.Alumnos.Where(a => a.Examenes.Count == 0);
query4.ToList().ForEach(a => Console.WriteLine(a.Nombre));

Console.WriteLine();

//    INCISO F

double promedio;
List<object> listaIncisoF = new List<object>();
var query5 = db.Alumnos.Include(a => a.Examenes).Where(a => a.Examenes.Count > 0);
foreach (Alumno a in query5)
{
    promedio = obtenerNota(a.Examenes);
    var obj = new { Alumno = a.Nombre, Promedio = promedio };
    listaIncisoF.Add(obj);
}
listaIncisoF.ForEach(obj => Console.WriteLine(obj));

double obtenerNota(List<Examen>? listaExamenes)
{
    double promedio = 0;
    foreach (Examen ex in listaExamenes)
    {
        promedio += ex.Nota;
    }
    promedio = promedio / listaExamenes.Count;
    return promedio;
}

// USING
