{3. Una facultad nos ha encargado procesar la información de sus alumnos de la carrera XXX.
Esta carrera tiene 30 materias. Implementar un programa con:
a. Un módulo que lea la información de los finales rendidos por los alumnos y los
almacene en dos estructuras de datos.
i. Una estructura que para cada alumno se almacenen sólo código y nota de las
materias aprobadas (4 a 10). De cada final rendido se lee el código del alumno, el
código de materia y la nota (valor entre 1 y 10). La lectura de los finales finaliza con
nota -1. La estructura debe ser eficiente para buscar por código de alumno.
ii. Otra estructura que almacene para cada materia, su código y todos los finales
rendidos en esa materia (código de alumno y nota).
b. Un módulo que reciba la estructura generada en i. y un código de alumno y retorne los
códigos y promedios de los alumnos cuyos códigos sean mayor al ingresado.
c. Un módulo que reciba la estructura generada en i., dos códigos de alumnos y un valor
entero, y retorne la cantidad de alumnos con cantidad de finales aprobados igual al
valor ingresado para aquellos alumnos cuyos códigos están comprendidos entre los dos
códigos de alumnos ingresados.
* }
Program P4Ej3;
const
  corte = -1;
type
  t_materias = 1..30;
  t_nota = -1..10;
  materia = record
    id: t_materia;
    nota: t_nota;
  end;
  vectorMaterias = array [t_materias] of materia;
  alumno = record
    codigo: integer;
    diml:integer;
    vector: vectorMaterias;
  end;
  finalRendido = record
    codigoAlumno: integer;
    codigoMateria: t_materia;
    nota: t_nota;
  end;
procedure leerAlumno(var a: alumno);
| var
    nota: integer;
  begin
    a.diml:= 0;
    nota:= 0;
    write('Codigo de alumno: '); readln(a.codigo);
    write('Nota: '); readln(nota);
    while (nota <> corte) and (a.diml < 30) do begin
      a.diml:= a.diml + 1;
      a.vector[a.diml].nota:= nota;
      write('Materia: '); readln(a.vector[a.diml].materia);
      write('Nota: '); readln(nota);
    end;
begin
end.
