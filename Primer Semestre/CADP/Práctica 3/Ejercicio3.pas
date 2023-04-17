program Ejercicio3;
type
    school = record {Crear el Registro para las escuelas}
        CUE, cDoc, cAlum: integer;
        nombre, localidad: string;
    end;
function relacionDA(a, d: integer):real; {Crear un módulo para determinar la relación docente-alumno}
    begin
        relacionDA:= a/d;
    end;
procedure leerColegio(var s: school); {Ingresar los datos de cada colegio}
    begin
        write('>Ingrese el CUE (código único de establecimiento): '); readln(s.CUE);
        write('>Ingrese el nombre del establecimiento: '); readln(s.nombre);
        write('>Ingrese la cantidad de docentes: '); readln(s.cDoc);
        write('>Ingrese la cantidad de alumnos: '); readln(s.cAlum);
        write('>Ingrese la localidad: '); readln(s.localidad);
    end;
procedure actualizarMaximos(s: school; var cueMax1, cueMax2: integer; var nomMax1, nomMax2: string; var promMax1, promMax2: real);
    begin
        if (relacionDA(s.cAlum, s.cDoc) < promMax1) then {Si la relación docente-alumno es mayor que el primer promedio grande...}
        begin
            cueMax2:= cueMax1;
            nomMax2:= nomMax1;
            promMax2:= promMax1;
            {---}
            cueMax1:= s.CUE;
            nomMax1:= s.nombre;
            promMax1:= relacionDA(s.cAlum, s.cDoc);
        end
        else if (relacionDA(s.cAlum, s.cDoc) < promMax2) then {Si, en cambio, es mayor que el segundo promedio grande...}
        begin
            cueMax2:= s.CUE;
            nomMax2:= s.nombre;
            promMax2:= relacionDA(s.cAlum, s.cDoc);                
        end;
    end;
const
    propUNESCO = 23.435;
var
    colegio: school;
    i, cantEsp, cueMax1, cueMax2: integer;
    nomMax1, nomMax2: string;
    promMax1, promMax2: real;
begin
    {Inicializar variables}
    cantEsp:= 0;
    cueMax1:= 0;
    cueMax2:= 0;
    nomMax1:= ' ';
    nomMax2:= ' ';
    promMax1:= 9999;
    promMax2:= 9999;
    {Programa principal}
    for i:= 1 to 1 do {Hay que leer 2400 escuelas}
    begin
        leerColegio(colegio);
        if ((colegio.localidad = 'La Plata') and (relacionDA(colegio.cAlum, colegio.cDoc) > propUNESCO)) then cantEsp:= cantEsp + 1;
        actualizarMaximos(colegio, cueMax1, cueMax2, nomMax1, nomMax2, promMax1, promMax2);
    end;
    writeln('>Cantidad de escuelas de La Plata con una relación de alumnos por docente superior a la sugerida por UNESCO: ', cantEsp);
    writeln('>El primer colegio con mejor relación docente-alumno es el ',nomMax1,' y su CUE es ',cueMax1);
    write('>El segundo colegio con mejor relación docente-alumno es el ',nomMax2,' y su CUE es ',cueMax2);
end.
