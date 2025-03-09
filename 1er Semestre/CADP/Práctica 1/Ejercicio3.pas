{Consigna: Realizar un programa que lea 3 números enteros y los imprima en orden descendente.}
program Ejercicio3;
var
    n1, n2, n3: integer;
begin
    write('Ingrese n1: ');
    read(n1);
    write('Ingrese n2: ');
    read(n2);
    write('Ingrese n3: ');
    read(n3);
    
    if (n1 > n2) and (n1 > n3) then
        if (n2 >= n3) then
            writeln(n1,' ',n2,' ',n3)
        else
            writeln(n1,' ',n3,' ',n2)
    else if (n2 > n1) and (n2 > n3) then
        if (n1 >= n3) then
            writeln(n2,' ',n1,' ',n3)
        else
            writeln(n2,' ',n3,' ',n1)
    else if (n3 > n1) and (n3 > n2) then
        if (n1 >= n2) then
            writeln(n3,' ',n1,' ',n2)
        else
            writeln(n3,' ',n2,' ',n1)
    else
        writeln(n1,' ',n2,' ',n3,' (algunos de estos números son iguales a otros XD)');
end.
