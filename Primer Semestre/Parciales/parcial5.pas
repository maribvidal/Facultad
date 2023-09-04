{Una empresa de venta de tickets de tren está analizando la información de los
viajes realizados por sus trenes durante el año 2022. Para ello, se dispone de
una estructura de datos con la información de todos los viajes. De cada viaje se
conoce el código de tren, el mes en que se realizó el viaje (entre 1 y 12), la
cantidad de pasajeros que viajaron, y el código de la ciudad de destino (entre 1
y 20). La información se encuentra ordenada por código de tren. Además, la
empresa dispone de una estructura de datos con información del costo de ticket
por ciudad destino.

Realizar un programa que procese la información de los viajes y:
A. Genere una lista que tenga, por cada código del tren, la cantidad de viajes
realizados.
B. Informe el mes con mayor monto recaudado.
C. COMPLETO: Informe el promedio de pasajeros por cada tren entre todos sus 
viajes.}

program parcial;
const
    dimF = 20;
type
    t_mes = 1..12;
    t_destino = 1..dimF;
    viaje = record
        codTren: integer;
        mes: t_mes;
        pasajeros: integer;
        codDestino: t_destino;
    end;
    viaje2 = record
        codTren: integer;
        viajesRealizados: integer;
    end;
    vectorMes = array [t_mes] of real;
    vectorCostos = array [t_destino] of real; //SE DISPONE
    lista = ^nodo; //SE DISPONE
    nodo = record
        data: viaje;
        sig: lista;
    end;
    lista2 = ^nodo2;
    nodo2 = record
        data: viaje2;
        sig: lista2;
    end;
//SE DISPONE TODO ESTO
procedure cargarVector(var v: vectorCostos);
    var
        i: integer;
    begin
        for i:= 1 to dimF do begin
            v[i]:= Random(10);
        end;
    end;
procedure leerViaje(var via: viaje);
    begin
        write('CÓDIGO DEL TREN: '); readln(via.codTren);
        if (via.codTren <> -1) then begin
            write('MES DEL VIAJE: '); readln(via.mes);
            write('CANTIDAD DE PASAJEROS: '); readln(via.pasajeros);
            write('CÓDIGO DE LA CIUDAD DE DESTINO: '); readln(via.codDestino);
        end;
    end;
procedure agregarOrdenado(var l: lista; data: viaje);
    var
        aux, ant, act: lista;
    begin
        new(aux);
        aux^.data:= data;
        aux^.sig:= nil;
        if (l = nil) then begin
            l:= aux;
        end else begin
            ant:= l;
            act:= l;
            while (act <> nil) and (act^.data.codTren < aux^.data.codTren) do begin
                ant:= act;
                act:= act^.sig;
            end;
            if (act = l) then begin
                aux^.sig:= l;
                l:= aux;
            end else begin
                ant^.sig:= aux; 
                aux^.sig:= act;
            end;
        end;
    end;
procedure cargarLista(var l: lista);
    var
        via: viaje;
    begin
        leerViaje(via);
        while (via.codTren <> -1) do begin
            agregarOrdenado(l, via);
            writeln;
            leerViaje(via);
        end;
    end;
procedure informarLista(l: lista; indice: integer); //Implementado de forma recursiva
    begin
        if (l <> nil) then begin
            writeln('Nodo n°',indice,': ',l^.data.codTren,' ',l^.data.mes,' ',l^.data.pasajeros,' ',l^.data.codDestino);
            l:= l^.sig;
            informarLista(l, indice + 1);
        end;
    end;
//LO SIGUIENTE NO SE DISPONE
procedure inicializarVector(var v2: vectorMes);
    var
        i: integer;
    begin
        for i:= 1 to 12 do begin
            v2[i]:= 0;
        end;
    end;
procedure agregarNodo(var l2: lista2; data: viaje2); //No se especifica si tiene que ser ordenado o no
    var
        aux: lista2;
    begin
        new(aux);
        aux^.data:= data;
        aux^.sig:= l2;
        l2:= aux;
    end;
procedure cargarLista2(l: lista; var l2: lista2); //Punto A
    var
        codActual: integer;
        via2: viaje2;
        aux: real;
    begin
        while (l <> nil) do begin
            codActual:= l^.data.codTren;
            via2.viajesRealizados:= 0;
            aux:= 0;
            while (l <> nil) and (codActual = l^.data.codTren) do begin
                via2.viajesRealizados:= via2.viajesRealizados + 1;
                aux:= aux + l^.data.pasajeros;
                l:= l^.sig;
            end;
            via2.codTren:= codActual;
            aux:= (aux / via2.viajesRealizados);
            writeln('Para el tren código ',codActual,', el promedio de pasajeros es de ',aux:2:2);
            agregarNodo(l2, via2); //Agregar elemento
        end;
    end;
procedure cargarVector2(l: lista; v: vectorCostos; var v2: vectorMes); //Punto B
    begin
        while (l <> nil) do begin
            v2[l^.data.mes]:= v2[l^.data.mes] + v[l^.data.codDestino];
            writeln(l^.data.mes,' ',l^.data.codDestino);
            l:= l^.sig;
        end;
    end;
procedure actualizarMaximo(mesActual: integer; montoActual: real; var mesNuevo: integer; var montoNuevo: real);
    begin
        if (montoActual > montoNuevo) then begin
            montoNuevo:= montoActual;
            mesNuevo:= mesActual;
        end;
    end;
function informarMesMax(v2: vectorMes):integer;
    var
        i, mesNuevo: integer;
        montoNuevo: real;
    begin
        mesNuevo:= 0;
        montoNuevo:= -1;
        for i:= 1 to 12 do begin
            actualizarMaximo(i, v2[i], mesNuevo, montoNuevo);
        end;
        informarMesMax:= mesNuevo;
    end;
var
    l: lista;
    l2: lista2;
    v: vectorCostos;
    v2: vectorMes;
begin
    Randomize; //para probar el código
    cargarVector(v);
    l:= nil;
    cargarLista(l);
    informarLista(l, 1);
    //Lo que pide el enunciado
    inicializarVector(v2);
    cargarVector2(l, v, v2);
    cargarLista2(l, l2);
    writeln('El mes que mayor plata ha recaudado ha sido el ', informarMesMax(v2));
end.
