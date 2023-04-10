program programadores;
procedure leerDatos(var salario: real; var legajo: integer);
begin
    writeln('Ingrese el nro de legajo y el salario: ');
    read(legajo);
    read(salario);
end;
procedure actualizarMaximo(nuevoLegajo: integer; nuevoSalario: real; var maxLegajo: integer; var maxSalario: real);
begin
    if (nuevoLegajo > maxLegajo) then begin
        maxLegajo:= nuevoLegajo;
        maxSalario:= nuevoSalario;
    end;
end;
var
    legajo, maxLegajo, i: integer;
    salario, maxSalario: real;
    sumaSalarios: real; {ERROR: sumaSalarios no se encuentra definida}
begin
    sumaSalarios:= 0;
    for i:= 1 to 3 do begin {Para 130 trabajadores de JAVA...}
        leerDatos(salario, legajo); {ERROR: Los parámetros están invertidos}
        actualizarMaximo(legajo, salario, maxLegajo, maxSalario); {ERROR: Falta un parámetro de referencia para el salario máximo}
        sumaSalarios:= sumaSalarios + salario; {ERROR: Como no se obtuvo el salario máximo del procedure, salario sigue valiendo 0}
    end;
    writeln('En todo el mes se gastan ', sumaSalarios:2:2, ' pesos');
    writeln('El salario del empleado más nuevo es ', maxSalario:2:2);
end.