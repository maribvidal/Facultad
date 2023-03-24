{Consigna: Realizar un programa que lea tres caracteres, e informe si los tres eran letras vocales o si al menos
uno de ellos no lo era. Por ejemplo, si se leen los caracteres “a e o” deberá informar “Los tres son
vocales”, y si se leen los caracteres “z a g” deberá informar “al menos un carácter no era vocal”.}
program Ejercicio9;
var
    c1, c2, c3: char;
    n: real;
begin
    n:= 0;
    write('Ingrese el primer carácter: ');
    read(c1);
    write('Ingrese el segundo carácter: ');
    read(c2);
    writeln('Ingrese el tercer carácter: ');
    read(c3);
    
    if ((c1 = 'A') or (c1 = 'E') or (c1 = 'I') or (c1 = 'O') or (c1 = 'U')) then
        n:= n + 1;
    if ((c2 = 'A') or (c2 = 'E') or (c2 = 'I') or (c2 = 'O') or (c2 = 'U')) then
        n:= n + 1;
    if ((c3 = 'A') or (c3 = 'E') or (c3 = 'I') or (c3 = 'O') or (c3 = 'U')) then
        n:= n + 1;
    if (n <> 3) then
        writeln('Los tres son vocales')
    else
        writeln('Al menos un carácter no era vocal');
end.
