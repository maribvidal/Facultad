program ej4pr2;
const
    dimF = 20;
type
    vector = array [1..20] of integer;
procedure cargarVector(var v: vector; indice: integer);
    var
        num: integer;
    begin
        if (indice <= dimF) then begin //Si el indice es menor a la dimensión física...
            num:= Random(100);
            if (num > 0) then begin
                v[indice]:= num;
                cargarVector(v, indice+1);
            end else begin
                cargarVector(v, indice); //Cargar de vuelta el valor en el mismo indice
            end;
        end;
    end;
procedure buscarMaximoVector(v: vector; indice: integer; var valorMax: integer);
    begin
        if (indice <= dimF) then begin //Comprobar si se llegó al final del vector
            if (valorMax < v[indice]) then //Comprobar si el número actual es mayor que el valorMax
                valorMax:= v[indice];
            buscarMaximoVector(v, indice + 1, valorMax); //Pasar al siguiente elemento
        end;
    end;
procedure sumarValoresVector(v: vector; indice: integer; var sumatoria: integer);
    begin
        if (indice <= dimF) then begin //Comprobar si se llegó al final del vector
            sumatoria:= sumatoria + v[indice]; //Sumar el valor del elemento actual
            sumarValoresVector(v, indice + 1, sumatoria); //Pasar al siguiente elemento
        end;
    end;
var
    v: vector;
    i, valorMax, sumatoria: integer;
begin
    //Inicializar variables
    valorMax:= -1;
    sumatoria:= 0;
    Randomize;

    cargarVector(v, 1);
    buscarMaximoVector(v, 1, valorMax);
    sumarValoresVector(v, 1, sumatoria);
    //for i:= 1 to dimF do begin
    //    writeln(v[i]);
    //end;
    writeln('Valor máximo: ', valorMax);
    write('Sumatoria: ', sumatoria);
end.
