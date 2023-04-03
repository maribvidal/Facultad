program Ejercicio1;
var
    numero, cantidad: integer;
begin
    cantidad:= 0;
    for numero:= 1 to 10 do {Contar 10 números y sumarlos}
    begin
        writeln(numero);
        cantidad:= cantidad + numero;
    end;
    writeln('Suma total: ',cantidad); {Informar la suma total}
end.
