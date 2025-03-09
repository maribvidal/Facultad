program Registros;
type
    str20 = string[20];
    alumno = record
        codigo: integer;
        nombre: str20;
        promedio: real;
    end;
procedure leer(var alu: alumno);
    begin
    write('Ingrese el código del alumno: ');
    readln(alu.codigo);
    if (alu.codigo <> 0) then begin
        write('Ingrese el nombre del alumno: '); readln(alu.nombre);
        write('Ingrese el promedio del alumno: '); read(alu.promedio);
    end;
    end;
var
    a: alumno;
    cantidad: integer;
    mejorProm: real;
    mejorPromNom: string;
begin
    cantidad:= 0;
    mejorProm:= -1;
    leer(a);
    while (a.codigo <> 0) do begin
        if (a.promedio > mejorProm) then mejorPromNom:= a.nombre; mejorProm:= a.promedio;
        cantidad:= cantidad + 1;
        leer(a);
    end;
    writeln('Cantidad de alumnos leídos: ',cantidad);
    write('El alumno con mejor promedio es: ',mejorPromNom);
end.
