{Consigna: Realizar un programa que lea un número real X. 
Luego, deberá leer números reales hasta que se ingrese uno cuyo valor sea exactamente el doble de X (el primer número leído).}
program Ejercicio4;
var
    x, x2: real;
begin
    x2:= 0;
    write('Ingrese valor de X: ');
    read(x);
    while (x2 <> (x * 2)) do 
        begin
            write('Ingrese el doble del valor de X: ');
            read(x2);
        end;
    if (x2 = x*2) then
        begin
            writeln(x2:1:1,' es el doble de ',x:1:1);
        end;
end.
