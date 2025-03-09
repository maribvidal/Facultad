//3. Una remisería dispone de información acerca de los viajes realizados durante el mes de mayo de 2020.
//De cada viaje se conoce: número de viaje, código de auto, dirección de origen, dirección de destino y
//kilómetros recorridos durante el viaje. Esta información se encuentra ordenada por código de auto y
//para un mismo código de auto pueden existir 1 o más viajes. Se pide:
//a. Informar los dos códigos de auto que más kilómetros recorrieron.
//b. Generar una lista nueva con los viajes de más de 5 kilómetros recorridos, ordenada por número de viaje.

program Hello;
type
    viaje = record
        numViaje: integer;
        codAuto: integer;
        dirOrigen: string;
        dirDestino: string;
        kmRecorridos: integer;
    end;
    lista = ^nodo; //Lista que se dispone
    nodo = record
        data: viaje;
        sig: lista;
    end;
    lista2 = ^nodo2; //Lista nueva
    nodo2 = record
        data: viaje;
        sig: lista2;
    end;
function esPar(num: integer):boolean; //LO HAGO DE EJERCICIO
    var
        aux, aux2: integer;
    begin
        aux:= 0; //Inicializar variables
        aux2:= 0;
        while (num <> 0) do begin
            if (((num mod 10) mod 2) = 0) then
                aux:= aux + 1;
            aux2:= aux2 + 1;
            num:= num div 10;
        end;
        esPar:= (aux = aux2); //Si ambas variables son iguales, es porque el número es PAR
    end;
procedure leerViaje(var v: viaje); //SE DISPONE
    begin
        //write('Ingrese el número del viaje: '); readln(v.numViaje);
        write('Ingrese el código del auto: '); readln(v.codAuto);
        //write('Ingrese la dirección de origen: '); readln(v.dirOrigen);
        //write('Ingrese la dirección de llegada: '); readln(v.dirDestino);
        write('Ingrese la cantidad de kilometros recorridos: '); readln(v.kmRecorridos);
    end;
procedure agregarNodo(var l: lista; contenido: viaje); //SE DISPONE
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
procedure cargarLista(var l: lista); //SE DISPONE
    var
        seguir: integer;
        v: viaje;
    begin
        seguir:= 1;
        while (seguir <> 0) do begin
            leerViaje(v);
            agregarNodo(l, v);
            write('¿Seguir? (0/1): '); readln(seguir);
        end;
    end;
procedure agregarNodo2(var l2: lista2; contenido: viaje);
    var
        aux: lista2;
    begin
        new(aux);
        aux^.data:= contenido;
        aux^.sig:= nil;
        if (l2 <> nil) then
            aux^.sig:= l2;
        l2:= aux;
    end;
procedure actualizarMaximos(codActual, kmAcumulado: integer; var codAuto1, codAuto2, kmRec1, kmRec2: integer);
    begin
        if (kmAcumulado > kmRec1) then begin
            codAuto2:= codAuto1;
            kmRec2:= kmRec1;
            codAuto1:= codActual;
            kmRec1:= kmAcumulado;
        end else if (kmAcumulado > kmRec2) then begin
            codAuto2:= codActual;
            kmRec2:= kmAcumulado;
        end;
    end;
procedure generarLista2(l: lista; var l2: lista2);
    begin
        //La lista2 va a estar ordenada por número de viaje de por si, ya que la primera lista estaba ordenada
        while (l <> nil) do begin 
            if (l^.data.kmRecorridos > 5) then
                agregarNodo2(l2, l^.data);
            l:= l^.sig; //Ir al próximo elemento
        end;
    end;
procedure procesarLista(l: lista);
    var
        codActual, codAuto1, codAuto2, kmRec1, kmRec2, kmAcumulador: integer;
    begin
        //Recorrer la lista
        codAuto1:= 0;
        codAuto2:= 0;
        kmRec1:= 0;
        kmRec2:= 0;
        while (l <> nil) do begin
            codActual:= l^.data.codAuto; //Actualizar el código del auto
            kmAcumulador:= 0;
            while (l <> nil) and (l^.data.codAuto = codActual) do begin //La información se encuentra ordenada por código de auto
                kmAcumulador:= kmAcumulador + l^.data.kmRecorridos; //Sumar los KM recorridos por el auto
                if (esPar(l^.data.codAuto)) then
                    write('El código ',l^.data.codAuto,' es PAR');
                l:= l^.sig; //Ir al próximo elemento
            end;
            actualizarMaximos(codActual, kmAcumulador, codAuto1, codAuto2, kmRec1, kmRec2);
        end;
        write('Los códigos de los autos que mas kilometros recorrieron son: ',codAuto1,' ',codAuto2);
    end;
var
    l: lista;
    l2: lista2;
begin   
    l:= nil;
    l2:= nil;
    cargarLista(l); //Se dispone
    procesarLista(l);
    generarLista2(l, l2);
    writeln;
    while (l2 <> nil) do begin //Comprobar que la lista se cargó adecuadamente
        writeln(l2^.data.kmRecorridos);
        l2:= l2^.sig;
    end;
end.
