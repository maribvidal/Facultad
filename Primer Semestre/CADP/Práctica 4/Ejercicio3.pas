program Ejercicio3;
const
    dimF = 10; {Dimensión física}
    dimL = 10; {Dimensión lógica} {Suponemos que la dimensión lógica siempre sea 10}
type
    vec = array [1..dimF] of integer;
procedure leerVector(var v: vec); {Este módulo lee cada uno de los elementos del vector}
    var
        i: integer;
    begin
        for i:= 1 to dimF do begin
            read(v[i]);
            //writeln(v[i]);
        end;
    end;
procedure impVectorRev(v: vec); {Este módulo imprime cada uno de los elementos del vector al revés}
    var
        i: integer;
    begin
        for i:= 1 to dimF do begin
            writeln(v[dimL+1-i])
        end;
    end;
procedure deMidVector(v: vec); {Este módulo imprime cada uno de los elementos del vector desde el medio, primero de la mitad para abajo, y después de la mitad para arriba}
    var
        i: integer;
    begin
        for i:= 1 to (dimL div 2) do begin {De la mitad para abajo}
            writeln(v[(dimL div 2)-i]);
        end;
        for i:= 1 to (dimL div 2) do begin {De la mitad+1 para arriba}
            writeln(v[(dimL div 2)+i]);
        end;
    end;
procedure xyVector(v: vec; x, y: integer); {Este módulo recorre el vector de X hasta Y}
    var
        i: integer;
    begin
        writeln(x < y);
        writeln(x, y);
        if (x > y) then begin {Si X es mayor que Y...}
            for i:= x to y do begin 
                writeln(v[i]);
            end;
        end else if (x < y) then begin {Si X es menor que Y...}
            for i:= y to x do begin
                writeln(v[i]);
            end;
        end;
    end;
var
    vector: vec;
    x, y: integer;
begin
    //readln(x);
    //readln(y);
    leerVector(vector);
    deMidVector(vector);
    impVectorRev(vector);
    //xyVector(vector, x, y);
end.
