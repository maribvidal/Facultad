program Ejercicio6;
type
    rango = 1..200;
    precios = 0..9999;
var
    codigo, codProdBarato, codProdBarato2: rango;
    precio, precioProd: precios;
    i, cantProd: integer;
begin
    precioProd:= 9999; {Inicializando variables}
    codProdBarato:= 1;
    codProdBarato2:= 1;
    cantProd:= 0;
    for i:= 1 to 5 do {Leer 200 productos}
    begin
        write('Ingrese el código del producto: ');
        read(codigo);
        write('Ingrese el precio del producto: ');
        read(precio);
        if (precio <= precioProd) then {Si el precio del producto es menor a la variable precioProd...}
        begin
            codProdBarato2:= codProdBarato;
            codProdBarato:= codigo;
        end;
        if (precio > 16) and ((codigo mod 2) = 0) then {Si el producto vale mas de 16 pesos y tiene código par...}
        begin
            cantProd:= cantProd + 1;
        end;
    end;
    writeln('El código del producto mas barato es: ', codProdBarato);
    writeln('El código del segundo producto mas barato es: ', codProdBarato2);
    write('La cantidad de productos que valen mas de 16 pesos y tienen código par es: ', cantProd);
end.
