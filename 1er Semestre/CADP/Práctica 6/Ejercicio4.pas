program Ejercicio4;
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
procedure buscarMaximo(l: lista; var max: integer); //USAR PROCEDURE PORQUE HAY QUE RETONAR EL VALOR DEL ELEMENTO MÁXIMO
    begin
        while (l <> nil) do begin //LISTA DESORDENADA, POR LO TANTO RECORRER TODA
            if (l^.num > max) then begin max:= l^.num; end;
            l:= l^.sig;
        end;
    end;
procedure buscarMinimo(l: lista; var min: integer); //USAR PROCEDURE PORQUE HAY QUE RETONAR EL VALOR DEL ELEMENTO MÍNIMO
    begin
        while (l <> nil) do begin //LISTA DESORDENADA, POR LO TANTO RECORRER TODA
            if (l^.num < min) then begin min:= l^.num; end;
            l:= l^.sig;
        end;
    end;
procedure buscarMultiplos(l: lista; a: integer; var cant_mult: integer); //USAR PROCEDURE PORQUE HAY QUE RETONAR LA CANTIDAD DE MÚLTIPLOS DEL ENTERO A
    begin
        while (l <> nil) do begin //LISTA DESORDENADA, POR LO TANTO RECORRER TODA
            if (l^.num mod a) = 0 then begin //Usar MOD porque los números que dividos por X no dan resto, es porque son MULTIPLOS de ese número
                cant_mult:= cant_mult + 1;
            end;
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
    valor, max, min, cant_mult: integer;
begin
    pri:= nil;
    ult:= nil;
    max:= -1;
    min:= 9999;
    writeln('Ingrese un numero');
    read(valor);
    while (valor <> 0) do begin
        armarNodoAtrasVersionB(pri, ult, valor);
        writeln('Ingrese un numero');
        read(valor);
    end;
    writeln('Recorriendo...');
    recorrerLista(pri);
    writeln('Buscar el MÁXIMO');
    buscarMaximo(pri, max);
    writeln(max);
    writeln('Buscar el MÍNIMO');
    buscarMinimo(pri, min);
    writeln(min);
    writeln('LA CANTIDAD DE MULTIPLOS EN LA LISTA DE 6');
    buscarMultiplos(pri, 6, cant_mult);
    write(cant_mult);
end.
