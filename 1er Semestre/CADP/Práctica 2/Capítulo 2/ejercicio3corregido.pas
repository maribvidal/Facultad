program ejercicio5;
procedure sumar(a, b: integer; var c: integer); {CORREGIDO: Se agregó un punto y coma / CORREGIDO: La variable C es de REFERENCIA}
var
    suma, i: integer; {CORREGIDO: Se agregó la variable I}
begin
    for i:= a to b do
        suma:= suma + i;
        c:= c + suma;
    end;
var
    a, b, result: integer; {CORREGIDO: Se agregaron las variables A y B}
    ok: boolean; {CORREGIDO: Se agregó la variable OK}
begin
    result:= 0;
    readln(a); readln(b);
    sumar(a, b, result); {CORREGIDO: La variable RESULT ahora tiene un output}
    writeln('La suma total es ',result);
    ok:= (result >= 10) and (result <= 30); {CORREGIDO: La operación era con un AND y no con un OR}
    if (not ok) then
        write('La suma no quedó entre 10 y 30');
end.