using Microsoft.EntityFrameworkCore;
using Escuela;

//EscuelaSqlite.Inicializar();

using var db = new EscuelaContext(); // Crear objeto de contexto

// USING
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
// USING
