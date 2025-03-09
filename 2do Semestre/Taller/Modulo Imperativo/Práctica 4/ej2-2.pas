//Este código se podría hacer mil veces mejor totalmente
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
    listaPrestamos = ^nodo3; //Para el arbol2
    nodo3 = record
        data: prestamo;
        sig: listaPrestamos;
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
    isbnyVeces = record //Lista para el módulo F y G
        ISBN: integer;
        vecesPrestado: integer;
    end;
    arbol3 = ^nodo4;
    nodo4 = record
        data: isbnyVeces;
        HI: arbol3;
        HD: arbol3;
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
        p.ISBN:= Random(20) - 1;
        writeln('ISBN del libro >', p.ISBN);
        if (p.ISBN <> corte) then begin
            p.nroSocio:= Random(50); writeln('Número de socio >', p.nroSocio);
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
            if (pres.ISBN > a^.data^.data.ISBN) then begin //Si el ISBN del registro es mayor al ISBN del nodo...
                cargarArbol_2(a^.HD, pres); //Mandarlo pa'la derecha
            end else if (pres.ISBN < a^.data^.data.ISBN) then begin //Si es menor...
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
            cargarArbol_1(a1, p); //Cargar primer árbol
            cargarArbol_2(a2, p); //Cargar segundo árbol
            writeln; //Espacio
            generarPrestamo(p); //Leer otro préstamo
        end;
    end;
    
//INDICES
function moduloB(a: arbol1; masGrande: integer):integer;
    begin
        if (a = nil) then begin //Si el arbol/nodo está vacío entonces
            moduloB:= 0;
        end else begin //Si no...
            if (a^.data.ISBN > masGrande) then //Si el ISBN del nodo actual es mayor al del parámetro...
                masGrande:= moduloB(a^.HD, a^.data.ISBN); //Invocar de nuevo el módulo pero con el nuevo valor
        end;
        moduloB:= masGrande; //Devolver el valor mas grande encontrado
    end;
procedure moduloC(a: arbol2; ISBNmin: integer; var l: listaPrestamos); //Devolver la lista del ISBN menor
    begin
        if (a <> nil) then begin
            if (a^.data^.data.ISBN < ISBNmin) then begin
                //writeln(a^.data^.data.ISBN,' y ', ISBNmin);
                ISBNmin:= a^.data^.data.ISBN;
                moduloC(a^.HI, ISBNmin, a^.data); //Invocar de nuevo el módulo con la lista menor encontrada hasta el momento
                l:= a^.data; //Recibir lista menor
            end;
        end;
    end;
procedure moduloD(a: arbol1; nroSocio: integer; var cantPrestamos: integer);
    begin
        if (a <> nil) then begin //No hay una foma eficiente de buscar en un árbol que está ordenado en base a otro elemento
            if (a^.data.nroSocio = nroSocio) then //Incrementar la cantidad
                cantPrestamos:= cantPrestamos + 1;
            moduloD(a^.HI, nroSocio, cantPrestamos);
            moduloD(a^.HD, nroSocio, cantPrestamos);
        end;
    end;
procedure moduloE(a: arbol2; nroSocio: integer; var cantPrestamos: integer); //Devolver la lista del ISBN menor
    //--Funcion interna
    function buscarPrestamosLista(nroSocio: integer; l: listaPrestamos):integer;
        var
            prest: integer;
        begin
            prest:= 0;
            if (l <> nil) then begin
                if (nroSocio = l^.data.nroSocio) then
                    prest:= prest + 1;
                prest:= prest + buscarPrestamosLista(nroSocio, l^.sig);
            end;
            buscarPrestamosLista:= prest;
        end;
    //--
    begin
        if (a <> nil) then begin //No hay una forma eficiente de buscar en un árbol que está ordenado en base a otro elemento
            cantPrestamos:= cantPrestamos + buscarPrestamosLista(nroSocio, a^.data);
            moduloE(a^.HI, nroSocio, cantPrestamos);
            moduloE(a^.HD, nroSocio, cantPrestamos);
        end;
    end;
//PUNTO F
procedure cargarArbol_3(var a: arbol3; ISBN, cantVeces: integer); //Cargar el arbol3
    begin
        if (a = nil) then begin
            new(a);
            a^.data.ISBN:= ISBN;
            a^.data.vecesPrestado:= cantVeces;
            a^.HI:= nil;
            a^.HD:= nil;
        end else begin
            if (ISBN >= a^.data.ISBN) then //Si el ISBN del registro es mayor o igual al ISBN del nodo...
                cargarArbol_3(a^.HD, ISBN, cantVeces) //Mandarlo pa'la derecha
            else
                cargarArbol_3(a^.HI, ISBN, cantVeces); //Mandarlo pa'la izquierda
        end;
    end;
function cantISBN_1(a1: arbol1; ISBN: integer):integer; //Contar la cantidad de ISBNs que hay en un arbol tipo arbol1
    var
        cantidad: integer;
    begin
        cantidad:= 0;
        if (a1 = nil) then begin
            cantISBN_1:= 0;
        end else begin
            if (ISBN = a1^.data.ISBN) then
                cantidad:= cantidad + 1;
            cantidad:= cantidad + cantISBN_1(a1^.HI, ISBN);
            cantidad:= cantidad + cantISBN_1(a1^.HD, ISBN);
        end;
        cantISBN_1:= cantidad;
    end;
procedure moduloF(a1: arbol1; var a3: arbol3);
    begin
        if (a1 <> nil) then begin
            cargarArbol_3(a3, a1^.data.ISBN, cantISBN_1(a1, a1^.data.ISBN));
            moduloF(a1^.HI, a3);
            moduloF(a1^.HD, a3);
        end;
    end;
//PUNTO G
procedure encontrarHoja(a2: arbol2; ISBN: integer; var l: listaPrestamos);
  begin
    if (a2 <> nil) and (ISBN <> a2^.data^.data.ISBN) then begin
      if (ISBN < a2^.data^.data.ISBN) then begin
        encontrarHoja(a2^.HI, ISBN, l);
      end else begin
        encontrarHoja(a2^.HD, ISBN, l);
      end;
    end;
    if (a2 <> nil) and (ISBN = a2^.data^.data.ISBN) then
      l:= a2^.data;
  end;
function contarPrestamos(l: listaPrestamos):integer;
  begin
    if (l = nil) then
      contarPrestamos:= 0
    else
      contarPrestamos:= 1 + contarPrestamos(l^.sig);
  end;
function cantISBN_2(a2: arbol2; ISBN: integer):integer; //Contar la cantidad de ISBNs que hay en un arbol tipo arbol2 (está hecho horrible)
    var
        aux: listaPrestamos;
    begin
        aux:= nil;
        encontrarHoja(a2, ISBN, aux);
        cantISBN_2:= contarPrestamos(aux);
    end;
procedure moduloG(a2: arbol2; var a3: arbol3);
    begin
        if (a2 <> nil) then begin
            cargarArbol_3(a3, a2^.data^.data.ISBN, cantISBN_2(a2, a2^.data^.data.ISBN));
            moduloG(a2^.HI, a3);
            moduloG(a2^.HD, a3);
        end;
    end;
//PUNTO I

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
procedure imprimirArbol_2(a: arbol2);
    begin
        if (a <> nil) then begin
            imprimirArbol_2(a^.HI);
            imprimirListaPres(a^.data);
            writeln;
            imprimirArbol_2(a^.HD);
        end;
    end;
procedure imprimirArbol_3(a3: arbol3); //PUNTO H - Orden
    begin
        if (a3 <> nil) then begin
            imprimirArbol_3(a3^.HI);
            writeln('ISBN: ',a3^.data.ISBN,' / cantidad de veces que se prestó: ',a3^.data.vecesPrestado);
            imprimirArbol_3(a3^.HD);
        end;
    end;
//VARIABLES LOCALES
var
    a1: arbol1;
    a2: arbol2;
    a3: arbol3;
    l1: listaPrestamos;
    nroSocio, cantPrestamos, cantTotal: integer;
    
//PROGRAMA PRINCIPAL
begin
    //Inicializar variables
    a1:= nil;
    a2:= nil;
    a3:= nil;
    l1:= nil;
    cantPrestamos:= 0;
    nroSocio:= 0;
    cantTotal:= 0;
    
    //Punto A
    Randomize;
    generarArboles(a1, a2);
    imprimirArbol_2(a2);
    write('El ISBN mas grande del Arbol 1 es: ', moduloB(a1, 0));
    moduloC(a2, 9999, l1);
    imprimirListaPres(l1);
    write('Ingrese un número de socio: '); readln(nroSocio);
    //moduloD(a1, nroSocio, cantPrestamos);
    moduloE(a2, nroSocio, cantPrestamos);
    writeln('Cantidad de prestamos del socio N°',nroSocio,': ',cantPrestamos);
    writeln(cantISBN_1(a1, 83));
    writeln(cantISBN_2(a2, 83));
    moduloF(a1, a3);
    imprimirArbol_3(a3);
    //writeln;
    //moduloG(a2, a3); //REPARAR MODULO G
    imprimirArbol_3(a3);
    //moduloI(a1, 10, 15, cantTotal);
    writeln('Cantidad total de 10 ISBN: ', cantISBN_1(a1, 10));
end.
