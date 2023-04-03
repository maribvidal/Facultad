program Ejercicio2a;
var
    i, num, numMayor, numPos: integer;
begin
    numMayor:= 0;
    for i:= 1 to 10 do {Rango de 10 números}
    begin
        write('Ingresar número: ');
        read(num);
        if (num > numMayor) then {Si el número ingresado es mayor que el mayor número actual...}
        begin
            numMayor:= num; {El mayor número ahora es el número ingresado}
            numPos:= i; {Anotar su posición}
        end;
    end;
    writeln('El mayor número leido es ',numMayor,', que se encuentra en la posición n°',numPos); {Informar}
end.
