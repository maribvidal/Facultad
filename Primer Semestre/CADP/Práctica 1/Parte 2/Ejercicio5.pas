program Ejercicio5;
type
    rango = 0..100;
var
    num, numMax, numMin: rango;
    sumaTotal: integer;
begin
    numMin:= 100; {Comenzar desde el máximo}
    numMax:= 0; {Comenzar desde el mínimo}
    sumaTotal:= 0;
    repeat
        write('Ingrese un número: ');
        read(num);
        if (num < numMin) then {Si el número es menor que el número mínimo...}
        begin
            numMin:= num;
        end;
        if (num > numMax) then {Si el número es mayor que el número máximo...}
        begin
            numMax:= num;
        end;
        sumaTotal:= sumaTotal + num; {Sumar los números leidos}
    until (num = 100); {Repetir bloque hasta que se lea el número 100}
    writeln('El número mínimo leído es: ', numMin);
    writeln('El número máximo leído es: ', numMax);
    write('El resultado de la suma de todos los números leidos: ', sumaTotal);
end.
