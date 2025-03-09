program Ejercicio2c;
type
    date = record {Crear el Registro para las fechas}
        dia, mes, ano: integer;
    end;
procedure leerFecha(var f: date); {Crear proceso para leer fechas}
    begin
        write('>Ingresar día: '); readln(f.dia);
        write('>Ingresar mes: '); readln(f.mes);
        write('>Ingresar año: '); readln(f.ano);
    end;
procedure cheqFechasEsp(f: date; var fVerano, fPrimerosDias: integer); {Crear proceso para llevar la cuenta de las fechas especiales}
    begin
        if (f.mes <= 3) {and (f.mes > 0)} then fVerano:= fVerano + 1; {Revisar si el mes pertenece a uno de los meses de verano}
        if (f.dia <= 10) {and (f.dia > 0)} then fPrimerosDias:= fPrimerosDias + 1; {Revisar si la fecha es en los 10 primeros días del mes}
    end;
var
    fecha: date;
    cantVerano, cantPrimerosDias: integer;
begin
    {Inicializar variables}
    cantVerano:= 0;
    cantPrimerosDias:= 0;
    leerFecha(fecha);
    {Mientras el año ingresado sea diferente de 2020...}
    while (fecha.ano <> 2020) do
    begin
        cheqFechasEsp(fecha, cantVerano, cantPrimerosDias);
        leerFecha(fecha);
    end; 
    {Informar}
    writeln('>Cantidad de casamientos realizados en la temporada de verano: ', cantVerano);
    write('>Cantidad de casamientos realizados en los primeros 10 días de cada mes: ', cantPrimerosDias);
end.
