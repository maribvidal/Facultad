//A - El programa va agregando elementos a una lista hasta que se ingrese el valor 0
//B - 48 > 13 > 21 > 10 (porque en el procedimiento, al NODO ingresado se le asigna el lugar SIGUIENTE del NODO que está armando el procedimiento)
program Ejercicio1;
type
    lista = ^nodo;
    nodo = record
        num: integer;
        sig: lista;
    end;
procedure armarNodo(var L: lista; v: integer); //Se va agregando de atrás
    var
        aux: lista;
    begin
        new(aux);
        aux^.num:= v;
        aux^.sig:= L;
        L:= aux;
    end;
procedure recorrerLista(l: lista); //Punto C
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
    pri: lista;
    valor: integer;
begin
    pri:= nil;
    writeln('Ingrese un numero');
    read(valor);
    while (valor <> 0) do begin
        armarNodo(pri, valor);
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
