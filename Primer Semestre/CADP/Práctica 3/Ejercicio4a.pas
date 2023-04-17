program Ejercicio4a;
type
    linea = record
        numero, minutos, MB: integer;
    end;
    cliente = record
        codigo, lineas: integer;
    end;
procedure leerTelefono(var l: linea);
    begin
        write('>Ingresar el número: '); readln(l.numero);
        write('>Ingresar la cantidad de minutos consumidos en un mes: '); readln(l.minutos);
        write('>Ingresar la cantidad de MBs consumidos en un mes: '); readln(l.MB);
    end;
begin
    {Inicializar variables}
end.
