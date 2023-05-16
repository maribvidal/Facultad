program punteros;
type
    numeros = array[1..10000] of integer; //El peso en bytes (memoria) de un array es igual a su DIMF multiplicado por los bytes del tipo de dato (INT=2bytes)
    puntero_numeros = ^numeros;
var
    n: puntero_numeros;
    num: numeros;
    i: integer;
    r: real;
begin
    writeln(sizeof(r), ' bytes'); //Ver tamaño de reales
    writeln(sizeof(n), ' bytes'); //El puntero por si solo pesa 8 bytes
    writeln(sizeof(num), ' bytes'); //El array pesa 10000 * 2 (DIMF * bytesTipoDeDato)
    new(n);
    writeln(sizeof(n^), ' bytes'); // Al puntero se le asigna una dirección de memoria para almacenar un array de 100000 enteros
    for i:= 1 to 5000 do
        n^[i]:= i;
    writeln(sizeof(n^), ' bytes'); //El puntero sigue valiendo lo mismo
end.
