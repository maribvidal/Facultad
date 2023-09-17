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
    
procedure leerReclamo(var rec: reclamo);
    begin
        write('Introducir código >'); readln(rec.codigo);
        if (rec.codigo <> codigo_corte) then begin
            rec.DNI:= Random(100) + 1; writeln('DNI generado >',rec.DNI);
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
        if (arb <> nil) then begin
            new(arb);
            arb^.elem.lis:= nil;
            arb^.elem.DNI:= rec.dni;
            arb^.elem.cantTotal:= 1;
            arb^.HI:= nil;
            arb^.HD:= nil;
        end else begin
            if (arb^.elem.dni > rec.dni) then
                agregarArbol(arb^.HI, rec)
            else
                agregarArbol(arb^.HD, rec);
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
function reclamosCont(l: listaReclamos):integer;
    var
        contador: integer;
    begin
        contador:= 0;
        if (l <> nil) then begin
            contador:= contador + 1;
            contador:= contador + reclamosCont(l^.sig);
        end;
        reclamosCont:= contador;
    end;
function reclamosDNI(arb: arbol; DNI: integer):integer;
    var
        cant: integer;
    begin
        cant:= 0;
        if (arb <> nil) then begin
            if (arb^.elem.DNI < DNI) then begin
                reclamosDNI(arb^.HI, DNI)   
            end else if (arb^.elem.DNI > DNI) then begin
                reclamosDNI(arb^.HD, DNI);
            end else begin
                cant:= reclamosCon(arb^.elem.lis);
            end;
        end;
        reclamosDNI:= cant;
    end;
//Punto C
procedure dniEntre(arb: arbol; inf, sup: integer; var cont: integer);
//Programa principal
var

begin
    Randomize;

end.
