program Ejercicio3;
type
    notas = 1..10; {La nota es un número entre 1 y 10}
var
    nota: notas;
    nombre: string;
    cantAprobados, cantNotaSiete: integer;
begin
    cantAprobados:= 0;
    cantNotaSiete:= 0;
    repeat
        write('Ingrese el nombre del alumno: ');
        readln(nombre);
        write('Ingrese su nota de EPA: ');
        readln(nota);
        if (nota >= 8) then {Si su nota es mayor o igual a 8...}
            cantAprobados:= cantAprobados + 1;
        if (nota = 7) then {Si su nota es igual a 7...}
            cantNotaSiete:= cantNotaSiete + 1;
    until (nombre = 'Zidane Zinedine');
    writeln(cantAprobados,' estudiantes aprobaron.');
    write(cantNotaSiete,' estudiantes se sacaron siete.');
end.
