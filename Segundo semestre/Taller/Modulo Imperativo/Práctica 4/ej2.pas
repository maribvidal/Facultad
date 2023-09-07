{ Una biblioteca nos ha encargado procesar la información de los préstamos realizados
durante el año 2021. De cada préstamo se conoce el ISBN del libro, el número de socio, día
y mes del préstamo y cantidad de días prestados. Implementar un programa con:
a. Un módulo que lea préstamos y retorne 2 estructuras de datos con la información de
los préstamos. La lectura de los préstamos finaliza con ISBN -1. Las estructuras deben
ser eficientes para buscar por ISBN.
i. En una estructura cada préstamo debe estar en un nodo.
ii. En otra estructura, cada nodo debe contener todos los préstamos realizados al ISBN.
(prestar atención sobre los datos que se almacenan).
b. Un módulo recursivo que reciba la estructura generada en i. y retorne el ISBN más
grande.
}
program ej2pr3;
const
    corte = -1;
type
    prestamo = record
        ISBN: integer;
        nroSocio: integer;
        fecha: string[12];
        cantidadDias: integer;
    end;
    lista = ^nodo; //Cargar lista
    nodo = record
        data: prestamo;
        sig: lista;
    end;
procedure leerPrestamo(var pr: prestamo);
    begin
        write('ISBN: '); readln(pr.ISBN);
        if (pr.ISBN <> corte) then begin
            write('Número de socio: '); readln(pr.nroSocio);
            write('Fecha: '); readln(pr.fecha);
            write('Cantidad de días: '); readln(pr.cantidadDias);
        end;
    end;
procedure agregarNodo(var l: lista; data2: prestamo); //Cargar lista normal
    var
        aux: lista;
    begin
        new(aux);
        aux^.data:= data2;
        aux^.sig:= l;
        l:= aux;
    end;
procedure imprimirLista(l: lista);
    begin
        while (l <> nil) do begin
            writeln('Nodo de ISBN numero ',l^.data.ISBN);
            l:= l^.sig;
        end;
    end;
procedure imprimirArbol(a: arbol);
    begin
        if (a <> nil) then begin
            imprimirArbol(a^.HI);
            writeln('ISBN: ',a^.data.ISBN);
            imprimirLista(a^.data);
            imprimirArbol(a^.HD);
        end;
    end;
var
    a: arbol;
    l: lista;
begin
    cargarEstructuras(a, l);
    imprimirArbol(a);
end.
