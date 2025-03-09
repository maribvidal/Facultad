program memoria;
type
    datos = array [1..20] of integer;
    punt = ^datos;
procedure procesarDatos(v: datos; var v2: datos); //MEMORIA ESTÁTICA - 40 bytes + 40 bytes = 80 bytes
    var
        i, j: integer; //MEMORIA ESTÁTICA - 2 bytes + 2 bytes = 4 bytes
    begin
        writeln('Tamaño de i: ',sizeof(j));
        writeln('Tamaño de j: ',sizeof(j));
        for i:= 1 to 20 do begin
            v2[21 - i]:= v[i];
        end;
    end;
var
    vect: datos; //MEMORIA ESTÁTICA - 20 * 2 bytes = 40 bytes
    pvect: punt; //MEMORIA ESTÁTICA - 8 bytes (puntero sin inicializar)
    i: integer; //MEMORIA ESTÁTICA - 2 bytes
begin //HASTA LA LÍNEA 18 HAY 40+4+2 = 46 bytes EN MEMORIA
    writeln('Tamaño de vect: ',sizeof(vect));
    writeln('Tamaño de pvect: ',sizeof(pvect));
    writeln('Tamaño de i: ',sizeof(i));
    for i:= 1 to 20 do
        vect[i]:= i;
    new(pvect); //MEMORIA DINÁMICA - 40 bytes
    writeln('Tamaño de pvect^: ',sizeof(pvect^));
    for i:= 20 downto 1 do
        pvect^[i] := 0;
    procesarDatos(pvect^, vect);
    writeln('fin');
end.
