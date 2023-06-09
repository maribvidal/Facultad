program Ejercicio10;
const
    codigo_corte = -1;
    cultivo_corte = 0;
    dimF = 20;
type
    str20 = string[20];
    cultivo = record
        tipo: str20;
        hect: integer;
        meses: integer;
    end;
    vector_cultivos = array [1..dimF] of cultivo;
    empresa = record
        codigo: integer;
        nombre: str20;
        tipo: str20;
        ciudad_radicada: str20;
        cultivos: vector_cultivos;
        dimL: integer;
    end;
    lista = ^nodo;
    nodo = record
        data: empresa;
        sig: lista;
    end;
procedure leerCultivo(var c: cultivo);
    begin
        write('Cantidad de hectareas dedicadas: '); readln(c.hect);
        if (c.hect <> cultivo_corte) then begin
            write('Tipo de cultivo: '); readln(c.tipo);
            write('Cantidad de meses: '); readln(c.meses);
        end;
    end;
procedure leerEmpresa(var e: empresa);
    var
        c: cultivo;
        i: integer;
    begin
        write('Código de empresa: '); readln(e.codigo);
        if (e.codigo <> codigo_corte) then begin
            write('Nombre de la empresa: '); readln(e.nombre);
            write('¿La empresa es ESTATAL o PRIVADA?: '); readln(e.tipo);
            write('Nombre de la ciudad donde está radicada: '); readln(e.ciudad_radicada);
            leerCultivo(c);
            i:= 1;
            while (i <= dimF) and (c.hect <> cultivo_corte) do begin
                e.cultivos[i]:= c;
                leerCultivo(c);
                e.dimL:= e.dimL + 1;
                i:= i + 1;
            end;
        end;
    end;
procedure agregarNodo(var l: lista; e: empresa);
    var
        aux: lista;
    begin
        new(aux);
        aux^.data:= e;
        aux^.sig:= nil;
        if (l <> nil) then
            aux^.sig:= l;
        l:= aux;
    end;
procedure cargarLista(var l: lista);
    var
        e: empresa;
    begin
        leerEmpresa(e);
        while (e.codigo <> codigo_corte) do begin
            agregarNodo(l, e);
            writeln;
            leerEmpresa(e);
        end;
    end;
function poseeDosCeros(codigo: integer):boolean;
    var
        ceros: integer;
    begin
        ceros:= 0;
        while (codigo <> 0) do begin
            if ((codigo mod 10) = 0) then
                ceros:= ceros + 1;
        end;
        poseeDosCeros:= (ceros = 2);
    end;
//b. Nombres de las empresas radicadas en “San Miguel del Monte” que cultivan trigo y cuyo código de empresa posee al menos dos ceros.
procedure puntoB(l: lista);
    var
        condicion: boolean;
        i: integer;
    begin
        while (l <> nil) do begin
            condicion:= false;
            for i:= 1 to l^.data.dimL do begin
                if (l^.data.cultivos[i].tipo = 'trigo') then
                    condicion:= true;
            end;
            if (l^.data.ciudad_radicada = 'San Miguel del Monte') and (poseeDosCeros(l^.data.codigo)) and (condicion) then
                writeln(l^.data.nombre);
            l:= l^.sig;
        end;
    end;
//La cantidad de hectáreas dedicadas al cultivo de soja y qué porcentaje representa con respecto al total de hectáreas
procedure puntoC(l: lista);
    var
        i, hectSoja, hectTotal: integer;
    begin
        hectSoja:= 0;
        hectTotal:= 0;
        while (l <> nil) do begin
            for i:= 1 to l^.data.dimL do begin
                if (l^.data.cultivos[i].tipo = 'soja') then
                    hectSoja:= hectSoja + l^.data.cultivos[i].hect;
                hectTotal:= hectTotal + l^.data.cultivos[i].hect;
            end;
            l:= l^.sig;
        end;
        writeln('qué porcentaje representa con respecto al total de hectáreas: ',((hectSoja/hectTotal)*100):2:2,'% de ',hectTotal);
    end;
//La empresa que dedica más tiempo al cultivo de maíz
procedure puntoD(l: lista);
    var
        empresaActual, empresaMax: str20;
        i, tiempoActual, tiempoMax: integer;
    begin
        empresaMax:= '';
        tiempoMax:= -1;
        while (l <> nil) do begin
            empresaActual:= l^.data.nombre;
            tiempoActual:= 0;
            for i:= 1 to l^.data.dimL do begin
                if (l^.data.cultivos[i].tipo = 'maiz') then
                    tiempoActual:= tiempoActual + l^.data.cultivos[i].meses;
            end;
            if (tiempoActual > tiempoMax) then begin
                tiempoMax:= tiempoActual;
                empresaMax:= empresaActual;
            end;
            l:= l^.sig;
        end;
        writeln('La empresa que dedica más tiempo al cultivo de maíz: ',empresaMax);
    end;
//Realizar un módulo que incremente en un mes los tiempos de cultivos de girasol de menos de 5 hectáreas de todas las empresas que no son estatales.
procedure puntoE(l: lista);
    var
        i: integer;
    begin
        while (l <> nil) do begin
            for i:= 1 to l^.data.dimL do begin
                if (l^.data.tipo = 'PRIVADA') and (l^.data.cultivos[i].tipo = 'girasol') and (l^.data.cultivos[i].hect < 5) then
                    l^.data.cultivos[i].meses:= l^.data.cultivos[i].meses + 1;
                writeln('TIEMPO AUMENTADO: de ',l^.data.cultivos[i].meses-1,' a ',l^.data.cultivos[i].meses);
            end;
            l:= l^.sig;
        end;   
    end;
var
    l: lista;
begin
    //Tenía paja y no pasé ninguna variable al programa principal, está todo informado desde los respectivos módulos XD
    l:= nil;
    cargarLista(l);
    puntoB(l);
    puntoC(l);
    puntoD(l);
    puntoE(l);
end.
