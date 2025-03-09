program Ejercicio6;
const
    corte = -1;
type
    lista = ^nodo;
    t_categorias = 1..7;
    t_rango = -1..9999;
    objeto = record
        codigo: longint;
        categoria: t_categorias;
        nombre: string[15];
        distancia: longint;
        descubridor: string[20];
        anio: longint;
    end;
    nodo = record
        data: objeto;
        sig: lista;
    end;
    v_cat = array [t_categorias] of integer;
function masDigParQueImpar(codigo: longint):boolean;
var
    pares, impares: integer;
begin
    pares:= 0;
    impares:= 0;
    while (codigo <> 0) do begin
        if (((codigo mod 10) mod 2) = 0) then begin //Revisar si el dígito es par o impar
            pares:= pares + 1;
        end else begin
            impares:= impares + 1;
        end;
        codigo:= codigo div 10;
    end;
    masDigParQueImpar:= (pares > impares);
end;
//1: estrellas, 2: planetas, 3: satélites, 4: galaxias, 5: asteroides, 6: cometas y 7: nebulosas.
procedure leerObjeto(var o: objeto);
begin
    with o do begin
        write('CODIGO: '); readln(codigo);
        if (codigo <> corte) then
        begin
            write('CATEGORÍA: '); readln(categoria);
            write('NOMBRE: '); readln(nombre);
            write('DISTANCIA: '); readln(distancia);
            write('DESCUBRIDOR: '); readln(descubridor);
            write('AÑO: '); readln(anio);
        end;
    end;
end;
//El enunciado dice que "la estructura generada debe mantener el orden en que fueron leídos los datos", por lo tanto, debe usarse el segundo modo
procedure agregarAtras(var pri, ult: lista; o: objeto);
var
    aux: lista;
begin
    new(aux);
    aux^.data:= o;
    aux^.sig:= nil;
    if (pri = nil) then begin
        pri:= aux;
        ult:= aux;
    end else begin
        aux^.sig:= ult;
        ult:= aux;
    end;
end;
procedure cargarLista(var pri, ult: lista);
var
    o: objeto;
begin
    leerObjeto(o);
    while (o.codigo <> corte) do begin
        agregarAtras(pri, ult, o);
        writeln;
        leerObjeto(o);
    end;
end;
procedure actualizarMaximo(codActual, distActual: longint; var cod, dist, cod2, dist2: longint);
begin
    if (distActual > dist) then begin
        dist2:= dist;
        cod2:= cod;
        dist:= distActual;
        cod:= codActual;
    end else if (distActual > dist2) then begin
        dist2:= distActual;
        cod2:= codActual;
    end;
end;
procedure procesarLista(l: lista; var codMax, codMax2, cantEsp: longint; var cat: v_cat);
var
    distMax, distMax2: longint;
begin
    distMax:= -1;
    distMax2:= -1;
    while (l <> nil) do begin
        //Inciso 1 - Obtener el código de los objetos que hayan estado a mayor distancia de la Tierra
        actualizarMaximo(l^.data.codigo, l^.data.distancia, codMax, distMax, codMax2, distMax2);
        
        //Inciso 2 - Los objetos que haya descubierto Galileo antes del año 1600
        if (l^.data.descubridor = 'Galileo Galilei') and (l^.data.anio < 1600) then
            cantEsp:= cantEsp + 1;
            
        //Inciso 3 - Agregar objetos por categoría
        cat[l^.data.categoria]:= cat[l^.data.categoria] + 1;
        
        //Inciso 4 - Imprimir los nombres de las estrellas cuyos códigos de objeto poseen más dígitos pares que impares
        if (masDigParQueImpar(l^.data.codigo)) then
            writeln(l^.data.nombre);
        
        //Avanzar
        l:= l^.sig;
    end;
end;
procedure recorrerInversaLista(l, l2: lista);
var
    aux: lista;
begin
    if (l <> nil) then begin
        writeln(l^.data.codigo);
        while (l <> l2) do begin
            aux:= l2;
            while (aux^.sig <> l) do begin //Buscar el elemento que le precede a L
                aux:= aux^.sig;
            end;
            l:= aux;
            writeln(l^.data.codigo);
        end;
    end;
end;
var
    pri, ult: lista;
    i, codMax, codMax2, cantEsp: longint;
    cat: v_cat;
begin
    pri:= nil;
    ult:= nil;
    //Inicializar vector
    for i:=1 to 7 do begin
        cat[i]:= 0;
    end;
    codMax:= 0;
    codMax2:= 0;
    cantEsp:= 0;
    cargarLista(pri, ult);
    recorrerInversaLista(pri, ult);
    writeln;
    procesarLista(ult, codMax, codMax2, cantEsp, cat);
    writeln('Los códigos de los dos objetos más lejanos de la tierra que se hayan observado: ',codMax,' y ',codMax2);
    writeln('La cantidad de planetas descubiertos por "Galileo Galilei" antes del año 1600: ',cantEsp);
    writeln;
    for i:= 1 to 7 do begin
        writeln('Cantidad de objetos observados en la categoría [',i,']: ',cat[i]);
    end;
end.
