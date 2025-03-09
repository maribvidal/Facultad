function rendPorZona(ha, tipoZona: integer):real;
    begin
        case tipoZona of 
            1: rendPorZona:= ha * 6;
            2: rendPorZona:= ha * 2.6;
            3: rendPorZona:= ha * 1.4;
        end;
    end;
procedure ingresarDatos(var ha, tipoZona, precioUS: integer);
    begin
        write('>Ingrese la cantidad de hectareas sembradas: '); readln(ha);
        write('>Ingrese el tipo de zona de siembra (1, 2, 3): '); readln(tipoZona);
        while not ((tipoZona > 0) or (tipoZona < 4)) do begin {Si no se ingresa uno dentro del rango...}
            write('>Ingrese un tipo de zona de siembra válido: '); readln(tipoZona);
        end;
        write('>Ingrese el precio en dolares de la tonelada de soja: '); readln(precioUS);
    end;
procedure rendEconomico(var toneladasValor: real);
    var
        ha, tipoZona, precioUS: integer;
    begin
        ingresarDatos(ha, tipoZona, precioUS);
        toneladasValor:= (rendPorZona(ha, tipoZona) * precioUS);
    end;
end.
