program Ejercicio4;
type
    rango = 1..1000;
var
    num, numMin, numMin2: rango;
    i: integer;
begin
    numMin:= 1000; {Comenzar desde el tope}
    numMin2:= 1000;
    for i:= 1 to 1000 do {Ingresar 1000 números enteros}
    begin
        write('Ingrese un número: ');
        read(num);
        if (numMin >= num) then
        begin
            numMin2:= numMin; {El segundo número mínimo ahora vale lo que valía el primero antes}
            numMin:= num; {Actualizar el primer número mínimo}
        end;
    end;
    writeln('El primer número mínimo es: ',numMin);
    write('El segundo número mínimo es: ',numMin2);
end.
