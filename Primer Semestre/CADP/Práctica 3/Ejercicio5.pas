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
        while (seguir) do begin
            if (nom <> c.marca) then begin
                mProm:= mProm/cant;
                writeln('El precio promedio de ',nom,' fue de ',mProm:2:2);
                mProm:= 0;
                cant:= 0;
                if (c.marca = 'ZZZ') then begin
                    writeln('ping');
                    seguir:= false;
                end;
                nom:= c.marca;
                writeln('A PARTIR DE AHORA, SE VA A LEER LA NUEVA MARCA (',nom,').');
                writeln('--------------');
            end;
            if (c.marca <> 'ZZZ') then begin
                cant:= cant + 1;
                actualizarMaximo(c, marcaMax, modeloMax, precioMax);
                mProm:= mProm + c.precio;
                leerAuto(c);
            end;
        end;
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
