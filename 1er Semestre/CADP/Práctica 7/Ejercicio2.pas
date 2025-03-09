program Ejercicio2;
const
    codigo_corte = 1122;
type
    lista = ^nodo;
    r_int = 0..9999;
    r_poliza = 1..6;
    cliente = record
        codigo_cliente: r_int;
        dni: longint;
        apellido: string[10];
        nombre: string[10];
        codigo_poliza: r_poliza; //POLIZA CONTRATADA (DEL 1 AL 6)
        monto: real;
    end;
    nodo = record
        data: cliente;
        sig: lista;
    end;
    v_poliza = array [r_poliza] of integer;
    //La empresa dispone de una tabla donde guarda un valor que representa un monto adicional que el cliente debe abonar en la liquidación mensual de su seguro, de acuerdo al código de póliza que tiene contratada.
procedure leerCliente(var c: cliente);
    begin
        with c do begin
            write('Codigo del cliente: '); readln(codigo_cliente);
            if (codigo_cliente <> codigo_corte) then begin
                write('DNI: '); readln(dni);
                write('Apellido: '); readln(apellido);
                write('Nombre: '); readln(nombre);
                write('Codigo poliza: '); readln(codigo_poliza);
                write('Monto: '); readln(monto);
            end;
        end;
    end;
function contarDigitosNueve(num: integer):integer;
    var
        aux: integer;
    begin
        aux:= 0;
        while (num <> 0) do begin
            if ((num mod 10) = 9) then begin
                aux:= aux + 1;
            end;
            num:= num div 10;
        end;
        contarDigitosNueve:= aux;
    end;
procedure agregarNodo(var l: lista; c: cliente);
    var
        aux: lista;
    begin
        new(aux);
        aux^.data:= c;
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
        c: cliente;
    begin
        leerCliente(c);
        while (c.codigo_cliente <> codigo_corte) do begin
            agregarNodo(l, c);
            writeln;
            leerCliente(c);
        end;
    end;
procedure eliminarNodo(var l: lista; c: integer);
    var
        ant, act: lista;
    begin
        ant:= l;
        act:= l;
        while (act <> nil) and (act^.data.codigo_cliente <> c) do begin
            ant:= act;
            act:= act^.sig;
        end;
        if (act = l) then begin
            l:= l^.sig;
        end else begin
            ant^.sig:= act^.sig;
        end;
        dispose(act);
    end;
procedure procesarLista(l: lista); //Este procedure usa el Vector de los codigos poliza
    begin
        while (l <> nil) do begin
            //Punto A
            writeln(l^.data.dni);
            write(' '+l^.data.apellido);
            write(' '+l^.data.nombre);
            write(l^.data.dni);
            write(l^.data.monto:2:1); // + v1[l^.data.codigo_poliza]
            
            //Punto B
            if (contarDigitosNueve(l^.data.dni) >= 2) then begin
                write(' / '+'Su DNI contiene al menos dos dígitos 9');
            end;
            
            //Siguiente
            l:= l^.sig;
        end;
    end;
var
    l: lista;
    v1: v_poliza; //SE DISPONE DE LOS VALORES DE LIQUIDACIÒN POR CÒDIGO DE POLIZA
begin
    l:= nil;
    cargarLista(l);
    //SE DISPONE
    procesarLista(l);
    eliminarNodo(l, 120) //SEGURO EXISTE EL CÒDIGO
end.
