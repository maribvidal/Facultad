program Ejercicio7;
type
    rangoNum = 0..9999; {Para que el número a ser ingresado se mantenga dentro de un margen realista}
    centro = record
        abreviatura, universidad: string;
        investigadores, becarios: rangoNum;
    end;
procedure leerCentro(var c: centro); {Ingresar los datos del centro universitario a ser leido}
    begin
        write('Ingrese la universidad: >'); readln(c.universidad);
        write('Ingrese la abreviatura: >'); readln(c.abreviatura);
        write('Ingrese la cantidad de investigadores: >'); readln(c.investigadores);
        write('Ingrese la cantidad de becarios: >'); readln(c.becarios);
    end;
procedure actualizar1(c: centro; var centroMin1, centroMin2: integer; var nCentroMin1, nCentroMin2: string); {Actualizar los centros con menores cantidades de becarios}
    begin
        if (c.becarios < centroMin1) then begin
            centroMin2:= centroMin1;
            nCentroMin2:= nCentroMin1;
            centroMin1:= c.becarios;
            nCentroMin1:= c.abreviatura;
        end 
        else if (c.becarios < centroMin2) then begin
            centroMin2:= c.becarios;
            nCentroMin2:= c.abreviatura;
        end;
    end;
procedure actualizar2(nUni1: string; cUni1: integer; var nUni2: string; var cUni2: integer); {Actualizar el nombre de la universidad con mas investigadores}
    begin
        if (cUni1 > cUni2) then begin
            nUni2:= nUni1;
            cUni2:= cUni1;
        end;
    end;
procedure procesarUniversidades(var invMax, centroMin1, centroMin2: integer; var nCentroMin1, nCentroMin2, invUni: string; var terminar: boolean);
    var
        c: centro;
        nombreUni: string;
        cantCentros, cantInv: integer;
    begin
        cantCentros:= 0;
        cantInv:= 0;
        writeln;
        writeln(' --------- ');
        leerCentro(c);
        nombreUni:= c.universidad;
        while (c.universidad = nombreUni) and (c.investigadores <> 0) do {Mientras la universidad siga sienda la misma Y la cantidad de investigadores diferentes de 0...}
        begin
            actualizar1(c, centroMin1, centroMin2, nCentroMin1, nCentroMin2);
            cantCentros:= cantCentros + 1;
            cantInv:= cantInv + c.investigadores;
            leerCentro(c);
        end;
        if (c.investigadores = 0) then begin
            terminar:= false; {Si los investigadores son igual a 0, el programa debe terminar}
        end;
        actualizar2(nombreUni, cantInv, invUni, invMax);
        writeln('La universidad ',nombreUni,' tiene en total ',cantCentros,' centros');
        writeln(' --------- ');
        writeln;
    end;
var
    terminar: boolean;
    invMax, centroMin1, centroMin2: integer;
    nCentroMin1, nCentroMin2, invUni: string;
begin
    terminar:= true;
    invMax:= 0;
    centroMin1:= 9999;
    centroMin2:= 9999;
    nCentroMin1:= '';
    nCentroMin2:= '';
    invUni:= '';
    while (terminar) do
    begin
        procesarUniversidades(invMax, centroMin1, centroMin2, nCentroMin1, nCentroMin2, invUni, terminar);
        if (terminar) then begin writeln(' -- CAMBIO DE UNIVERSIDAD -- '); end;
    end;
    writeln(' --------- ');
    writeln('La universidad con la mayor cantidad de investigadores es ',invUni);
    writeln('Los dos centros con menor cantidad de becarios son ',nCentroMin1,' y ',nCentroMin2);
    write(' --------- ');
end.
