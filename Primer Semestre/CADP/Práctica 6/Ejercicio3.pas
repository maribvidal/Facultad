program Ejercicio3;
type
    lista = ^nodo;
    nodo = record
        num: integer;
        sig: lista;
    end;
procedure armarNodoAtrasVersionA(var L: lista; v: integer); //Se va agregando de ATRÁS
    var
        nuevo, aux: lista;
    begin
        new(nuevo);
        nuevo^.num:= v;
        nuevo^.sig:= nil;
        if (l = nil) then begin //SI LA LISTA ESTÁ VACIA...
            l:= nuevo;
        end else begin
            aux:= l;
            writeln('Hay que recorrer para atrás...');
            while (aux^.sig <> nil) do begin //RECORRER LA LISTA HASTA QUEDAR PARADO EN EL ÚLTIMO NODO
                aux:= aux^.sig;
                writeln('Actualmente estoy en el nodo con el contenido: ',aux^.num);
            end;
            aux^.sig:= nuevo; //MODIFICA EL VALOR DE LA DIRECCIÓN DEL PUNTERO EN LA QUE ESTÁ
        end;
    end;
procedure armarNodoAtrasVersionB(var pri, ult: lista; v: integer); //Ahora hay 2 nodos
    var
        aux: lista;
    begin
        new(aux);
        aux^.num:= v;
        aux^.sig:= nil;
        if (pri = nil) then begin //SI LA LISTA ESTÁ VACIA...
            pri:= aux;
            ult:= aux;
        end else begin
            ult^.sig:= aux;
            ult:= aux;
        end;
    end;
procedure recorrerLista(l: lista);
    begin
        while (l <> nil) do begin
            writeln(l^.num);
            l:= l^.sig;
        end;
    end;
procedure modificarLista(var l: lista; valor: integer); //Punto D
    var
        aux: lista;
    begin
        aux:= l;
        while (l <> nil) do begin
            l^.num:= l^.num + valor;
            l:= l^.sig;
        end;
        l:= aux; //Una vez terminado el proceso, devolverle a L su posición inicial
    end;
var
    pri, ult: lista;
    valor: integer;
begin
    pri:= nil;
    ult:= nil;
    writeln('Ingrese un numero');
    read(valor);
    while (valor <> 0) do begin
        armarNodoAtrasVersionB(pri, ult, valor);
        writeln('Ingrese un numero');
        read(valor);
    end;
    writeln('Recorriendo...');
    recorrerLista(pri);
    writeln('Ingrese un numero');
    read(valor);
    writeln('Modificando lista...');
    modificarLista(pri, valor);
    recorrerLista(pri);
end.
