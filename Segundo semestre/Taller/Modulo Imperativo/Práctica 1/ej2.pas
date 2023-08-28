{El administrador de un edificio de oficinas cuenta, 
en papel, con la información del pago de las expensas de dichas oficinas.}
program ordEj2;
const
    dimF = 300;
    corte = -1;
type
    oficina = record
        codIden: integer;
        DNI: integer; 
        valor: real;
        end;
    vector = array [1..dimF] of oficina;
    indice = 0..dimF; //del vector
procedure leerOficina(var o: oficina);
    begin
        write('Ingrese el código de identificación: '); readln(o.codIden);
        if (o.codIden <> corte) then begin
            write('Ingrese el DNI del propietario: '); readln(o.DNI);
            write('Ingrese el valor de la expensa: '); readln(o.valor);
        end;
    end;
procedure cargarVector(var vec: vector; var dimL: integer);
    var
        i: integer;
        o: oficina;
    begin
        i:= 1;
        leerOficina(o);
        writeln;
        while (i <= dimF) and (o.codIden <> corte) do begin
            vec[i]:= o;
            i:= i + 1;
            dimL:= dimL + 1;
            leerOficina(o);
            writeln;
        end;
    end;
procedure ordMetodoInsercion(var vec: vector; dimL: integer);
    var
        i, j: indice;
        actual: oficina;
    begin
        for i:= 2 to dimL do begin //Se comienza a partir de la segunda posición ya que hay que comparar el primer elemento con algo
            actual:= vec[i];
            j:= i - 1;
            while (j > 0) and (vec[j].codIden > actual.codIden) do begin //Ordenar de menor a mayor
                vec[j+1]:= vec[j];
                j:= j - 1;
            end;
            vec[j+1]:= actual;
        end;
    end;
procedure ordMetodoSeleccion(var vec: vector; dimL: integer);
    var
        i, j, pos: indice;
        item: oficina;
    begin
        for i:= 1 to (dimL - 1) do begin
            pos:= i;
            for j:= i to dimL do begin
                if (vec[j].codIden < vec[pos].codIden) then
                    pos:= j;
                item:= vec[pos];
                vec[pos]:= vec[i];
                vec[i]:= item;
            end;
        end;
    end;
procedure informarVector(vec: vector; dimL: integer);
    var
        i: integer;
    begin
        for i:= 1 to dimL do begin
            writeln('Código de identificación: ', vec[i].codIden);
        end;
    end;
var
    vec: vector;
    dimL: integer;
begin
    cargarVector(vec, dimL);
    //ordMetodoInsercion(vec, dimL);
    ordMetodoSeleccion(vec, dimL);
    informarVector(vec, dimL);
end.
