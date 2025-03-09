{Consigna: Realizar un programa que lea el código, el precio actual y el nuevo precio de los productos de un almacén. 
La lectura finaliza al ingresar el producto con el código 32767, el cual debe procesarse.
Para cada producto leído, el programa deberá indicar si el nuevo precio del producto supera en un 10% al precio anterior.}
program Ejercicio7;
var
    codigo, p1, p2, n1: real;
begin
    n1:= 0;
    repeat
        write('Pase el código del producto: ');
        read(codigo);
        write('Ingrese su precio actual: ');
        read(p1);
        write('Y ahora ingrese el nuevo precio: ');
        read(p2);
        
        n1:= (110/100) * p1;
        if (p2 >= n1) then
            writeln('El nuevo precio del producto n°',codigo:1:0,' supera en un (mas de) 10% al precio anterior.')
        else
            writeln('El nuevo precio del producto n°',codigo:1:0,' no supera el 10%.');
    until (codigo = 32767);
end.
