program ej6pr2;
procedure binarizar(num:integer);
    var
        aux: integer;
    begin
        if (num <> 0) then begin
            aux:= num; //Guardar el número de manera temporal para despues poder imprimir el resto
            num:= num div 2;
            binarizar(num);
            write(aux mod 2);
        end;
    end;
var
    num: integer;
begin
    num:= -1;
    while (num <> 0) do begin //Mientras el número ingresado sea diferente de 0
        write('Ingrese un número: '); readln(num);
        binarizar(num); writeln;
    end;
end.
