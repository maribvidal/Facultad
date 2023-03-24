program Ejercicio2;
var
    n: real;
begin
    write('Ingrese un valor: ');
    read(n);
    n:= abs(n);
    if (n >= 0) then
        writeln('|',n:1:1,'| = ',n:1:1)
    else
        writeln('|',n:1:1,'| = ',-n:1:1);
end.
