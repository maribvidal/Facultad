program ej6pr2;
procedure binarizar(num:integer);
    begin
        if (num <> 0) then begin
            binarizar(num div 2);
            write(num mod 2);
        end;
    end;
var
    num: integer;
begin
    write('Ingrese un número: '); readln(num);
    while (num <> 0) do begin //Mientras el número ingresado sea diferente de 0
        binarizar(num); writeln;
        write('Ingrese un número: '); readln(num);
    end;
end.
