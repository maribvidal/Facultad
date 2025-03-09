program Ejercicio5;
type
    car = record
        marca, modelo: string;
        precio: real;
    end;
procedure leerAuto(var c: car);
    begin
        write('>Nombre de la marca: '); readln(c.marca);
        write('>Nombre del modelo: '); readln(c.modelo);
        write('>Precio del auto: '); readln(c.precio);
    end;
procedure actualizarMaximo(c: car; var marcaMax, modeloMax: string; var precioMax: real);
    begin
        if (c.precio > precioMax) then begin
            precioMax:= c.precio;
            marcaMax:= c.marca;
            modeloMax:= c.modelo;
        end;
    end;
procedure procesarMarca(var precioMax: real; var marcaMax, modeloMax: string; var seguir: boolean);
    var
        c: car;
        nom: string;
        cant: integer;
        mProm: real;
    begin
        writeln('--------------');
        {Inicializar variables}
        mProm:= 0;
        cant:= 0;
        leerAuto(c);
        nom:= c.marca;
        while (nom = c.marca) and (c.marca <> 'ZZZ') do begin
            mProm:= mProm + c.precio;
            cant:= cant + 1;
            actualizarMaximo(c, marcaMax, modeloMax, precioMax);
            leerAuto(c);
        end;
        mProm:= mProm/cant;
        writeln('El precio promedio de la marca ',nom,' es de $',mProm:2:2);
        if (c.marca = 'ZZZ') then begin seguir:= false; end;
    end;
var 
    seguir: boolean;
    precioMax: real;
    marcaMax, modeloMax: string;
begin
    {Inicializar variables}
    seguir:= true;
    precioMax:= -1;
    marcaMax:= '';
    modeloMax:= '';
    while (seguir) do begin
        procesarMarca(precioMax, marcaMax, modeloMax, seguir);
    end;
    writeln('La marca del auto mas caro es ',marcaMax);
    write('El modelo del auto mas caro es ',modeloMax);
end.
