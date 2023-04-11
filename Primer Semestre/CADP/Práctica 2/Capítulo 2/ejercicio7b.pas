program ejercicio7b;
procedure jugarConNum(numEntero: integer; var cantDigitos, sumaDigitos: integer);
    begin
        sumaDigitos:= 0;
        while (numEntero <> 0) do begin
            cantDigitos:= cantDigitos + 1;
            sumaDigitos:= sumaDigitos + (numEntero mod 10);
            numEntero:= numEntero div 10;
        end;
    end;
var
    num, cant, suma: integer;
begin
    cant:= 0;
    suma:= 0;
    repeat
        write('Ingresar un número: '); read(num);
        jugarConNum(num, cant, suma);
    until(suma = 10);
    write('Se leyeron un total de ',cant,' dígitos.');
end.
