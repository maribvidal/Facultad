program Ejercicio4a;
type
    linea = record
        numero, minutos, MB: integer;
    end;
    cliente = record
        codigo, lineas: integer;
    end;
procedure leerTelefono(var l: linea);
    begin
        write('>Ingresar el número: '); readln(l.numero);
        write('>Ingresar la cantidad de minutos consumidos en un mes: '); readln(l.minutos);
        write('>Ingresar la cantidad de MBs consumidos en un mes: '); readln(l.MB);
    end;
procedure procesarCliente(var facturaMinutos, facturaMB: real);
    var 
        i: integer;
        l: linea;
        c: cliente;
    begin
        write('>Ingresar el código del cliente: '); readln(c.codigo);
        write('>Ingresar la cantidad de líneas que posee: '); readln(c.lineas);
        for i:= 1 to c.lineas do
        begin
            leerTelefono(l);
            facturaMinutos:= facturaMinutos + l.minutos;
            facturaMB:= facturaMB + l.MB;
        end;
        facturaMinutos:= facturaMinutos * 3.4 ;
        facturaMB:= facturaMB * 1.35;
    end;
var 
    i: integer;
    facturaMinutos, facturaMB: real;
begin
    facturaMinutos:= 0;
    facturaMB:= 0;
    for i:= 1 to 9300 do {Leer 9300 clientes}
    begin
        procesarCliente(facturaMinutos, facturaMB);
        writeln('El cliente tiene que pagar ',facturaMinutos:2:2,'$ por los minutos y ',facturaMB:2:2,' por los MB gastados.');
    end;
end.
