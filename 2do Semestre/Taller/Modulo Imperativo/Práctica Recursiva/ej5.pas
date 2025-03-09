program ej5pr2;
const
    dimF = 20;
type
    vector = array [1..20] of integer;
    indice = 1..dimF;
procedure cargarVector(var v: vector; index: integer);
    var
        num: integer;
    begin
        if (index <= dimF) then begin //Si el indice es menor a la dimensión física...
            num:= Random(20);
            if (num > 0) then begin
                v[index]:= num;
                cargarVector(v, index+1);
            end else begin
                cargarVector(v, index); //Cargar de vuelta el valor en el mismo indice
            end;
        end;
    end;
procedure busquedaDicotomica(v: vector; ini, fin: indice; dato: integer; var pos: integer);
    var
        mitad: integer;
    begin
        if (ini <= fin) then begin
            mitad:= (ini + fin) div 2;
            writeln('Dato: ',v[mitad], ' posición: ',mitad);
            if (v[mitad] > dato) then begin
                busquedaDicotomica(v, ini, mitad - 1, dato, pos);
            end else if (v[mitad] < dato) then begin
                busquedaDicotomica(v, mitad + 1, fin, dato, pos);
            end else begin
                pos:= mitad;
                writeln('Dato: ',v[pos]);
            end;
        end;
    end;
var
    v: vector;
    i: integer;
    pos: integer;
begin
    //Inicializar variables
    pos:= -1;
    Randomize;
    cargarVector(v, 1);
    busquedaDicotomica(v, 1, 20, 10, pos);
    writeln('Se encuentra en la posición: ', pos);
end.
