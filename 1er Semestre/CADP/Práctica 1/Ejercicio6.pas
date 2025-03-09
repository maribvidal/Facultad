{Consigna: Modifique el ejercicio anterior para que, luego de leer el número X, se lean a lo sumo 10 números reales. 
La lectura deberá finalizar al ingresar un valor que sea el doble de X, o al leer el décimo número, 
en cuyo caso deberá informarse “No se ha ingresado el doble de X”.}
program Ejercicio6;
var
    legajo, promedio, cant1, cant2, cant3: real;
begin
    cant1:= 0;
    cant2:= 0;
    cant3:= 0;
    repeat
        write('Introduzca el legajo del alumno: ');
        read(legajo);
        if (legajo <> -1) then
            begin
                write('Introduzca el promedio del alumno: ');
                read(promedio);
                cant1:= cant1 + 1;
                if (promedio > 6.5) then
                    cant2:= cant2 + 1;
                if (promedio > 8.5) and (legajo < 2500) then
                    cant3:= cant3 + 1;
            end
    until (legajo = -1);
    writeln('Cantidad de alumnos leidos: ',cant1:1:0);
    writeln('Cantidad de alumnos con un promedio superior a 6,5: ',cant2:1:0);
    writeln('Porcentaje de alumnos destacados: ',((cant3 / cant1)*100):1:2,'%');
end.
