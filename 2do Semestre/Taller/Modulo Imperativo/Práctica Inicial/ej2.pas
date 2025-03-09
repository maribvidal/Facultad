program prIniEj2;
const
    corte = -1;
type
    t_zona = 1..5;
    propiedad = record
        zona: t_zona;
        codigo: integer;
        tipo: integer;
        cantidadMetros: integer;
        precioPorMetro: real;
    end;
    lista = ^nodo; //Lista por zona
    nodo = record
        dato: propiedad;
        sig: lista;
    end;
    listaCodigos = ^nodo2; //Lista para los códigos de las propiedades
    nodo2 = record
        dato: integer;
        sig: listaCodigos;
    end;
    vectorZonas = array [t_zona] of lista; //Vector de zonas para agruparlas
procedure leerPropiedad(var p: propiedad);
    begin
        write('Precio por metro cuadrado: '); readln(p.precioPorMetro);
        if (p.precioPorMetro <> corte) then begin
            write('Zona: '); readln(p.zona);
            write('Código de propiedad: '); readln(p.codigo);
            write('Tipo de propiedad: '); readln(p.tipo);
            write('Cantidad de metros cuadrados: '); readln(p.cantidadMetros);
        end;
    end;
procedure agregarOrdenado(var l: lista; dato: propiedad);
    var
        nue, act, ant: lista;
    begin
        new(nue);
        nue^.dato:= dato;
        nue^.sig:= nil;
        if (l = nil) then begin
            l:= nue;
        end else begin
            act:= l;
            ant:= l;
            while (act <> nil) and (act^.dato.tipo < nue^.dato.tipo) do begin //Recorrer la lista hasta encontrar el lugar
                ant:= act;
                act:= act^.sig;
            end;
            if (act = l) then begin
                nue^.sig:= l;
                l:= nue;
            end else begin
                ant^.sig:= nue;
                nue^.sig:= act;
            end;
        end;
    end;
procedure cargarVector(var v: vectorZonas);
    var
        p: propiedad;
    begin
        leerPropiedad(p);
        while (p.precioPorMetro <> corte) do begin
            agregarOrdenado(v[p.zona], p); //Agregar elemento de manera ordenada a una de las 5 listas del vector
            writeln;
            leerPropiedad(p);
        end;
    end;
procedure agregarElemento(var l: listaCodigos; dato: integer);
    var
        nue: listaCodigos;
    begin
        new(nue);
        nue^.dato:= dato;
        nue^.sig:= nil;
        if (l <> nil) then
            nue^.sig:= l;
        l:= nue;
    end;
procedure codigosPorZonaTipo(nroZona, tipoPropiedad: integer; v: vectorZonas; var l: listaCodigos);
    begin
        while (v[nroZona] <> nil) do begin
            if (v[nroZona]^.dato.tipo = tipoPropiedad) then //Si el tipo de propiedad del elemento actual de la lista coincide con el pasado, entonces...
                agregarElemento(l, v[nroZona]^.dato.codigo); //Agregarlo a la lista
            v[nroZona]:= v[nroZona]^.sig; //Avanzar al próximo elemento
        end;
    end;
var
    i: integer;
    v: vectorZonas;
    l: listaCodigos;
begin
    //Inicializar listas del vector de zonas
    for i:= 1 to 5 do begin
        v[i]:= nil; //Asignarle nil a cada una
    end;
    //Inicializar lista de códigos de propiedades
    l:= nil;
    
    cargarVector(v);
    codigosPorZonaTipo(1, 10, v, l);
    while (l <> nil) do begin
        write('Código de propiedad: ',l^.dato); 
        writeln;
        l:= l^.sig;
    end;
    //Leerlo - PROBAR
    //for i:= 1 to 5 do begin
    //    writeln('ZONA: ',i);
    //    while (v[i] <> nil) do begin
    //        writeln('Tipo de propiedad: ',v[i]^.dato.tipo);
    //        v[i]:= v[i]^.sig;
    //    end;
    //end;
end.
