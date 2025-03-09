program Ejercicio11;
const
    corte = 0;
type
    lista = ^nodo;
    alumno = record
        codigo: 0..1000;
        apellido: string[10];
        promedio: real;
    end;
    nodo = record
        data: alumno;
        sig: lista;
    end;
procedure crearNodo(var n: lista);
    begin
        n:= nil;
    end;
procedure leerAlumno(var a: alumno);
    begin
        write('CÓDIGO DEL ALUMNO >'); readln(a.codigo);
        if (a.codigo <> corte) then begin
            write('APELLIDO DEL ALUMNO >'); readln(a.apellido);
            write('PROMEDIO DE LA CARRERA DEL ALUMNO >'); readln(a.promedio);
        end;
    end;
procedure insertarNodo(var n: lista; a: alumno); //Insertar nodo en la lista de forma ordenada (mayor a menor)
    var
        aux, actual, anterior: lista;
    begin
        new(aux);
        aux^.data:= a;
        aux^.sig:= nil;
        if (n = nil) then begin //Si la lista está vacia...
            n:= aux;
        end else begin //Si no...
            actual:= n;
            anterior:= n;
            while (actual <> nil) and (actual^.data.promedio > aux^.data.promedio) do begin //Buscar la posición
                anterior:= actual; //A anterior se le asigna la dirección de actual
                actual:= actual^.sig; //Actual toma la dirección de su siguiente
            end;
            if (actual = n) then begin //Si la dirección de actual es igual a la del nodo ingresado (nil)
                aux^.sig:= n;
                n:= aux;
            end else begin //Si el nodo se tiene que insertar en el medio o en el final...
                anterior^.sig:= aux;
                aux^.sig:= actual;
            end;
        end;
    end;
procedure cargarLista(var l: lista);
    var
        a: alumno;
    begin
        leerAlumno(a);
        while (a.codigo <> corte) do begin
            insertarNodo(l, a);
            writeln;
            leerAlumno(a);
        end;
    end;
procedure leerLista(l: lista);
    begin
        while (l <> nil) do begin
            writeln('Promedio del alumno código ',l^.data.codigo,': ',l^.data.promedio:2:2);
            l:= l^.sig;
        end;
    end;
var
    l: lista;
begin
    crearNodo(l);
    cargarLista(l);
    writeln;
    leerLista(l);
end.
