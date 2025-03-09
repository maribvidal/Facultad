program parcial;

const
    codigo_corte = 0;

type
  sub_mes = 1..12;
  vectorMes = array [sub_mes] of real;
  compra = record
    monto:real; 
    cliente:integer; 
    mes:sub_mes;
  end;
  contenido = record
    elem: compra;
    meses: vectorMes;
    end;
  arbol = ^nodo;
  nodo = record
    data: contenido;
    HI: arbol;
    HD: arbol;
    end;
    
procedure leerCompra (var c: compra);
begin
  write('Código de cliente: '); readln(c.cliente);
  if (c.cliente <> codigo_corte) then
  begin
    c.monto := random(100) / (random(10) +1);
    c.mes:=random(12) + 1;
  end;
end;
procedure inicializarVector(var vec: vectorMes);
    var
        i: integer;
    begin
        for i:=1 to 12 do begin
            vec[i]:= 0;
        end;
    end;
procedure agregarArbol(var arb: arbol; var cont: contenido);
    begin
        if (arb = nil) then begin
            new(arb);
            arb^.data.elem:= cont.elem;
            inicializarVector(arb^.data.meses);
            arb^.data.meses[cont.elem.mes]:= cont.elem.monto;
            arb^.HI:= nil;
            arb^.HD:= nil;
        end else begin
            if (arb^.data.elem.cliente > cont.elem.cliente) then begin
                agregarArbol(arb^.HI, cont);
            end else if (arb^.data.elem.cliente < cont.elem.cliente) then begin
                agregarArbol(arb^.HD, cont);
            end else begin
                arb^.data.meses[cont.elem.mes]:= arb^.data.meses[cont.elem.mes] + cont.elem.monto;
            end;
        end;
    end;
procedure cargarArbol(var arb: arbol);
    var
        cont: contenido;
    begin
        leerCompra(cont.elem);
        while (cont.elem.cliente <> codigo_corte) do begin
            agregarArbol(arb, cont);
            writeln;
            leerCompra(cont.elem);
        end;
    end;
procedure imprimirArbol(arb: arbol);
    var
        i: integer;
    begin
        if (arb <> nil) then begin
            imprimirArbol(arb^.HI);
            writeln('CÓDIGO DE CLIENTE: ',arb^.data.elem.cliente);
            for i:= 1 to 12 do begin
                writeln('Mes n',i,' tiene un monto de ',arb^.data.meses[i]:2:2);
            end;
            writeln;
            imprimirArbol(arb^.HD);
        end;
    end;
function retornarMesMax_I(vec: vectorMes):integer;
    var
        i, aux: integer;
        gasto: real;
    begin
        aux:= 0;
        gasto:= -1;
        for i:= 1 to 12 do begin
            if (vec[i] > gasto) then begin
                gasto:= vec[i];
                aux:= i;
            end;
        end;
        retornarMesMax_I:= aux;
    end;
function retornarMesMax_R(vec: vectorMes; gasto: real; indice, mes: integer):integer;
    var
        aux: integer;
    begin
        aux:= mes;
        if (indice < 12) then begin
            if (vec[indice] > gasto) then begin
                gasto:= vec[indice];
                mes:= indice;
                writeln('mes: ',indice);
                writeln('gasto: ',gasto);
            end;
            aux:= retornarMesMax_R(vec, gasto, indice + 1, mes);
        end;
        retornarMesMax_R:= aux;
    end;
procedure mayorGasto(arb: arbol; cliente: integer; var mesMax: integer);
    begin
        if (arb <> nil) then begin
            if (arb^.data.elem.cliente > cliente) then begin
                mayorGasto(arb^.HI, cliente, mesMax);
            end else if (arb^.data.elem.cliente < cliente) then begin
                mayorGasto(arb^.HD, cliente, mesMax);
            end else begin
                mesMax:= retornarMesMax_R(arb^.data.meses, -1, 1, 0);
            end;
        end;
    end;
var
    arb: arbol;
    numInput, mesMax: integer;
begin
    arb:= nil;
    mesMax:= 0;
    cargarArbol(arb);
    imprimirArbol(arb);
    write('Ingrese un código de cliente: '); readln(numInput);
    mayorGasto(arb, numInput, mesMax);
    writeln('El mes que mayor monto generó para el cliente ',numInput,' fue el ',mesMax);
end.
