program Ejercicio1;
var
    n1, n2: integer;
begin
    write('Ingrese el primer valor: ');
    read(n1);
    write('Ingrese el segundo valor: ');
    read(n2);
    if (n1 > n2) then
        writeln(n1,' es mayor que ',n2)
    else
        writeln(n2,' es mayor que ',n1);
end.
