program Ejercicio5;
const
    corte = -1;
    dimF = 100; 
type
    lista = ^nodo;
    t_rango = -1..9999;
    t_camion = 1..100;
    camion = record //SE DISPONE
        patente: t_rango; 
        anio: t_rango; 
        capacidad: real;
    end;
    v_codigo = array [t_camion] of integer;
    v_camion = array [t_camion] of camion; //SE DISPONE
    viaje = record
        codigo_viaje: t_rango;
        codigo_camion: t_camion;
        distancia_km: t_rango;
        destino: string[10];
        anio: t_rango;
        dni: longint;
    end;
    nodo = record
        data: viaje;
        sig: lista;
    end;
function esDNIImpar(dni: integer):boolean;
    var
        aux: boolean;
    begin
        aux:= true;
        while (dni <> 0) do begin
            if (((dni mod 10) mod 2) = 0) then
                aux:= false;
            dni:= dni div 10;
        end;
        esDNIImpar:= aux;
    end;
procedure leerCamion(var c: camion); //SE DISPONE
    begin
        with c do
        begin
            write('PATENTE: '); readln(patente);
            write('AÑO: '); readln(anio);
            write('CAPACIDAD: '); readln(capacidad);
        end;
    end;
procedure leerViaje(var v: viaje);
    begin
        with v do
        begin
            write('INGRESE CÓDIGO DE VIAJE: '); readln(codigo_viaje);
            if (codigo_viaje <> corte) then begin
                write('INGRESE CÓDIGO DE CAMIÓN: '); readln(codigo_camion);
                write('INGRESE DISTANCIA RECORRIDA: '); readln(distancia_km);
                write('INGRESE DESTINO: '); readln(destino);
                write('INGRESE AÑO: '); readln(anio);
                write('INGRESE DNI DEL CHOFER: '); readln(dni);
            end;
        end;
    end;
procedure agregarNodo(var l: lista; v: viaje);
    var
        aux: lista;
    begin
        new(aux);
        aux^.data:= v;
        aux^.sig:= nil;
        if (l = nil) then begin
            l:= aux;
        end else begin
            aux^.sig:= l;
            l:= aux;
        end;
    end;
procedure cargarLista(var l: lista);
    var
        v: viaje;
    begin
        leerViaje(v);
        while (v.codigo_viaje <> corte) do begin
            agregarNodo(l, v);
            writeln;
            leerViaje(v);
        end;
    end;
procedure procesarLista(l: lista; var patenteMax, patenteMin, cantEsp: integer); //c: v_camion SE DISPONE
    var
        kmMax, kmMin: integer;
    begin
        kmMax:= -1;
        kmMin:= 9999;
        while (l <> nil) do begin
            //Punto A
            if (l^.data.distancia_km > kmMax) then begin
                kmMax:= l^.data.distancia_km
                //patenteMax:= c[l^.data.patente];
            end;
            if (l^.data.distancia_km < kmMin) then begin
                kmMin:= l^.data.distancia_km
                //patenteMin:= c[l^.data.patente];
            end;
            
            //Punto B
            //if (c[l^.data.patente].capacidad > 30.5) and ((c[l^.data.patente].anio + 5) > l^.data.anio) then begin
                //cantEsp:= cantEsp + 1;
            //end;
            
            //Punto C
            if (esDNIImpar(l^.data.dni)) then
                writeln('CÓDIGO DE VIAJE: ',l^.data.codigo_viaje);
            l:= l^.sig;
        end;
    end;
var
    l: lista;
    //c: v_camion;
    patenteMax, patenteMin, cantEsp: integer;
begin
    l:= nil;
    patenteMax:= 0;
    patenteMin:= 0;
    cantEsp:= 0;
    //cargarVector(c); SE DISPONE
    cargarLista(l);
    procesarLista(l, patenteMax, patenteMin, cantEsp);
end.
