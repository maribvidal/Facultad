program Ejercicio8a;
type
    rango = 0..1000; {Para ponerle un límite al monto}
var
    monto: rango;
    i, cantVentasDia, cantVentasMes, montoTotalDia, montoTotalMes, aux, diaEspecial: integer;
begin
    cantVentasDia:= 0; {Inicializar las variables}
    cantVentasMes:= 0;
    montoTotalDia:= 0;
    montoTotalMes:= 0;
    aux:= 0;
    diaEspecial:= 0;
    for i:= 1 to 31 do {Repetir la operación por cada día de 31 dias}
    begin
        repeat {Repetir el bloque hasta que el monto sea igual a 0}
        begin
            write('Ingresa el monto de tu compra: ');
            read(monto);
            cantVentasDia:= cantVentasDia + 1;
            montoTotalDia:= montoTotalDia + monto;
        end;
        until (monto = 0);
        if (cantVentasDia > aux) then {Si la cantidad de ventas del día es superior a aux...}
        begin
            aux:= cantVentasDia;
            diaEspecial:= i;
        end;
        cantVentasMes:= cantVentasMes + cantVentasDia; {Registrar las cantidades del día}
        montoTotalMes:= montoTotalMes + montoTotalDia;
        cantVentasDia:= 0; {Reiniciar las variables}
        montoTotalDia:= 0;
    end;
    writeln('Durante este mes se hicieron un total de ',cantVentasMes,' ventas');
    writeln('Y se recaudó un total de ',montoTotalMes,' pesos');
    write('El día mas próspero del mes fue el ', diaEspecial);
end.
