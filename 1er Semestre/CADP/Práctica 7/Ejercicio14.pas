//De cada préstamo se lee: nro. de préstamo, ISBN del libro prestado, nro. de
//socio al que se prestó el libro, día del préstamo (1..31). La información de los préstamos se lee de manera
//ordenada por ISBN y finaliza cuando se ingresa el ISBN -1 (que no debe procesarse).
program Ejercicio14;
const
    corte = -1;
type
    lista = ^nodo;
    t_prestamo = 1..31;
    prestamo = record
        nroPrestamo: integer;
        ISBN: longint;
        nroSocio: integer;
        dia_prestamo: t_prestamo;
    end;
    nodo = record
        data: prestamo;
        sig: lista;
    end;
procedure leerPrestamo(var p: prestamo);
    begin
        write('Barra de ISBN: '); readln(p.ISBN);
        while (p.ISBN <> corte) do begin
            with p do begin
                write('Número de prestamo: '); readln(nroPrestamo);
                write('Número de socio: '); readln(nroSocio);
                write('Día del prestamo: '); readln(dia_prestamo);
            end;
        end;
    end;
var
    l: lista;
begin
    l:= nil;
    cargarLista(l);
end.
