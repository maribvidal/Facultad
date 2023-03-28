program Ejercicio6;
type
    tiempo = 1..1000; {Para poner un límite de tiempo}
var
    p, piloto1, piloto2, piloto3, piloto4: string;
    tiempo1, tiempo2: tiempo;
    i, t: integer;
begin
    tiempo1:= 1000; {Iniciar las variables}
    tiempo2:= 1;
    piloto1:= '';
    piloto2:= '';
    piloto3:= '';
    piloto4:= '';
    for i:= 1 to 6 do {Contar 100 autos}
    begin
        write('Ingrese el nombre del piloto: ');
        readln(p);
        write('Ingrese su tiempo: ');
        readln(t);
        if (t < tiempo1) then {Si el tiempo ingresado es menor que tiempo1...}
        begin
            piloto2:= piloto1;
            tiempo1:= t;
            piloto1:= p;
        end;
        if (t > tiempo2) then {Si el tiempo ingresado es mayor que tiempo2...}
        begin
            piloto4:= piloto3;
            tiempo2:= t;
            piloto3:= p;
        end;
    end;
    writeln('El primer puesto lo tiene ',piloto1);
    writeln('El segundo puesto lo tiene ',piloto2);
    writeln('El anteúltimo puesto lo tiene ',piloto4);
    writeln('El último puesto lo tiene ',piloto3);
end.
