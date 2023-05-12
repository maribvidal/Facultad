program ej3;
const
    dimF = 4; //"Vector de a lo sumo 200 elementos"
    dias_del_mes = 4;
type
    mes = 1..dias_del_mes;
    viaje = record
        dia_mes: mes;
        monto: real;
        distancia: integer;
    end;
    vector = array [1..dimF] of viaje; //Vector para los viajes
    vector2 = array [1..dias_del_mes] of integer; //Vector para guardar la cantidad de viajes realizada cada día del mes
procedure leerViaje(var vi: viaje);
    begin
        write('Día del viaje: >'); readln(vi.dia_mes);
        write('Monto de dinero transportado: >'); readln(vi.monto);
        write('Distancia recorrida en kilómetros: >'); readln(vi.distancia);
    end;
procedure cargarVector(var v: vector; var dimL: integer);
    var
        i: integer;
        vi: viaje;
    begin
        i:= 0;
        leerViaje(vi);
        writeln;
        while (i < dimF) and (vi.distancia <> 0) do begin
            i:= i + 1;
            dimL:= dimL + 1;
            v[i]:= vi;
            leerViaje(vi); //Cuando se termine de procesar el viaje anterior, leer otro
            writeln;
        end;
    end;
procedure actualizarMinimo(viaje_actual: viaje; var diaMin, distMin: integer; var montoMin: real);
    begin
        if (viaje_actual.monto) < montoMin then begin
            montoMin:= viaje_actual.monto;
            diaMin:= viaje_actual.dia_mes;
            distMin:= viaje_actual.distancia;
        end;
    end;
procedure procesarVector(var v: vector; var v2: vector2; dimL: integer; var promedio: real; var diaMin, distMin: integer);
    var
        i: integer;
        aux, montoMin: real; //Variable auxiliar para guardar los montos del viaje
    begin
        aux:= 0; //Inicializar variables
        montoMin:= 99999;
        for i:= 1 to dimL do begin
            aux:= aux + v[i].monto;
            v2[v[i].dia_mes]:= v2[v[i].dia_mes] + 1;
            actualizarMinimo(v[i], diaMin, distMin, montoMin);
        end;
        promedio:= aux / dimL;
    end;
procedure leerViajesPorDia(v2: vector2);
    var
        i: integer;
    begin
        for i:= 1 to dias_del_mes do begin
            writeln('[Dia ',i,']: ',v2[i],' viajes realizados.');
        end;
    end;
procedure eliminarElemento(var v: vector; var dimL: integer; posicion: integer);
    var
        i: integer;
    begin
        for i:= posicion to dimL do begin
            v[i]:= v[i+1]; //Asignarle al elemento actual el valor del siguiente elemento
        end;
        dimL:= dimL - 1; //La dimensión lógica es un espacio mas pequeña
    end;
procedure modificarVector(var v: vector; var dimL:integer);
    var
	    i, e: integer;
    begin
        e:= 0; //Viajes eliminados
	    for i:= 1 to dimL do begin
	        if (v[i].distancia = 100) and ((i+e) <= dimL) then begin
	            eliminarElemento(v, dimL, i);
	            e:= e + 1;
	        end;
	    end;
    end;
var
    v: vector;
    v2: vector2;
    i, dimL, diaMin, distMin: integer;
    promedio: real;
begin   
    diaMin:= 0;
    distMin:= 0;
    promedio:= 0;
    cargarVector(v, dimL);
    procesarVector(v, v2, dimL, promedio, diaMin, distMin);
    leerViajesPorDia(v2);
    writeln('Promedio del monto de todos los viajes realizados: ',promedio:2:2);
    writeln('Dia y distancia del viaje realizado con el menor monto: ',diaMin, ' ',distMin,'km');
    modificarVector(v, dimL);
    for i:= 1 to dimL do begin
        writeln(v[i].distancia);
    end;
end.
