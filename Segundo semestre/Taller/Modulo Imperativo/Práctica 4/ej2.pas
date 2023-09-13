program p4ej2;

//CONSTANTES
const
    corte = -1;

//VARIABLES ESPECIALES
type
    t_dia = 1..30;
    t_mes = 1..12;
    
    prestamo = record
        ISBN: integer;
        nroSocio: integer;
        dia: t_dia;
        mes: t_mes;
        cantDiasPrestados: integer;
    end;
    arbol1 = ^nodo1; //Arbol simplemente ordenado por ISBN
    arbol2 = ^nodo2; //Arbol que almacena todos los prestamos que compartan el mismo ISBN en un nodo (una lista)
    nodo1 = record 
        data: prestamo;
        HI: arbol1;
        HD: arbol1;
    end;
    nodo2 = record
        data: listaPrestamos;
        HI: arbol2;
        HD: arbol2;
    end;
    listaPrestamos = ^nodo3; //Para el arbol2
    nodo3 = record
        data: prestamo;
        sig: listaPrestamos;
    end;
//PROCESOS
{procedure leerPrestamo(var p: prestamo); //Leer registro del prestamo
    begin
        write('Ingrese ISBN del libro >'); readln(p.ISBN);
        if (p.ISBN <> corte) then begin
            write('Ingrese el número de socio >'); readln(p.nroSocio);
            write('Ingrese el día en el que se solicitó el préstamo >'); readln(p.dia);
            write('Ingrese el mes en el que se solicitó el préstamo >'); readln(p.mes);
            write('Ingrese la cantidad de días que duró el préstamo >'); readln(p.cantDiasPrestados);
        end;
    end;}
procedure generarPrestamo(var p: prestamo); //Generar préstamo
    begin
        p.ISBN:= Random(100) - 1;
        writeln('ISBN del libro >', p.ISBN);
        if (p.ISBN <> corte) then begin
            p.nroSocio:= Random(1000); writeln('Número de socio >', p.nroSocio);
            p.dia:= 1 + Random(29); writeln('Día en el que se solicitó el préstamo >', p.dia);
            p.mes:= 1 + Random(11); writeln('Mes en el que se solicitó el préstamo >', p.mes);
            p.cantDiasPrestados:= 1 + Random(99); writeln('Cantidad de días que duró el préstamo >', p.cantDiasPrestados);
        end;
    end;
procedure cargarArbol_1(var a: arbol1; pres: prestamo); //Cargar el arbol simple
    begin
        if (a = nil) then begin
            new(a);
            a^.data:= pres;
            a^.HI:= nil;
            a^.HD:= nil;
        end else begin
            if (pres.ISBN >= a^.data.ISBN) then //Si el ISBN del registro es mayor o igual al ISBN del nodo...
                cargarArbol_1(a^.HD, pres) //Mandarlo pa'la derecha
            else
                cargarArbol_1(a^.HI, pres); //Mandarlo pa'la izquierda
        end;
    end;
procedure agregarNodo(var l: listaPrestamos; pres: prestamo);
    var
        aux: listaPrestamos;
    begin
        new(aux);
        aux^.data:= pres;
        aux^.sig:= l;
        l:= aux;
    end;
procedure cargarArbol_2(var a: arbol2; pres: prestamo); //Cargar el arbol compuesto
    begin
        if (a = nil) then begin
            new(a);
            a^.data:= nil; //Inicializar lista en nil
            agregarNodo(a^.data, pres); //Agregarle el préstamo
            a^.HI:= nil;
            a^.HD:= nil;
        end else begin
            if (pres.ISBN > a^.data.ISBN) then begin //Si el ISBN del registro es mayor al ISBN del nodo...
                cargarArbol_2(a^.HD, pres); //Mandarlo pa'la derecha
            end else if (pres.ISBN < a^.data.ISBN) then begin //Si es menor...
                cargarArbol_2(a^.HI, pres); //Mandarlo pa'la izquierda
            end else begin //Si es igual...
                agregarNodo(a^.data, pres); //Agregarle el préstamo al nódo
            end;
        end;
    end;
procedure generarArboles(var a1: arbol1; var a2: arbol2); //Este módulo tiene que generar los dos tipos de árboles que se piden
    var
        p: prestamo;
    begin
        generarPrestamo(p);
        while (p.ISBN <> corte) do begin
            cargarArbol_1(a1, pres); //Cargar primer árbol
            cargarArbol_2(a2, pres); //Cargar segundo árbol
            writeln; //Espacio
            generarPrestamo(p); //Leer otro préstamo
        end;
    end;
    
//PROCESOS PARA IMPRIMIR
procedure imprimirArbol_1(a: arbol1);
    begin
        if (a <> nil) then begin
            imprimirArbol_1(a^.HI);
            writeln('ISBN: ', a^.data.ISBN);
            imprimirArbol_1(a^.HD);
        end;
    end;
procedure imprimirListaPres(l: listaPrestamos);
    begin
        while (l <> nil) do begin
            writeln('ISBN: ', l^.data.ISBN, ' / numero: ', l^.data.nroSocio);
            l:= l^.sig;
        end;
    end;
procedure imprimirArbol_2(a: arbol1);
    begin
        if (a <> nil) then begin
            imprimirArbol_1(a^.HI);
            imprimirListaPres(a^.data);
            imprimirArbol_1(a^.HD);
        end;
    end;
//VARIABLES LOCALES
var
    a1: arbol1;
    a2: arbol2;
    
//PROGRAMA PRINCIPAL
begin
    //Inicializar arboles en nil
    a1:= nil;
    a2:= nil;
    
    Randomize;
    generarArboles(a1, a2);
    imprimirArbol_2(a2);
end.
