program pr5ej2;

type
    t_ano = 2010..2018;
    str10 = string[10];
    auto = record
        patente: integer;
        anoFabricacion: t_ano;
        marca: str10;
        modelo: str10;
    end;
    arbolPatente = ^nodoPatente;
    nodoPatente = record
        data: auto;
        HI: arbolPatente;
        HD: arbolPatente;
    end;
    listaMarcas = ^nodoListaMarca;
    nodoListaMarca = record
        data: auto;
        sig: listaMarcas;
    end;
    arbolMarca = ^nodoMarca;
    nodoMarca = record
        data: listaMarcas;
        marca: str10; //Para identificar la lista
        HI: arbolMarca;
        HD: arbolMarca;
    end;
procedure leerAuto(var aut: auto);
    begin
        write('Patente del auto: '); readln(aut.patente);
        write('Año de fabricación: '); readln(aut.anoFabricacion);
        write('Marca: '); readln(aut.marca);
        write('Modelo: '); readln(aut.modelo);
    end;
procedure agregarArbol_1(var a1: arbolPatente; aut: auto);
    begin
        if (a1 = nil) then begin
            new(a1);
            a1^.data:= aut;
            a1^.HI:= nil;
            a1^.HD:= nil;
        end else begin
            if (a1^.data.patente >= aut.patente) then
                agregarArbol_1(a1^.HD, aut)
            else
                agregarArbol_1(a1^.HI, aut);
        end;
    end;
procedure agregarNodo_2(var l: listaMarcas; aut: auto);
    var
        aux: listaMarcas;
    begin
        new(aux);
        aux^.data:= aut;
        aux^.sig:= l;
        l:= aux;
    end;
procedure agregarArbol_2(var a2: arbolMarca; aut: auto);
    begin
        if (a2 = nil) then begin
            new(a2);
            a2^.marca:= aut.marca;
            a2^.data:= nil;
            agregarNodo_2(a2^.data, aut);
            a2^.HI:= nil;
            a2^.HD:= nil;
        end else begin
            if (a2^.data.marca >= aut.marca) then //Ordenar por texto (?
                agregarArbol_2(a2^.HD, aut)
            else
                agregarArbol_2(a2^.HI, aut);
        end;
    end;
procedure cargarArboles(var a1: arbolPatente; var a2: arbolMarca);
    var
        aut: auto;
        texto: str10;
    begin
        texto:= '';
        write('¿Ingresar un elemento? (si/no): '); readln(texto);
        while (texto <> 'no') do begin
            leerAuto(aut);
            agregarArbol_1(a1, aut);
            agregarArbol_2(a2, aut);
            writeln;
            write('¿Ingresar un elemento? (si/no): '); readln(texto);
        end;
    end;
begin
end.
