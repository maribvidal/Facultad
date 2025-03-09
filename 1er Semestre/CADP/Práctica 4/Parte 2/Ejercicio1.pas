program ej1;
const
    dimF = 500;
type
    vector = array [1..dimF] of integer;
function encontrarValorA(v: vector; n: integer):boolean;
    var
        i: integer;
        aux: boolean;
    begin
        aux:= false; //Por defecto va a ser falso
        for i:= 1 to dimF do begin
            if (v[i] = n) then begin aux:= true; end;
        end;
        encontrarValorA:= aux;
    end;
function encontrarValorB(v: vector; n: integer):boolean;
    var
        i: integer;
        aux: boolean;
    begin
        aux:= false; //Por defecto va a ser falso
        i:= 0;
        while (i <> dimF) and not (aux) do begin
            i:= i + 1; //El i se comienza a incrementar al principio así es el mismo que el dimF
            if (v[i] = n) then begin aux:= true; end; //Si el valor del vector es igual al número ingresado, parar el proceso
        end;
        encontrarValorB:= aux;
    end;
var
    v: vector;
    n: integer;
    condicion: boolean;
begin //Para probar el código
    v[6]:= 6;
    read(n);
    condicion:= encontrarValorB(v, n);
    write(condicion);
end.
