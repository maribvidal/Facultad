program Ejercicio2;
type
    lista = ^nodo;
    persona = record
        dni: integer;
        nombre: string;
        apellido: string;
    end;
    nodo = record
        dato: persona;
        sig: lista;
    end;
procedure leerPersona(var p: persona); //FALTA - PASAR P COMO REFERENCIA (para obtener su valor)
    begin
        readln(p.dni);
        if (p.dni <> 0) then begin
            readln(p.nombre);
            readln(p.apellido);
        end;
    end;
{Agrega un nodo a la lista}
procedure agregarAdelante(var l: lista; p: persona); // FALTA - PASAR L POR REFERENCIA
    var
        aux: lista;
    begin
        new(aux); //FALTA - DECLARAR DIRECCIÓN
        aux^.dato:= p;
        aux^.sig:= nil; // El siguiente de AUX es L
        if (l = nil) then begin // FALTA - REVISAR SI L ES NIL (primer elemento) O SI L TIENE OTRA DIRECCIÓN
            l:= aux;
        end else begin
            aux^.sig:= l;
            l:= aux;
        end;
    end;
{Carga la lista hasta que llega el dni 0}
procedure generarLista(var l: lista);
    var
        p: persona; //FALTA - P no es un NODO, si no una PERSONA
    begin
        leerPersona(p);
        while (p.dni <> 0) do begin
            agregarAdelante(l, p);
            writeln('AGREGADO');
            leerPersona(p); //FALTA - Leer otra persona
        end;
    end;
procedure imprimirInformacion(l: lista); //FALTA - No pasar L por REFERENCIA para no perder la posición INICIAL
    begin
        while (l <> nil) do begin
            writeln('DNI: ', l^.dato.dni, '/ Nombre: ', l^.dato.nombre, '/ Apellido:', l^.dato.apellido); //FALTA - .nombre/apellido está dentro de (puntero).dato
            l:= l^.sig;
        end;
    end;
{Programa principal}
var
    l: lista;
begin
    l:= nil; //FALTA - No declarar primer elemento como NIL
    generarLista(l);
    imprimirInformacion(l);
end.
