program Ejercicio8;
type
    t_motivo = 1..7;
    t_dia = 1..31;
    t_mes = 1..11;
    t_hora = 1..24;
    r_fecha = record
        dia: t_dia;
        mes: t_mes;
    end;
    transferencia = record
        nroCuenta: integer;
        dniOrigen: integer;
        nroCuentaD: integer;
        dniDestino: integer;
        fecha: r_fecha;
        hora: t_hora;
        monto: real;
        codigo: t_motivo;
    end;
    vector_motivo = array [t_motivo] of integer;
    lista = ^nodo;
    nodo = record
        data: transferencia;
        sig: lista;
    end;
function menorParQueImpar(nroDestino: integer):boolean;
    var
        pares, impares: integer;
    begin
        pares:= 0;
        impares:= 0;
        while (nroDestino <> 0) do begin
            if ((nroDestino mod 10) mod 2) = 0 then
                pares:= pares + 1
            else
                impares:= impares + 1;
            nroDestino:= nroDestino div 10;
        end;
        menorParQueImpar:= (pares < impares);
    end;
procedure leerFecha(var f: r_fecha);
    begin
        write('Leer día: '); readln(f.dia);
        write('Leer mes: '); readln(f.mes);
    end;
procedure leerTransferencia(var t: transferencia);
    begin
        write('Leer número de cuenta origen: '); readln(t.nroCuenta);
        write('Leer DNI de su titular: '); readln(t.dniOrigen);
        write('Leer número de cuenta destino: '); readln(t.nroCuentaD);
        write('Leer DNI de su titular: '); readln(t.dniDestino);
        leerFecha(t.fecha);
        write('Leer hora de la transacción: '); readln(t.hora);
        write('Leer monto: '); readln(t.monto);
        write('Leer código del motivo: '); readln(t.codigo);
    end;
procedure agregarNodo(var l: lista; t: transferencia); //SE DISPONE
    var
        aux: lista;
    begin
        new(aux);
        aux^.data:= t;
        aux^.sig:= nil;
        if (l <> nil) then
            aux^.sig:= l;
        l:= aux;
    end;
procedure cargarLista(var l: lista); //SE DISPONE
    var
        t: transferencia;
        seguir: integer;
    begin
        seguir:= -1;
        while (seguir <> 0) do begin
            leerTransferencia(t);
            agregarNodo(l, t);
            writeln;
            write('Seguir?: '); readln(seguir);
        end;
    end;
procedure insertarOrdenado(var l: lista; t: transferencia);
    var
        aux, ant, act: lista;
    begin
        new(aux);
        aux^.data:= t;
        aux^.sig:= nil;
        if (l = nil) then begin
            l:= aux;
        end else begin
            ant:= l;
            act:= l;
            while (act <> nil) and (act^.data.nroCuenta < aux^.data.nroCuenta) do begin
                ant:= act;
                act:= act^.sig;
            end;
            if (ant = act) then begin
                aux^.sig:= l;
                l:= aux;
            end else begin
                ant^.sig:= aux;
                aux^.sig:= act;
            end;
        end;
    end;
procedure puntoA(l: lista; var l2: lista);
    var
        condicion: boolean;
    begin
        condicion:= false;
        while (l <> nil) do begin
            condicion:= (l^.data.dniOrigen <> l^.data.dniDestino);
            if (condicion) then
                insertarOrdenado(l2, l^.data);
            l:= l^.sig;
        end;
    end;
procedure puntoB(l2: lista);
    var
        acumulador: real;
        cuentaActual: integer;
    begin
        while (l2 <> nil) do begin
            acumulador:= 0;
            cuentaActual:= l2^.data.nroCuenta;
            while (l2 <> nil) and (cuentaActual = l2^.data.nroCuenta) do begin
                acumulador:= acumulador + l2^.data.monto;
                l2:= l2^.sig;
            end;
            writeln('La cuenta ',cuentaActual,' transfirió un total de ',acumulador:2:2,'$ a terceros');
        end;
    end;
procedure puntoC(l2: lista; var motivoMax: integer);
    var
       v: vector_motivo;
       i, transfMax: integer;
    begin
        transfMax:= -1;
        for i:= 1 to 7 do begin
            v[i]:= 0;
        end;
        while (l2 <> nil) do begin
            v[l2^.data.codigo]:= v[l2^.data.codigo] + 1;
            l2:= l2^.sig;
        end;
        for i:= 1 to 7 do begin
            if (v[i] > transfMax) then begin
                transfMax:= v[i];
                motivoMax:= i;
            end;
        end;
    end;
procedure puntoD(l2: lista; var cantEsp: integer);
    begin
        while (l2 <> nil) do begin
            if (l2^.data.fecha.mes = 6) and (menorParQueImpar(l2^.data.nroCuentaD)) then
                cantEsp:= cantEsp + 1;
            l2:= l2^.sig;
        end;
    end;
var
    l, l2: lista;
    i, motivoMax, cantEsp: integer;
begin
    l:= nil;
    l2:= nil;
    motivoMax:= 0;
    cantEsp:= 0;
    cargarLista(l); //SE DISPONE
    puntoA(l, l2);
    puntoB(l2);
    puntoC(l2, motivoMax);
    puntoD(l2, cantEsp);
    writeln('código de motivo que más transferencias a terceros tuvo: ',motivoMax);
    writeln('cantidad de transferencias a terceros realizadas en el mes de Junio en las cuales el número de cuenta destino posea menos dígitos pares que impares: ',cantEsp);
end.
