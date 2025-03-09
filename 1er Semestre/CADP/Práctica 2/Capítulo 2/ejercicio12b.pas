program ej12b;
function rendPorZona(ha, tipoZona: integer):real;
    begin
        case tipoZona of 
            1: rendPorZona:= ha * 6;
            2: rendPorZona:= ha * 2.6;
            3: rendPorZona:= ha * 1.4;
        end;
    end;
procedure ingresarDatos(var ha, tipoZona: integer; var localidad: string);
    begin
        write('>Ingrese la cantidad de hectareas sembradas: '); readln(ha);
        write('>Ingrese el tipo de zona de siembra (1, 2, 3): '); readln(tipoZona);
        while not ((tipoZona > 0) or (tipoZona < 4)) do begin {Si no se ingresa uno dentro del rango...}
            write('>Ingrese un tipo de zona de siembra válido: '); readln(tipoZona);
        end;
        write('>Ingrese el nombre de la localidad: '); readln(localidad);
    end;
procedure rendimientoEconomico(var toneladasValor: real; var localidad: string; var ha: integer);
    var
        tipoZona: integer;
    begin
        ingresarDatos(ha, tipoZona, localidad);
        toneladasValor:= (rendPorZona(ha, tipoZona) * 320);
    end;
procedure actualizarDatos(r: real; l: string; var cantTresFebr: integer; var maxCampoR, minCampoR: real; var maxCampoL, minCampoL: string);
    begin
        if (l = 'Tres de Febrero') and (r > 10000) then begin
            cantTresFebr:= cantTresFebr + 1;
        end;
        if (r > maxCampoR) then begin
            maxCampoR:= r;
            maxCampoL:= l;
        end;
        if (r < minCampoR) then begin
            minCampoR:= r;
            minCampoL:= l;
        end;
    end;
var
    hectareas, cantTresFebr, veces: integer;
    localidad, maxCampoL, minCampoL: string;
    rendEcon, maxCampoR, minCampoR, rendEconPromedio: real;
begin
    veces:= 0; {Inicializar variables}
    rendEconPromedio:= 0;
    cantTresFebr:= 0;
    maxCampoR:= -1;
    minCampoR:= 9999999;
    rendimientoEconomico(rendEcon, localidad, hectareas);
    while (hectareas <> 900) or (localidad <> 'Saladillo') do begin {Registrar los rendimientos económicos de los campos hasta que las hectareas sean 900 y la localidad sea "Saladillo"}
        actualizarDatos(rendEcon, localidad, cantTresFebr, maxCampoR, minCampoR, maxCampoL, minCampoL);
        rendEconPromedio:= rendEconPromedio + rendEcon;
        veces:= veces + 1;
        rendimientoEconomico(rendEcon, localidad, hectareas);
    end;
    rendEconPromedio:= rendEconPromedio;
    writeln('La cantidad de campos de la localidad Tres de Febrero con rendimiento estimado superior a U$S 10.000 es de: ',cantTresFebr);
    writeln('La localidad del campo con mayor rendimiento económico esperado es: ',maxCampoL);
    writeln('La localidad del campo con menor rendimiento económico esperado es: ',minCampoL);
    writeln('El rendimiento económico promedio es: ',(rendEconPromedio/veces):2:2);
end.
