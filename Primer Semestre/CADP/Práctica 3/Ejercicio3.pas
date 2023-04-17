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
procedure actualizarMaximos(s: school; var cueMin1, cueMin2: integer; var nomMin1, nomMin2: string; var promMin1, promMin2: real);
    begin
        if (relacionDA(s.cAlum, s.cDoc) < promMin1) then {Si la relación docente-alumno es menor que el primer promedio...}
        begin
            cueMin2:= cueMin1;
            nomMin2:= nomMin1;
            promMin2:= promMin1;
            {---}
            cueMin1:= s.CUE;
            nomMin1:= s.nombre;
            promMin1:= relacionDA(s.cAlum, s.cDoc);
        end
        else if (relacionDA(s.cAlum, s.cDoc) < promMin2) then {Si, en cambio, es menor que el segundo promedio...}
        begin
            cueMin2:= s.CUE;
            nomMin2:= s.nombre;
            promMin2:= relacionDA(s.cAlum, s.cDoc);                
        end;
    end;
const
    propUNESCO = 23.435;
var
    colegio: school;
    i, cantEsp, cueMin1, cueMin2: integer;
    nomMin1, nomMin2: string;
    promMin1, promMin2: real;
begin
    {Inicializar variables}
    cantEsp:= 0;
    cueMin1:= 0;
    cueMin2:= 0;
    nomMin1:= ' ';
    nomMin2:= ' ';
    promMin1:= 9999;
    promMin2:= 9999;
    {Programa principal}
    for i:= 1 to 2400 do {Hay que leer 2400 escuelas}
    begin
        leerColegio(colegio);
        if ((colegio.localidad = 'La Plata') and (relacionDA(colegio.cAlum, colegio.cDoc) > propUNESCO)) then cantEsp:= cantEsp + 1;
        actualizarMaximos(colegio, cueMin1, cueMin2, nomMin1, nomMin2, promMin1, promMin2);
    end;
    writeln('>Cantidad de escuelas de La Plata con una relación de alumnos por docente superior a la sugerida por UNESCO: ', cantEsp);
    writeln('>El primer colegio con mejor relación docente-alumno es el ',nomMin1,' y su CUE es ',cueMin1);
    write('>El segundo colegio con mejor relación docente-alumno es el ',nomMin2,' y su CUE es ',cueMin2);
end.
