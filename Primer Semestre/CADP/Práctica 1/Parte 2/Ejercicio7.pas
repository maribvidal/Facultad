program Ejercicio7;
type
    tiempo = 1..1000; {Para poner un límite de tiempo}
var
    p, piloto1, piloto2, piloto3, piloto4: string;
    tiempo1, tiempo2, tiempo3, tiempo4: tiempo;
    i, t: integer;
begin
    tiempo1:= 1000; {Iniciar las variables}
    tiempo2:= 1000;
    tiempo3:= 1;
    tiempo4:= 1;
    piloto1:= '';
    piloto2:= '';
    piloto3:= '';
    piloto4:= '';
    for i:= 1 to 4 do {Contar 100 autos}
    begin
        write('Ingrese el nombre del piloto: ');
        readln(p);
        write('Ingrese su tiempo: ');
        readln(t);
        writeln('---------------------');
        if (t < tiempo1) then {Si el tiempo ingresado es menor que tiempo1...}
        begin
            piloto2:= piloto1;
            piloto1:= p;
            tiempo2:= tiempo1;
            tiempo1:= t;
        end
        else if (t < tiempo2) then {Si el tiempo ingresado es menor que tiempo2...}
        begin
            piloto2:= p;
            tiempo2:= t;
        end;
        if (t > tiempo3) then {Si el tiempo ingresado es mayor que tiempo3...}
        begin
            piloto4:= piloto3;
            piloto3:= p;
            tiempo4:= tiempo3;
            tiempo3:= t;
        end
        else if (t > tiempo4) then {Si el tiempo ingresado es mayor que tiempo4...}
        begin
            piloto4:= p;
            tiempo4:= t;
        end;
    end;
    writeln('El primer puesto lo tiene ',piloto1);
    writeln('El segundo puesto lo tiene ',piloto2);
    writeln('El anteúltimo puesto lo tiene ',piloto4);
    writeln('El último puesto lo tiene ',piloto3);
end.
