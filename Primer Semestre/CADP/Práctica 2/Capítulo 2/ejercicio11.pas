program ej11;
function noEsSimboloDeDinero(caracter: char):boolean;
    begin
        noEsSimboloDeDinero:= (caracter <> '$');
    end;
function esArroba(caracter: char):boolean;
    begin
        esArroba:= (caracter = '@');
    end;
procedure seCumpleSeqA(var verificar: boolean; var largo: integer);
    var
        caracter: char;
    begin
        writeln(' --- SECUENCIA X --- ');
        writeln(' >Para terminar la secuencia, ingrese un "%"');
        write(' >Ingrese cualquier carácter (menos "$"): '); readln(caracter);
        while (caracter <> '%') and (verificar) do begin {Mientras el CARACTER no sea un "%"", o, siga siendo uno de los simbolos permitidos...}
            if (not noEsSimboloDeDinero(caracter)) then begin
                verificar:= false;
            end
            else begin
                verificar:= true;
                write(' >'); readln(caracter);
            end;
            largo:= largo + 1;
        end;
        writeln(' ------------------- ');
    end;
procedure seCumpleSeqB(var verificar: boolean; largo: integer);
    var
        caracter: char;
        ingresos, vecesArroba: integer;
    begin
        ingresos:= 0;
        vecesArroba:= 0;
        writeln('                     ');
        writeln(' --- SECUENCIA Y --- ');
        write(' >Ingrese cualquier carácter: '); readln(caracter);
        writeln(' >(',ingresos,'/',largo,')');
        while (caracter <> '*') and (ingresos < largo) do begin {Mientras el CARACTER no sea un "*"", o, el largo de la secuencia sea menor a la variable...}
            if (esArroba(caracter)) then begin
                vecesArroba:= vecesArroba + 1;
            end;
            write(' >'); readln(caracter);
            ingresos:= ingresos + 1;
            writeln(' >(',ingresos,'/',largo,')');
        end;
        if (vecesArroba > 2) then begin
            verificar:= true;
        end
        else begin
            verificar:= false;
        end;
        writeln('');
    end;
var
    verificar: boolean;
    largo: integer;
begin
    verificar:= true; {Inicializar variables}
    largo:= 0;
    seCumpleSeqA(verificar, largo);
    if (verificar) then begin
        seCumpleSeqB(verificar, largo);
        if (verificar) then begin
            write(' --- SE CUMPLE LA SECUENCIA ---');
        end else begin
            write(' --- NO SE CUMPLE LA SECUENCIA B ---');
        end;
    end else begin
        write(' --- NO SE CUMPLE LA SECUENCIA A ---');
    end;
end.
