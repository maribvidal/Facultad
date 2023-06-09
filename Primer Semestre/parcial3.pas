program Parcial;
type
    lista = ^nodo; //Se encuentra ordenada por DNI del cliente
    t_categorias = 1..26;
    str20 = string[20];
    categoria = record
        nombre: str20;
        precio_kilo: integer;
    end;
    v_categorias = array [t_categorias] of categoria;
    v_montos = array [t_categorias] of real;
    compra = record
        DNI: integer;
        categoria: t_categorias;
        cantKilos: integer;
    end;
    nodo = record
        data: compra;
        sig: lista;
    end;
//LOS SIGUIENTES MÓDULOS SE DISPONEN
procedure leerCompra(var c1: compra);
    begin
        write('DNI del cliente: '); readln(c1.DNI);
        write('Categoría de la compra: '); readln(c1.categoria);
        write('Cantidad de kilos comprados: '); readln(c1.cantKilos);
    end;
procedure agregarNodo(var l: lista; c1: compra);
    var
        aux: lista;
    begin
        new(aux);
        aux^.data:= c1;
        aux^.sig:= nil;
        if (l = nil) then begin
            l:= aux;
        end else begin
            aux^.sig:= l;
            l:= aux;
        end;
    end;
procedure cargarLista(var l: lista);
    var 
        c1: compra;
        seguir: integer;
    begin
        seguir:= -1;
        while (seguir <> 0) do begin
            leerCompra(c1);
            agregarNodo(l, c1);
            write('¿Seguir? (0/1): '); readln(seguir);
        end;
    end;
procedure leerCategoria(var c2: categoria);
    begin
        write('Nombre de la categoría: '); readln(c2.nombre);
        write('Precio por kilo: '); readln(c2.precio_kilo);
    end;
procedure cargarVector(var v: v_categorias);
    var
        c2: categoria;
        i: integer;
    begin
        for i:= 1 to 10 do begin
            leerCategoria(c2);
            v[i]:= c2;
        end;
    end;
procedure inicializarVector(var v2: v_montos);
    var
        i: integer;
    begin
        for i:= 1 to 26 do begin
            v2[i]:= 0;
        end;
    end;
procedure actualizarMaximo(dniActual, comprasActual: integer; var dniMax, comprasMax: integer);
    begin
        if (comprasActual > comprasMax) then begin
            comprasMax:= comprasActual;
            dniMax:= dniActual;
        end;
    end;
procedure puntoB(l: lista; v1: v_categorias; var v2: v_montos; var dniMax: integer);
    var
        i, comprasActual, comprasMax, dniActual: integer;
    begin
        comprasMax:= -1;
        while (l <> nil) do begin
            dniActual:= l^.data.DNI;
            comprasActual:= 0;
            while (l <> nil) and (l^.data.DNI = dniActual) do begin
                comprasActual:= comprasActual + 1;
                v2[l^.data.categoria]:= v2[l^.data.categoria] + (l^.data.cantKilos * v1[l^.data.categoria].precio_kilo); //Inciso 2
                l:= l^.sig;
            end;
            actualizarMaximo(dniActual, comprasActual, dniMax, comprasMax); //Inciso 1
        end;
    end;
var
    v1: v_categorias;
    v2: v_montos;
    l: lista;
    i, dniMax: integer;
begin
    l:= nil;
    cargarVector(v1);
    inicializarVector(v2);
    cargarLista(l); //SE DISPONE
    puntoB(l, v1, v2, dniMax);
    
    //LECTURA DE LA INFORMACIÓN
    writeln('DNI del cliente que mas compras ha realizado: ', dniMax);
    writeln;
    for i:= 1 to 26 do begin
        writeln('Monto total recaudado en la categoría ',i,': ', v2[i]:2:2);
    end;
end.
