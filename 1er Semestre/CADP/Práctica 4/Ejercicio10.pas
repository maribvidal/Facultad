program Ejercicio10;
const
    dimF = 300; //A lo sumo, el vector de salarios debe tener 300 espacios.
type
    vector = array [1..dimF] of real;
procedure cargarVector(var v: vector; var dimL: integer);
    var
        i, salario: integer;
    begin
        write('Ingrese el salario del empleado: >'); readln(salario);
        i:= 1;
        while (salario <> 0) and (i < dimF) do begin //Si una condición de las dos es FALSA, que termine el while
            v[i]:= salario;
            dimL:= i; //Actualizar el límite de la dimensión lógica
            write('Ingrese el salario del empleado: >'); readln(salario);
            i:= i + 1;
        end;
    end;
procedure aumentarSalarios(var v: vector; dimL: integer);
    var
        i: integer;
    begin
        for i:= 1 to dimL do begin //Que el FOR solo cubra la dimensión lógica
            v[i]:= (v[i] * 1.15); //Incrementar el salario un 15%
            //writeln('El nuevo salario de ',i,' es de $',v[i]:2:2); -- para probar
        end;
    end;
procedure promedioSalarios(v: vector; dimL: integer);
    var
        i: integer;
        promedio: real;
    begin
        promedio:= 0;
        for i:= 1 to dimL do begin
            promedio:= promedio + v[i];
        end;
        writeln('El promedio del total de salarios de la empresa es de ',(promedio/dimL):2:2);
    end;
var
    v: vector;
    dimL: integer;
begin
    cargarVector(v, dimL);
    promedioSalarios(v, dimL);
    aumentarSalarios(v, dimL);
    promedioSalarios(v, dimL);
end.
