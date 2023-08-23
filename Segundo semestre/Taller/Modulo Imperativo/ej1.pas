program ejercicioPractica;
const
    materiasMAX = 36;
type
    materia = record
        aprobada: boolean;
        notaObtenida: integer;
    end;
    vectorMaterias = array [1..materiasMAX] of materia;
    alumno = record
        apellido: string;
        nroAlumno: integer;
        anoIngreso: integer;
        materias: vectorMaterias;
    end;
    lista = ^nodo;
    nodo = record
        data: alumno;
        sig: lista;
    end;
procedure leerAlumno(var a: alumno);
    var
        i: integer;
        letra: char;
    begin
        write('Ingrese el número del alúmno: '); readln(a.nroAlumno);
        if (a.nroAlumno <> 11111) then begin
            write('Ingrese el apellido del alúmno: '); readln(a.apellido);
            write('Ingrese el año de ingreso: '); readln(a.anoIngreso);
            for i:= 1 to materiasMAX do begin
                write('¿El alumno aprobó la materia N°',i,'? (s/n): '); readln(letra);
                a.materias[i].aprobada:= (letra = 's'); //Poner verdadero o falso dependiendo de si se puso S o N
                if (letra = 's') then begin
                    write('Ingrese la nota obtenida: '); readln(a.materias[i].notaObtenida);
                end;
            end;
        end;
    end;
procedure agregarNodo(var l: lista; contenido: alumno);
    var
        aux: lista;
    begin
        new(aux);
        aux^.data:= contenido;
        aux^.sig:= nil;
        if (l <> nil) then
            aux^.sig:= l;
        l:= aux;
    end;
procedure cargarLista(var l: lista);
    var
        a: alumno;
    begin
        leerAlumno(a);
        while (a.nroAlumno <> 11111) do begin
            agregarNodo(l, a);
            writeln;
            leerAlumno(a);
        end;
    end;
procedure procesarLista(l: lista);
    var
        i: integer;
        promedio: real;
    begin
        while (l <> nil) do begin
            promedio:= 0;
            for i:= 1 to materiasMAX do begin
                if (l^.data.materias[i].aprobada) then
                    promedio:= promedio + l^.data.materias[i].notaObtenida; //Sumar nota solo si es una materia aprobada
            end;
            promedio:= promedio / materiasMAX; //Dividir por la cantidad de materias
            writeln('El promedio del alumno N°',l^.data.nroAlumno,' es de ',promedio:2:2);
            l:= l^.sig;
        end;
    end;
var
    l: lista;
begin
    l:= nil;
    cargarLista(l);
    procesarLista(l);
end.
