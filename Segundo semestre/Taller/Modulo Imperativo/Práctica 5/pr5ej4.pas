program pr5ej4;

const
    codigo_corte = -1;
    
type
    reclamo = record
        codigo: integer;
        DNI: integer;
        ano: integer;
        tipo: integer;
        end;
    listaReclamos = ^nodoReclamo;
    nodoReclamo = record
        data: reclamo;
        sig: listaReclamos;
    end;
    registroCompleto = record
        lis: listaReclamos;
        DNI: integer;
        cantTotal: integer;
    end;
    arbol = ^nodoArbol;
    nodoArbol = record
        elem: registroCompleto;
        HI: arbol;
        HD: arbol;
    end;
    listaCodigos = ^nodoCodigos;
    nodoCodigos = record
        num: integer;
        sig: listaCodigos;
    end;
procedure imprimirListaRec(l: listaReclamos);
    begin
        while (l <> nil) do begin
            writeln('Código: ',l^.data.codigo,' / Año: ',l^.data.ano,' / Tipo: ',l^.data.tipo);
            l:= l^.sig;
        end;
    end;
procedure leerReclamo(var rec: reclamo);
    begin
        write('Introducir código >'); readln(rec.codigo);
        if (rec.codigo <> codigo_corte) then begin
            rec.DNI:= Random(15) + 1; writeln('DNI generado >',rec.DNI);
            rec.ano:= Random(50) + 2000; writeln('Año generado >',rec.ano);
            rec.tipo:= Random(10) + 1; writeln('Tipo de reclamo generado >',rec.tipo);
        end;
    end;
procedure agregarNodo(var l: listaReclamos; rec: reclamo);
    var
        aux: listaReclamos;
    begin
        new(aux);
        aux^.data:= rec;
        aux^.sig:= l;
        l:= aux;
    end;
procedure agregarArbol(var arb: arbol; rec: reclamo);
    begin
        if (arb = nil) then begin
            new(arb);
            arb^.elem.lis:= nil;
            agregarNodo(arb^.elem.lis, rec);
            arb^.elem.DNI:= rec.dni;
            arb^.elem.cantTotal:= 1;
            arb^.HI:= nil;
            arb^.HD:= nil;
        end else begin
            if (arb^.elem.dni > rec.dni) then begin
                agregarArbol(arb^.HI, rec);
            end else if (arb^.elem.dni < rec.dni) then begin
                agregarArbol(arb^.HD, rec);
            end else begin
                agregarNodo(arb^.elem.lis, rec);
                writeln('Nodo agregado');
                arb^.elem.cantTotal:= arb^.elem.cantTotal + 1;
            end;
        end;
    end;
procedure cargarArbol(var arb: arbol);
    var
        rec: reclamo;
    begin
        leerReclamo(rec);
        while (rec.codigo <> codigo_corte) do begin
            agregarArbol(arb, rec);
            writeln;
            leerReclamo(rec);
        end;
    end;
//Punto B
procedure reclamosDNI(arb: arbol; DNI: integer; var cant: integer);
    begin
        if (arb <> nil) then begin
            if (arb^.elem.DNI > DNI) then begin
                reclamosDNI(arb^.HI, DNI, cant);
            end else if (arb^.elem.DNI < DNI) then begin
                reclamosDNI(arb^.HD, DNI, cant);
            end else begin
                cant:= arb^.elem.cantTotal;
            end;
        end;
    end;
//Punto C
procedure dniEntre(arb: arbol; inf, sup: integer; var cont: integer);
    begin
        if (arb <> nil) then begin
            if (arb^.elem.dni >= inf) then begin
                if (arb^.elem.dni <= sup) then begin
                    writeln('Cantidad total del nodo: ',arb^.elem.cantTotal);
                    cont:= cont + arb^.elem.cantTotal;
                    writeln('Cont actualizado: ',cont);
                    dniEntre(arb^.HI, inf, sup, cont);
                    dniEntre(arb^.HD, inf, sup, cont);
                end else begin
                    dniEntre(arb^.HI, inf, sup, cont);
                end;
            end else begin
                dniEntre(arb^.HD, inf, sup, cont);
            end;
        end;
    end;
//Punto D
procedure agregarNodoCodigo(var l: listaCodigos; num: integer);
    var
        aux: listaCodigos;
    begin
        new(aux);
        aux^.num:= num;
        aux^.sig:= l;
        l:= aux;
    end;
procedure codigosAno(arb: arbol; ano: integer; var l: listaCodigos);
    begin
        if (arb <> nil) then begin //No hay búsqueda eficiente :'c
            while (arb^.elem.lis <> nil) do begin
                if (arb^.elem.lis^.data.ano = ano) then
                    agregarNodoCodigo(l, arb^.elem.lis^.data.codigo);
                arb^.elem.lis:= arb^.elem.lis^.sig;
            end;
            codigosAno(arb^.HI, ano, l);
            codigosAno(arb^.HD, ano, l);
        end;
    end;
procedure imprimirLista(l: listaCodigos);
    begin
        while (l <> nil) do begin
            writeln('Código: ',l^.num);
            l:= l^.sig;
        end;
    end;
procedure imprimirArbol(arb: arbol);
    begin
        if (arb <> nil) then begin
            imprimirArbol(arb^.HI);
            writeln('DNI: ',arb^.elem.DNI);
            imprimirListaRec(arb^.elem.lis);
            writeln;
            imprimirArbol(arb^.HD);
        end;
    end;
//Programa principal
var
    arb: arbol;
    listaCod: listaCodigos;
    numInput, numInput2, cont: integer;
begin
    arb:= nil;
    listaCod:= nil;
    numInput:= 0;
    numInput2:= 0;
    cont:= 0;
    Randomize;
    cargarArbol(arb);
    imprimirArbol(arb);
    write('Ingrese un DNI: '); readln(numInput);
    reclamosDNI(arb, numInput, cont);
    writeln('El DNI ',numInput,' hizo ',cont,' reclamos');
    write('Ingrese DNI inferior: '); readln(numInput);
    write('Ingrese DNI superior: '); readln(numInput2);
    cont:= 0;
    dniEntre(arb, numInput, numInput2, cont);
    writeln('Entre el DNI ',numInput,' y el ',numInput2,' se hicieron ',cont,' reclamos');
    write('Ingrese un año: '); readln(numInput);
    codigosAno(arb, numInput, listaCod);
    writeln('LISTA CON LOS CÓDIGOS DE LOS RECLAMOS HECHOS EN EL AÑO ',numInput);
    imprimirLista(listaCod);
end.
