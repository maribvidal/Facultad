program ej3pr2;
const
    CORTE = 0;
type
    lista = ^nodo;
    nodo = record
        num: integer;
        sig: lista;
    end;
procedure agregarElemento(var l: lista; num: integer);
    var
        aux: lista;
    begin
        new(aux);
        aux^.num:= num;
        aux^.sig:= l;
        l:= aux;
    end;
procedure generarListaNum(var l: lista);
    var
        num: integer;
    begin
        num:= Random(100); //Generar un número random estrictamente menor a 100
        if (num <> CORTE) then begin
            agregarElemento(l, num);
            generarListaNum(l);
        end;
    end;
procedure buscarValorMin(l: lista; var valor: integer);
    begin
        if (l <> nil) then begin //Comprobar si no se llegó al final de la lista
            if (l^.num < valor) then //Si el valor del elemento actual es menor al VALOR pasado
                valor:= l^.num; //Cambiarlo
            l:= l^.sig; //Avanzar al próximo elemento
            buscarValorMin(l, valor); //Hacer nuevamente la comparación
        end;
    end;
procedure buscarValorMax(l: lista; var valor: integer);
    begin
        if (l <> nil) then begin //Comprobar si no se llegó al final de la lista
            if (l^.num > valor) then //Si el valor del elemento actual es mayor al VALOR pasado
                valor:= l^.num; //Cambiarlo
            l:= l^.sig; //Avanzar al próximo elemento
            buscarValorMax(l, valor); //Hacer nuevamente la comparación
        end;
    end;
procedure seEncuentraValor(l: lista; valor: integer; var verificar: boolean);
    begin
        if (l <> nil) and not (verificar) then begin //Comprobar si no se llegó al final de la lista Y si no se encontró el valor
            if (l^.num = valor) then
                verificar:= true;
            if not (verificar) then begin //Si no se encontró el valor...
                l:= l^.sig; //Avanzar al próximo elemento
                seEncuentraValor(l, valor, verificar);
            end;
        end;
    end;
procedure leerLista(l: lista);
    begin
        while (l <> nil) do begin
            writeln('Número: ', l^.num);
            l:= l^.sig;
        end;
    end;
var
    l: lista;
    valorMin, valorMax, valorBuscar: integer;
    verificar: boolean;
begin
    valorMin:= 100; //Inicializarlo en el tope
    valorMax:= -1;
    valorBuscar:= Random(50);
    verificar:= false;
    l:= nil;
    Randomize; //Randomizar los números de los algoritmos
    generarListaNum(l); //MÓDULO A
    leerLista(l);
    buscarValorMin(l, valorMin); //MÓDULO B
    writeln('Valor mas bajo: ', valorMin);
    buscarValorMax(l, valorMax); //MÓDULO C
    writeln('Valor mas alto: ', valorMax);
    seEncuentraValor(l, valorBuscar, verificar); //MÓDULO D
    if (verificar) then
        write('SE ENCONTRÓ EL VALOR ',valorBuscar);
end.
