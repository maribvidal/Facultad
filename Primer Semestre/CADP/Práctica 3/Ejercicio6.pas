program Ejercicio6;
type
    rangoNum = 0..9999; {Para que el número a ser ingresado se mantenga dentro de un margen realista}
    microprocessor = record
        brand, line: string;
        cores, vel, size: rangoNum;
    end;
procedure leerMp(var m: microprocessor); {Leer la información del microprocesador y devolverla}
    begin
        write('Ingresar la marca: >'); readln(m.brand);
        write('Ingresar la línea: >'); readln(m.line);
        write('Ingresar la cantidad de nucleos que posee: >'); readln(m.cores);
        write('Ingresar la velocidad del reloj: >'); readln(m.vel);
        write('Ingresar el tamaño en nanómetros: >'); readln(m.size);
    end;
procedure infoRelevanteMp(m: microprocessor; var cantEsp: integer);
    begin
        if (m.cores > 2) and (m.size <= 22) then begin {Si el producto tiene mas de 2 nucleos y menos o igual 22 nanómetros...}
            writeln('Este microprocessor ',m.brand,' ',m.line,' cuenta con más de 2 núcleos y con transistores de hasta 22 nanómetros.');
        end;
        if (m.cores > 1) and (m.vel >= 2) and ((m.brand = 'Intel') or (m.brand = 'AMD')) then begin cantEsp:= cantEsp + 1; end;
    end;
procedure procesarMarca(var cantEsp, cantProd: integer; var marcaProd: string; var terminar: boolean);
    var
        marcaActual: string;
        mp: microprocessor;
    begin
        cantProd:= 0;
        marcaProd:= '';
        leerMp(mp);
        marcaActual:= mp.brand;
        while (mp.brand = marcaActual) and (mp.cores <> 0) do begin
            writeln('Print en 33');
            infoRelevanteMp(mp, cantEsp);
            marcaProd:= mp.brand;
            writeln('Print en 39');
            if (mp.size = 14) then begin 
                cantProd:= cantProd + 1; 
            end;
            leerMp(mp);
        end;
        if (mp.cores = 0) then begin 
            terminar:= false;
        end;
    end;
procedure actualizarMax(cantProd: integer; marcaProd: string; var cantMax1, cantMax2: integer; var marcaMax1, marcaMax2: string);
    begin
        if (cantProd > cantMax1) then begin
            cantMax2:= cantMax1;
            marcaMax2:= marcaMax1;
            cantMax1:= cantProd;
            marcaMax1:= marcaProd;
        end
        else begin
            cantMax2:= cantProd;
            marcaMax2:= marcaProd;            
        end;
    end;
var
    terminar: boolean;
    marcaProd, marcaMax1, marcaMax2: string;
    cantEsp, cantProd, cantMax1, cantMax2: integer;
begin
    cantMax1:= -1; cantMax2:= -1; cantProd:= 0; cantEsp:= 0;
    marcaMax1:= ''; marcaMax2:= ''; marcaProd:= '';
    terminar:= true;
    while (terminar) do begin
        procesarMarca(cantEsp, cantProd, marcaProd, terminar);
        actualizarMax(cantProd, marcaProd, cantMax1, cantMax2, marcaMax1, marcaMax2);
        writeln('Pasando a leer otra marca...');
        writeln;
    end;
    writeln('Las dos marcas con mayor cantidad de procesadores con transistores de 14 nm son ',marcaMax1,' y ',marcaMax2);
    write('Hubo un total de ',cantEsp,' procesadores multicore de Intel o AMD con relojes de velocidades de a lo sumo 2 Ghz');
end.
