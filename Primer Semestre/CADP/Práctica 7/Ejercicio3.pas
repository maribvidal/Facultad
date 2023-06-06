//Una remisería dispone de información acerca de los viajes realizados durante el mes de mayo de 2020.
//De cada viaje se conoce: número de viaje, código de auto, dirección de origen, dirección de destino y
//kilómetros recorridos durante el viaje. Esta información se encuentra ordenada por código de auto y
//para un mismo código de auto pueden existir 1 o más viajes. Se pide:
//a. Informar los dos códigos de auto que más kilómetros recorrieron.
program Ejercicio3;
type
    lista = ^nodo;
    t_rango = 0..9999;
    viaje = record
        num: t_rango;
        cod: t_rango;
        dir_origen: string[10];
        dir_destino: string[10];
        km: t_rango;
    end;
    nodo = record
        data: viaje;
        sig: lista;
    end;
procedure leerViaje(var v: viaje);
    begin
        with v do begin
            write('Número de viaje: '); readln(num);
            write('Código de auto: '); readln(cod);
            write('Dirección de origen: '); readln(dir_origen);
            write('Dirección de destino: '); readln(dir_destino);
            write('Kilómetros recorridos: '); readln(km);
        end;
    end;
procedure agregarNodo(var l: lista; v: viaje); //Adelante (no importa cual se elija)
    var
        nuevo: lista;
    begin
        new(nuevo);
        nuevo^.data:= v;
        nuevo^.sig:= nil;
        if (l <> nil) then
            nuevo^.sig:= l;
        l:= nuevo;
    end;
procedure cargarLista(var l: lista);
    var
        v: viaje;
        cod_actual: t_rango;
        seguir: char;
    begin
        leerViaje(v);
        cod_actual:= v.cod;
        seguir:= 'A';
        while (seguir <> 'N') do begin
            while (seguir <> 'N') and (cod_actual = v.cod) do begin //Corte de control
                agregarNodo(l, v);
                writeln;
                write('¿Seguir? '); readln(seguir);
                if (seguir <> 'N') then begin
                    leerViaje(v);
                end;
            end;
            cod_actual:= v.cod;
        end;
        writeln('ping');
    end;
procedure actualizarMaximo(codActual, kmActual: integer; var codNuevo, kmNuevo, codNuevo2, kmNuevo2: integer);
    begin
        if (kmActual > kmNuevo) then begin
            codNuevo2:= codNuevo;
            kmNuevo2:= kmNuevo;
            codNuevo:= codActual;
            kmNuevo:= kmActual;
        end else if (kmActual > kmNuevo2) then begin
            codNuevo2:= codActual;
            kmNuevo2:= kmActual;
        end;
    end;
//a. Informar los dos códigos de auto que más kilómetros recorrieron.
procedure puntoA(l: lista; var cod1, cod2: integer);
    var
        kmMax, kmMax2: integer;
    begin
        kmMax:= -1;
        kmMax2:= -1;
        while (l <> nil) do begin
            actualizarMaximo(l^.data.cod, l^.data.km, cod1, kmMax, cod2, kmMax2);
            l:= l^.sig;
        end;
    end;
//b. Generar una lista nueva con los viajes de más de 5 kilómetros recorridos, ordenada por número de viaje.
procedure puntoB(l: lista; var l2: lista);
    var
        nuevo, ant, act: lista;
    begin
        while (l <> nil) do begin //Recorrer lista
            if (l^.data.km > 5) then begin //Si el elemento actual recorrió mas de 5 km, tenerlo en cuenta
                new(nuevo);
                nuevo^.data:= l^.data;
                nuevo^.sig:= nil;
                if (l2 = nil) then begin
                    l2:= nuevo;
                end else begin
                    act:= l;
                    ant:= l;
                    while (act <> nil) and (act^.data.num > nuevo^.data.num) do begin //Buscar la posición
                        ant:= act;
                        act:= act^.sig;
                    end;
                    if (ant = act) then begin //Si no se movió de la primera posición...
                        nuevo^.sig:= l2;
                        l2:= nuevo;
                    end else begin //Si sí se movió
                        ant^.sig:= nuevo;
                        nuevo^.sig:= act;
                    end;
                end;
            end;
            l:= l^.sig;
        end;
    end;
procedure leerLista(l: lista);
    begin
        while (l <> nil) do begin
            writeln('KM: ',l^.data.num);
            l:= l^.sig;
        end;
    end;
var
    l, l2: lista;
    cod1, cod2: integer;
begin
    l:= nil;
    l2:= nil;
    cod1:= 0;
    cod2:= 0;
    cargarLista(l); //SE DISPONE DE ESTA, NO TENÍA QUE ESCRIBIRLA
    puntoA(l, cod1, cod2);
    puntoB(l, l2);
    leerLista(l2);
    writeln('Los códigos de los autos que más kilómetros recorrieron: ',cod1,' ',cod2);
end.
