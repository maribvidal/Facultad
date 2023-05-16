program punteros;
type
    cadena = string[50];
    puntero_cadena = ^cadena;
var
    pc: puntero_cadena;
begin
    writeln(sizeof(pc), ' bytes'); //El puntero asociado a un string por si vale 8 bytes
    new(pc);
    writeln(sizeof(pc), ' bytes'); //8 bytes
    pc^:= 'un nuevo nombre';
    writeln(sizeof(pc), ' bytes'); //8 bytes
    writeln(sizeof(pc^), ' bytes'); //La cadena es de 50 + 1 hace que el puntero valga 51 bytes
    pc^:= 'otro nuevo nombre distinto al anterior';
    writeln(sizeof(pc^), ' bytes'); //51 bytes
end.
