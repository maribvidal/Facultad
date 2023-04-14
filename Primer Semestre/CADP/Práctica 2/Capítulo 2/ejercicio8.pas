program ejercicio8;
function esPar(numero: integer):boolean;
    begin
        esPar:= (numero mod 2) = 0;
    end;
procedure calcularDigitos(secuencia: integer; var sumaDigitosPares, cantidadDigitosImpares: integer);
    var
        digito: integer;
    begin
        while (secuencia <> 0) do begin
            digito:= secuencia mod 10;
            if (esPar(digito)) then
                sumaDigitosPares:= sumaDigitosPares + digito
            else
                cantidadDigitosImpares:= cantidadDigitosImpares + 1;
            secuencia:= secuencia div 10;
        end;
    end;
var
    sec: LongInt;
    sumDigPar, cantDigImpar: integer;
begin
    sumDigPar:= 0; cantDigImpar:= 0;
    write('Ingresar secuencia de números enteros: '); read(sec);
    while (sec <> 123456) do begin
        writeln(' ------------------------------------ ');
        calcularDigitos(sec, sumDigPar, cantDigImpar);
        writeln('Suma de los digitos pares de la secuencia: ',sumDigPar);
        writeln('Cantidad de los digitos impares de la secuencia: ',cantDigImpar);
        write('Ingresar secuencia de números enteros: '); readln(sec);
        sumDigPar:= 0; cantDigImpar:= 0;
    end;
end.
