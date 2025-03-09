program Ejercicio12;
const
    dimF = 53; //Hay 53 galaxias
type
    rangoTxt = string[20]; //Limitar rangos
    galaxia = record
        nombre: rangoTxt;
        tipo: integer;
        masa: real;
        pc: real;
    end;
    valores_limite = record //Para guardar los valores máximos y mínimos mas fácilmente
        nombre1, nombre2: string;
        cant1, cant2: real;
    end;
    tipo_galaxia = array [1..4] of integer; //(1. elíptica; 2. espiral; 3. lenticular; 4. irregular)
    vector = array [1..dimF] of galaxia;
procedure cargarVector(var v: vector);
    var
        i: integer;
    begin
        for i:= 1 to dimF do begin
            write('Nombre de la galaxia: '); readln(v[i].nombre);
            write('Tipo de galaxia: '); readln(v[i].tipo);
            write('Su masa (en kilogramos): '); readln(v[i].masa);
            write('Su distancia (en parsecs) con respecto a la tierra: '); readln(v[i].pc);
        end;
    end;
procedure actualizarLimite(masaActual: real; nombreActual: string; var max, min: valores_limite);
    begin
        if (masaActual > max.cant1) then begin
            max.cant2:= max.cant1;
            max.nombre2:= max.nombre1;
            max.cant1:= masaActual;
            max.nombre1:= nombreActual;
        end
        else if (masaActual > max.cant2) then begin
            max.cant2:= masaActual;
            max.nombre2:= nombreActual;
        end;
        if (masaActual < min.cant1) then begin
            min.cant2:= min.cant1;
            min.nombre2:= min.nombre1;
            min.cant1:= masaActual;
            min.nombre1:= nombreActual;
        end
        else if (masaActual < min.cant2) then begin
            min.cant2:= masaActual;
            min.nombre2:= nombreActual;
        end;
    end;
procedure procesarVector(v: vector; var tg: tipo_galaxia; var max, min: valores_limite);
    var
        i, cantEsp: integer;
        masaTotal, masaEsp: real;
    begin
        cantEsp:= 0;
        masaTotal:= 0;
        masaEsp:= 0;
        for i:= 1 to dimF do begin
            tg[v[i].tipo]:= tg[v[i].tipo] + 1; //Sumarle 1 al tipo de galaxia
            if (v[i].tipo <> 4) and (v[i].pc < 1000) then begin cantEsp:= cantEsp + 1; end;
            if (v[i].nombre = 'Vía Láctea') or (v[i].nombre = 'Andrómeda') or (v[i].nombre = 'Triángulo') then begin
                masaEsp:= masaEsp + v[i].masa;
            end;
            actualizarLimite(v[i].masa, v[i].nombre, max, min); //Actualizar máximos y mínimos
            masaTotal:= masaTotal + v[i].masa;
        end;
        writeln('La masa total acumulada de la Vía Láctea, Andrómeda y Triángulo (',masaEsp:2:2,'kg) representa el ',()(masaEsp/masaTotal)*100):2:2,'% de la masa total');
        writeln('Se registraron un total de ',cantEsp,' galaxias no irregulares con una distancia con respecto a la tierra de menos de 1000 parsecs');
    end;
var
    v: vector;
    tg: tipo_galaxia;
    max, min: valores_limite;
begin
    max.nombre1:= ''; max.cant1:= -1; //Inicializar
    max.nombre2:= ''; max.cant2:= -1;
    min.nombre1:= ''; min.cant1:= 99999;
    min.nombre2:= ''; min.cant2:= 99999;
    cargarVector(v);
    procesarVector(v, tg, max, min);
    writeln('Hay ',tg[1],' galaxias elípticas');
    writeln('Hay ',tg[2],' galaxias espirales');
    writeln('Hay ',tg[3],' galaxias lenticulares');
    writeln('Hay ',tg[4],' galaxias irregulares');
    writeln('La primera galaxia con mayor masa se llama ',max.nombre1);
    writeln('La segunda galaxia con mayor masa se llama ',max.nombre2);
    writeln('La primera galaxia con menor masa se llama ',min.nombre1);
    write('La segunda galaxia con menor masa se llama ',min.nombre2);
end.
