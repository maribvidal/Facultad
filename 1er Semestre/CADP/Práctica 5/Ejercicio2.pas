program punteros;
type
    cadena = string[9]; //Cadena string de 9, si se usara, tendría un peso de 9+1 bytes
    producto = record
        codigo: integer; //2 bytes
        descripcion: cadena;
        precio: real; //4 bytes
    end;
    puntero_producto = ^producto; //Los bytes del registro son iguales a las sumas de lo que ocupa sus elementos, osease, 2 + 4 + 10 = 16 bytes + 8 bytes del registro
var
    p: puntero_producto;
    prod: producto;
begin
    writeln(sizeof(p), ' bytes'); //El registro ocupa 8 bytes por defecto
    writeln(sizeof(prod), ' bytes'); //24 bytes (8+4+2+10)
    new(p);
    writeln(sizeof(p), ' bytes'); //8 bytes
    p^.codigo := 1;
    p^.descripcion := 'nuevo producto'; //La cadena son 10 bytes
    writeln(sizeof(p^), ' bytes'); //24 bytes
    p^.precio := 200;
    writeln(sizeof(p^), ' bytes'); //24 bytes
    prod.codigo := 2;
    prod.descripcion := 'otro nuevo producto';
    writeln(sizeof(prod), ' bytes'); //24 bytes
end.
