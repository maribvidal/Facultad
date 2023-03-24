{Consigna: Modifique el ejercicio anterior para que, luego de leer el número X, se lean a lo sumo 10 números reales. 
La lectura deberá finalizar al ingresar un valor que sea el doble de X, o al leer el décimo número, 
en cuyo caso deberá informarse “No se ha ingresado el doble de X”.}
program Ejercicio4;
var
    x, x2, intentos: real;
begin
    x2:= 0;
    intentos:=0;
    write('Ingrese valor de X: ');
    read(x);
    while (x2 <> (x * 2)) and (intentos < 10) do 
        begin
            write('Ingrese el doble del valor de X: ');
            read(x2);
            intentos:= intentos + 1
        end;
    if (x2 = x*2) then
        writeln(x2:1:1,' es el doble de ',x:1:1)
    else
        writeln('No se ha ingresado el doble de X');
    end.
end.
