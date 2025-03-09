program Ejercicio9;
type
    lista = ^nodo;
    nodo = record
        num: integer;
        sig: lista;
    end;
procedure agregarNodo(var L: lista; v: integer); //Se va agregando de atrás
    var
        aux: lista;
    begin
        new(aux);
        aux^.num:= v;
        aux^.sig:= nil;
        if (L = nil) then begin
            L:= aux;
        end else begin
            aux^.sig:= l;
            L:= aux;
        end;
    end;
procedure recorrerLista(l: lista); //Punto C
    begin
        while (l <> nil) do begin
            writeln(l^.num);
            l:= l^.sig;
        end;
    end;
function existeEnLaLista(l: lista; v: integer):boolean;
    var
        condicion: boolean;
    begin
        condicion:= false;
        while (l <> nil) and (not condicion) do begin
            if (l^.num = v) then begin condicion:= true; end;
            l:= l^.sig;
        end;
        existeEnLaLista:= condicion;
    end;
function estaOrdenada(l: lista):boolean;
    var
        condicion: boolean;
        valorActual: integer;
    begin
        valorActual:= l^.num;
        condicion:= true;
        if (l^.sig <> nil) then begin l:= l^.sig; end;
        while (l <> nil) and (condicion) do begin
            writeln(valorActual,' ',l^.num);
            condicion:= (valorActual > l^.num); //Con detectar un caso en el que no se encuentre ordenada, la lectura se detiene
            if (condicion) then begin valorActual:= l^.num; end;
            l:= l^.sig;
        end;
        estaOrdenada:= condicion;
    end;
procedure eliminarElemento(var l: lista; valor: integer);
    var
        ant, act: lista;
    begin
        act:= l;
        if (existeEnLaLista(l, valor)) then begin
            while (act <> nil) and (act^.num <> valor) do begin
                ant:= act;
                act:= act^.sig;
            end;
            if (act = l) then begin
                l:= l^.sig;
            end else begin
                ant^.sig:= act^.sig;
                dispose(act);
                act:= ant;
            end;
        end;
    end;
procedure sumarLista(l: lista; valor: integer);
    begin
        while (l <> nil) do begin
            l^.num:= l^.num + valor;
            l:= l^.sig;
        end;
    end;
procedure sublista(l: lista; var l2: lista; valorA, valorB: integer);
    begin
        while (l <> nil) do begin
            if (l^.num > valorA) and (l^.num < valorB) then begin
                agregarNodo(l2, l^.num);
            end;
            l:= l^.sig;
        end;
    end;
procedure insertarNodo(var l: lista; v: integer);
    var
        nuevo, ant, act: lista;
    begin
        new(nuevo);
        nuevo^.num:= v;
        nuevo^.sig:= nil;
        if (l = nil) then begin
            l:= nuevo;
        end else begin
            act:= l;
            ant:= l;
            while (act <> nil) and (act^.num > nuevo^.num) do begin //Descendente
                ant:= act;
                act:= act^.sig;
            end;
            if (act = l) then begin
                nuevo^.sig:= l;
                l:= nuevo;
            end else begin
                ant^.sig:= nuevo;
                nuevo^.sig:= act;
            end;
        end;
    end;
procedure sublistaB(l: lista; var l2: lista; valorA, valorB: integer);
    begin
        while (l <> nil) do begin
            if (l^.num > valorA) and (l^.num < valorB) then begin
                insertarNodo(l2, l^.num);
            end;
            l:= l^.sig;
        end;
    end;
var
    pri, seg: lista;
    valor: integer;
begin
    pri:= nil;
    seg:= nil;
    writeln('Ingrese un numero');
    read(valor);
    while (valor <> 0) do begin
        agregarNodo(pri, valor);
        writeln('Ingrese un numero');
        read(valor);
    end;
    writeln('Recorriendo...');
    recorrerLista(pri);
    writeln(estaOrdenada(pri));
    eliminarElemento(pri, 30);
    eliminarElemento(pri, 24);
    recorrerLista(pri);
    writeln;
    sublistaB(pri, seg, 10, 40);
    recorrerLista(seg);
end.
