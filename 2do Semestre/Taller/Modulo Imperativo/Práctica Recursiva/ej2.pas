program ej2pr2;
const
    CORTE = 0;
function descomponerNumero(n: integer):integer;
    begin
        if (n <> CORTE) then begin //Verificar que el número no sea 0
            descomponerNumero(n div 10); //Pasar de manera recursiva el mismo número dividido por 10
            writeln((n mod 10));
        end;
        descomponerNumero:= 0;
    end;
var
    numero: integer;
begin
    Randomize;
    numero:= Random(1000);
    writeln('Número:', numero);
    descomponerNumero(numero);
end.
