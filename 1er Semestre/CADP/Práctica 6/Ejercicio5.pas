program Ejercicio5;
const
    codigo_corte = -1;
type
    lista = ^nodo;
    producto = record
        codigo: longint;
        descripcion: string;
        stock_actual: integer;
        stock_minimo: integer;
        precio: real;
    end;
    nodo = record
        data: producto;
        sig: lista;
    end;
procedure leerProducto(var p: producto);
    begin
        write('CÓDIGO >'); readln(p.codigo);
        if (p.codigo <> codigo_corte) then begin //Si el código ES DIFERENTE de -1...
            write('DESCRIPCIÓN >'); readln(p.descripcion);
            write('STOCK ACTUAL >'); readln(p.stock_actual);
            write('STOCK MÍNIMO >'); readln(p.stock_minimo);
            write('PRECIO >'); readln(p.precio);
        end;
    end;
procedure crearNodo(var nodo: lista);
    begin
        nodo:= nil;
    end;
procedure agregarNodo(var l: lista; v: producto); //Agregar de adelante
    var
        aux: lista;
    begin
        new(aux); //Crear nueva dirección de memoria
        aux^.data:= v; //Asignarle al nodo auxiliar el registro ingresado
        aux^.sig:= nil; //Asignarle al 'siguiente' del nodo auxiliar NIL
        if (l = nil) then begin
            l:= aux;
        end else begin
            aux^.sig:= l;
            l:= aux; //Asignarle a L el nodo auxiliar, y de esta forma el nodo L va a tener el registro cargado, la dirección de memoria creada adentro, y el siguiente va a ser L
        end;
    end;
procedure cargarLista(var l: lista);
    var
        p: producto;
    begin
        leerProducto(p);
        while (p.codigo <> codigo_corte) do begin
            agregarNodo(l, p);
            writeln('PRODUCTO LEIDO');
            writeln;
            leerProducto(p);
        end;
    end;
function puntoA(l: lista):real;
    var
        cant_total: integer;
        cant_especial: integer;
    begin
        cant_total:= 0;
        cant_especial:= 0;
        while (l <> nil) do begin //Recorrer la lista
            cant_total:= cant_total + 1; //Cantidad total de elementos de la lista
            if (l^.data.stock_actual < l^.data.stock_minimo) then begin //Si el producto actual posee un STOCK ACTUAL menor que el STOCK MÍNIMO que debería tener...
                cant_especial:= cant_especial + 1;
            end;
            l:= l^.sig;
        end;
        puntoA:= (cant_especial / cant_total) * 100;
    end;
function digitosPar(n: integer):longint;
    var
        aux: longint;
    begin
        aux:= 0; //Inicializar en 0 por si el WHILE no se hace para devolver algo
        while (n <> 0) do begin
            if ((n mod 2) = 0) then begin aux:= aux + 1; end;
            n:= n div 10;
        end;
        digitosPar:= aux;
    end;
procedure puntoB(l: lista);
    begin
        while (l <> nil) do begin //Recorrer la lista hasta el último elemento
            if (digitosPar(l^.data.codigo) >= 3) then begin
                writeln(l^.data.descripcion);
            end;
            l:= l^.sig; //Pasar al siguiente elemento
        end;
    end;
procedure puntoC(l: lista; var codigo1, codigo2: longint);
    var
        precio1, precio2: real;
    begin
        precio1:= 9999;
        precio2:= 9999;
        while (l <> nil) do begin //Recorrer la lista
            if (l^.data.precio < precio1) then begin //Buscar mínimos
                precio2:= precio1;
                codigo2:= codigo1;
                precio1:= l^.data.precio;
                codigo1:= l^.data.codigo;
            end else begin
                precio2:= l^.data.precio;
                codigo2:= l^.data.codigo;
            end;
            l:= l^.sig; //Pasar al siguiente elemento
        end;
    end;
var
    l: lista;
    codigo1, codigo2: longint;
begin
    codigo1:= 0;
    codigo2:= 0;
    crearNodo(l);
    cargarLista(l);
    writeln('El porcentaje de productos con stock actual por debajo de su stock mínimo es de ',puntoA(l):2:2,'%');
    puntoB(l);
    puntoC(l, codigo1, codigo2);
    writeln('Los codigos de los productos con precios mas económicos son ',codigo1,' y ',codigo2);
end.
