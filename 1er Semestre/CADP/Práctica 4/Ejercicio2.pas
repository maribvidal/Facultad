program Ejercicio2;
const
    cant_datos = 150;
type
    vdatos = array[1..cant_datos] of real; {vector de 150 espacios de tipo real}
procedure cargarVector(var v: vdatos; var dimL: integer);
    var
        i: integer;
    begin
        writeln('Iniciando la secuencia --');
        for i:= 1 to cant_datos do begin
            readln(v[i]);
            if not (v[i] = 0) then begin
                dimL:= dimL + 1;{incrementar la variable por cada espacio ocupado}
            end else begin
                break;
            end;
        end;
    end;
procedure modificarVectorySumar(var v: vdatos; dimL: integer; n: real; var suma: real);
    var
        i: integer;
    begin
        for i:= 1 to dimL do begin {leer todos los datos leídos en el anterior módulo}
            v[i]:= v[i] + n;
            suma:= suma + v[i];
        end;
    end;
var
    datos: vdatos;
    dim: integer;
    num, suma: real;
begin
    dim:= 0;
    suma:= 0;
    cargarVector(datos, dim); {completar}
    writeln('Ingrese un valor a sumar');
    readln(num);
    modificarVectorySumar(datos, dim, num, suma); {completar}
    writeln('La suma de los valores es: ', suma:2:1);
    writeln('Se procesaron: ',dim, ' números');
end.
