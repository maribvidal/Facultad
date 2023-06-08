program prueba;
const
    corte = -1;
    dimF = 20;
type
    t_rango = 1..20;
    t_rango2 = 0..9999;
    categoria = record
        nombre: string[20];
        precio_kilo: t_rango2;
    end;
    compra = record
        dni: longint;
        categoria: t_rango;
        kilos_comprados: t_rango2;
    end;
    v_categorias = array [t_rango] of categoria;
    v_categorias2 = array [t_rango] of integer;
    lista = ^nodo;
    nodo = record
        data: compra;
        sig: lista;
    end;
function cincoDigitosImpares(dni: longint):boolean;
    var
        impares: integer;
    begin
        impares:= 0;
        while (dni <> 0) do begin
            if ((dni mod 10) mod 2) <> 0 then
                impares:= impares + 1;
            dni:= dni div 10;
        end;
        cincoDigitosImpares:= (impares = 5);
    end;
procedure leerCompra(var c: compra);
    begin
        with c do begin
            write('dni: '); readln(dni);
            if (dni <> corte) then begin
                write('categoria: '); readln(categoria);
                write('kilos comprados: '); readln(kilos_comprados);
            end;
        end;
    end;
procedure agregarNodo(var l: lista; c: compra);
    var
        nuevo: lista;
    begin
        new(nuevo);
        nuevo^.data:= c;
        nuevo^.sig:= nil;
        if (l <> nil) then
            nuevo^.sig:= l;
        l:= nuevo;
    end;
procedure puntoA(var l: lista);
    var
        c: compra;
    begin
        leerCompra(c);
        while (c.dni <> -1) do begin
            agregarNodo(l, c);
            writeln;
            leerCompra(c);
        end;
    end;
procedure puntoB(l: lista; v1: v_categorias; var v2: v_categorias2; var cantEsp: integer; var dniMax: longint);
    var
        i, aux, dineroMax: integer;
    begin
        aux:= 0;
        dineroMax:= -1;
        while (l <> nil) do begin
            //Inciso 1
            aux:= l^.data.kilos_comprados * v1[l^.data.categoria].precio_kilo;
            if (aux > dineroMax) then begin
                dineroMax:= aux;
                dniMax:= l^.data.dni;
            end;
            
            //Inciso 2
            v2[l^.data.categoria]:= v2[l^.data.categoria] + 1;
            
            //Inciso 3
            if (cincoDigitosImpares(l^.data.dni)) then
                cantEsp:= cantEsp + 1;
            l:= l^.sig;
        end;
    end;
var
    l: lista;
    i: integer;
    v1: v_categorias;
    v2: v_categorias2;
    cantEsp: integer;
    dniMax: longint;
begin
    dniMax:= 0;
    cantEsp:= 0;
    for i:= 1 to dimF do begin
        v1[i].nombre:= 'XD';
        v1[i].precio_kilo:= 2;
    end;
    for i:= 1 to dimF do begin
        v2[i]:= 0;
    end;
    l:= nil;
    puntoA(l);
    puntoB(l, v1, v2, cantEsp, dniMax);
    writeln('cant de dni con 5 impares: ', cantEsp);
    writeln('el dni mas grande: ',dniMax);
    for i:= 1 to dimF do begin
        writeln(v2[i]);
    end;
end.
