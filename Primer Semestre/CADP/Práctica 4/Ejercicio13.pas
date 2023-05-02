program Ejercicio13;
const
    dimF = 2; //Puntos diferentes del planeta
    dimF2 = 5;
type
    vector = array [1..dimF] of real; //Vector para las temperaturas promedio
    vector2 = array [1..dimF2] of vector; //Vector para los 50 años
procedure cargarVector(var v: vector2); //Leer vector2
    var
        i, j: integer;
    begin
        for i:= 1 to dimF2 do begin
            writeln('>> Año ',i);
            for j:= 1 to dimF do begin
                writeln('Ingresar promedio de temperatura de la zona: '); readln(v[i][j]);
            end;
            writeln('>> Cambiando de año...');
        end;
    end;
procedure procesarVector(v: vector2; var anoMax, anoMax2: integer);
    var
        i, j: integer; 
        aux, aux2, aux3: real;
    begin
        aux:= 0;
        aux2:= 0;
        aux3:= 0;
        for i:= 1 to dimF2 do begin
            for j:= 1 to dimF do begin
                aux:= aux + v[i][j]; //Sumar la temperatura promediada del punto del planeta
                if (v[i][j] > aux2) then begin
                    anoMax2:= i;
                    aux2:= v[i][j];
                end;
            end;
            aux:= aux/dimF; //Sacar promedio
            if (aux > aux3) then begin
                aux3:= aux;
                anoMax:= i;
            end;
            aux:= 0; //Resetear contador
        end;
    end;
var
    v: vector2;
    a1, a2: integer;
begin
    cargarVector(v);
    procesarVector(v, a1, a2);
    writeln('El año con mayor temperatura promedio a nivel mundial: ',a1);
    write('El año con la mayor temperatura detectada en algún punto del planeta en los últimos 50 años: ', a2);
end.
