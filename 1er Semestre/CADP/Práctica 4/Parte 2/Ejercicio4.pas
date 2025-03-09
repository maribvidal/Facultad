program ej4;
const
    dimF = 1000; //"Vector de a lo sumo 1000 elementos"
type
    rangoNum = 0..9999;
    rangoTxt = string[40];
    alumno = record
        nro_alumno, asistencias: rangoNum;
        apellido, nombre: rangoTxt;
    end;
    vector = array [1..dimF] of alumno; //Vector para los alumnos
procedure leerAlumno(var a: alumno);
    begin
        write('Número de alumno: >'); readln(a.nro_alumno);
        write('Nombre de alumno: >'); readln(a.nombre);
        write('Apellido de alumno: >'); readln(a.apellido);
        write('Cantidad de asistencias: >'); readln(a.asistencias);
    end;
procedure cargarVector(var v: vector; var dimL: integer);
    var
        i: integer;
        seguir: boolean;
        aux: string;
    begin
        i:= 0;
        seguir:= true;
        while (seguir) and (i <= dimF) do begin //Mientras la dimensión lógica no supere la dimensión física...
            i:= i + 1;
            dimL:= dimL + 1;
            leerAlumno(v[i]);
            write('¿Seguir ingresando datos? (SI/NO): >'); readln(aux);
            seguir:= (aux = 'SI'); //Mientras la persona siga queriendo meter datos al vector...
            writeln;
        end;
    end;
function posicionAlumno(v: vector; nro_alumno: integer):integer; //Punto A
    var
        i: integer;
    begin
        for i:= 1 to dimF do begin
            if (v[i].nro_alumno = nro_alumno) then begin
                posicionAlumno:= i;
            end;
        end;
        //El alumno seguro existe, por lo que no hay que poner una estructura de control para el caso contrario
    end;
procedure insertarAlumno(var v: vector; var dimL: integer; a: alumno); //Punto B
    begin
        if (dimL < dimF) then begin //Verificar si la dimensión lógica puede seguir aceptando gente o no
            v[dimL+1]:= a; //Insertar alumno
            dimL:= dimL + 1;
        end;
    end;
procedure eliminarAlumnoA(var v: vector; var dimL: integer; posAlumno: integer); //Punto C
    var
        i: integer;
    begin
        for i:= posAlumno to dimL do begin //Hacer que recorra desde la posición ingresada hasta el límite lógico
            //writeln(v[i].asistencias,' ',v[i+1].asistencias);
            v[i]:= v[i+1]; //Asignarle al elemento actual el valor del elemento siguiente
            //writeln(v[i].asistencias,' ',v[i+1].asistencias);
            //writeln;
        end;
        dimL:= dimL - 1; //Sustraer un espacio disponible de la dimensión lógica
    end;
procedure eliminarAlumnoB(var v: vector; var dimL: integer; nro_alumno: integer); //Punto D
    var
        posAlumno: integer;
    begin
        posAlumno:= posicionAlumno(v, nro_alumno);
        eliminarAlumnoA(v, dimL, posAlumno);
    end;
procedure eliminarAlumnosPorAsistencia(var v: vector; var dimL: integer);
    var
        i, eliminados: integer;
    begin
        i:= 0;
        eliminados:= 0;
        while (i + eliminados <= dimL) do begin
            i:= i + 1;
            if (v[i].asistencias = 0) then begin
                eliminarAlumnoA(v, dimL, i);
                eliminados:= eliminados + 1;
            end;
        end;
        writeln('Se han eliminado un total de ',eliminados,' alumnos.');
    end;
var
    v: vector;
    i, dimL: integer;
begin
    cargarVector(v, dimL);
    eliminarAlumnosPorAsistencia(v, dimL);
    for i:= 1 to dimL do begin
        write(v[i].asistencias, ' ');
    end;
end.
