program ejercicio6;
procedure leerProducto(var precio: real; var codigo: integer; var tipo: string);
    begin
        write('Ingrese el precio del producto: '); read(precio);
        write('Ingrese el código del producto: '); read(codigo);
        write('Ingrese el tipo de producto: '); read(tipo);
    end;
procedure actualizarPrecios(nuevoTipo: string; nuevoPrecio: real; nuevoCodigo: integer; var barPrecio1: real; var barPrecio2: real; var pantPrecio: real; var barCodigo1: integer; var barCodigo2: integer; var pantCodigo: integer);
    begin
        if (nuevoPrecio <= barPrecio1) then
            begin
                barPrecio1:= nuevoPrecio;
                barCodigo1:= nuevoCodigo;
            end;
        else
            begin
                barPrecio2:= nuevoPrecio;
                barCodigo2:= nuevoCodigo;
            end;
        if (nuevoTipo = "pantalón") and (nuevoPrecio > pantPrecio) then
            begin
                pantPrecio:= nuevoPrecio
                pantCodigo:= nuevoCodigo;
            end;
    end;
var
    i, cod, barCod1, barCod2, pantCod: integer;
    prec, barPrec1, barPrec2, pantPred, precPromedio: real;
    t: string;
begin
    barPrec1:= 1000; barPrec2:= 1000; pantPred:= 0; precPromedio:= 0; {Inicializar las variables}
    barCod1:= 0; barCod2:= 0; pantCod:= 0;
    for i:= 1 to 4 do begin {Leer 100 productos}
        leerProducto(prec, cod, t);
        precPromedio:= precPromedio + prec;
        actualizarPrecios(prec, cod, barPrec1, barPrec2, barCod1, barCod2, pantCod);
    end;
    precPromedio:= precPromedio div 100; {Porque se leyeron 100 precios}
    writeln('El código del primer producto mas barato es: ',barCod1);
    writeln('El código del segundo producto mas barato es: ',barCod2);
    writeln('El código del pantalón mas caro es: ',pantCod);
    write('El precio promedio de todos los productos es: ',precPromedio);
end.
