program ejercicioParcial;
type
    vectorLetras = array [1..100] of char;
    vectorLetras2 = array ['A'..'Z'] of integer;
function obtenerLetra(codigo: integer):char;
    begin
        case codigo of
            1: obtenerLetra:= 'A';
            2: obtenerLetra:= 'B';
            3: obtenerLetra:= 'C';
            4: obtenerLetra:= 'D';
            5: obtenerLetra:= 'E';
            6: obtenerLetra:= 'F';
            7: obtenerLetra:= 'G';
            8: obtenerLetra:= 'H';
            9: obtenerLetra:= 'I';
            10: obtenerLetra:= 'J';
            11: obtenerLetra:= 'K';
            12: obtenerLetra:= 'L';
            13: obtenerLetra:= 'M';
            14: obtenerLetra:= 'N';
            15: obtenerLetra:= 'O';
            16: obtenerLetra:= 'P';
            17: obtenerLetra:= 'Q';
            18: obtenerLetra:= 'R';
            19: obtenerLetra:= 'S';
            20: obtenerLetra:= 'T';
            21: obtenerLetra:= 'U';
            22: obtenerLetra:= 'V';
            23: obtenerLetra:= 'W';
            24: obtenerLetra:= 'X';
            25: obtenerLetra:= 'Y';
            26: obtenerLetra:= 'Z';
        end;
        if (codigo < 1) and (codigo > 26) then begin
            obtenerLetra:= 'A';
        end;
    end;
procedure cargarVector(var v: vectorLetras; indice: integer);
    var
        aux: integer;
    begin
        aux:= Random(26);
        if (indice <= 100) then begin
            v[indice]:= obtenerLetra(aux);
            writeln('Letra cargada: ',obtenerLetra(aux));
            cargarVector(v, indice + 1);
        end;
    end;
procedure inicializarVector2(var v2: vectorLetras2);
    var
        l: char;
    begin
        for l:='A' to 'Z' do begin
            v2[l]:= 0;
        end;
    end;
procedure procesarVector(v: vectorLetras; var v2: vectorLetras2);
    var
        i: integer;
    begin
        for i:= 1 to 100 do begin
            v2[v[i]]:= v2[v[i]] + 1;
        end;
    end;
var
    v: vectorLetras;
    v2: vectorLetras2;
    l: char;
begin
    cargarVector(v, 1);
    inicializarVector2(v2);
    procesarVector(v, v2);
    for l:='A' to 'Z' do begin
        writeln('Cantidad de veces que se repite la letra ',l,': ',v2[l]);
    end;
end.
