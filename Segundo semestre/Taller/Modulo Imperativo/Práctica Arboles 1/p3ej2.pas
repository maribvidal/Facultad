//b. Implemente un módulo que reciba el árbol generado en i. y un código de producto y retorne
//la cantidad total de unidades vendidas de ese producto.

program ej2pr3;
const
    corte = 0;
type
    venta = record
        codigo: integer;
        fecha: string[12];
        unidades: integer; //Unidades vendidas
    end;
    arbol = ^nodo;
    nodo = record
        data: venta;
        HI: arbol; //Hijo zurdo
        HD: arbol; //Hijo de derecha
    end;
procedure leerVenta(var ven: venta);
    begin
        write('CÓDIGO DEL PRODUCTO: '); readln(ven.codigo);
        if (ven.codigo <> corte) then begin
            write('FECHA DE LA VENTA: '); readln(ven.fecha);
            write('CANTIDAD DE UNIDADES VENDIDAS: '); readln(ven.unidades);
        end;
    end;
procedure agregarArbol(var a: arbol; data: venta); //Cargarlo
    begin
        if (a = nil) then begin //Inicializar
            new(a);
            a^.HI:= nil;
            a^.HD:= nil;
            a^.data:= data;
        end else begin
            if (data.codigo <= a^.data.codigo) then
                agregarArbol(a^.HI, data)
            else
                agregarArbol(a^.HD, data);
        end;
    end;
procedure agregarArbol2(var a: arbol; data: venta); //Inciso II
    begin
        if (a = nil) then begin //Inicializar
            new(a);
            a^.HI:= nil;
            a^.HD:= nil;
            a^.data:= data;
        end else begin
            if (data.codigo = a^.data.codigo) then begin
                a^.data.unidades:= a^.data.unidades + data.unidades;
            end else begin
                if (data.codigo <= a^.data.codigo) then
                    agregarArbol(a^.HI, data)
                else
                    agregarArbol(a^.HD, data);
            end;
        end;
    end;
procedure cargarArbol(var a: arbol);
    var
        ven: venta;
    begin
        leerVenta(ven);
        while (ven.codigo <> corte) do begin
            agregarArbol(a, ven);
            writeln;
            leerVenta(ven);
        end;
    end;
procedure cargarArbol2(var a: arbol);
    var
        ven: venta;
    begin
        leerVenta(ven);
        while (ven.codigo <> corte) do begin
            agregarArbol2(a, ven);
            writeln;
            leerVenta(ven);
        end;
    end;
procedure mirarArbol(a: arbol); //Debug
    begin
        if (a <> nil) then begin
            mirarArbol(a^.HI);
            writeln('Código: ',a^.data.codigo);
            writeln('Unidades: ',a^.data.unidades);
            mirarArbol(a^.HD);
        end;
    end;
function retornarVentas(a: arbol; codigo, contador: integer):integer;
    begin
        if (a <> nil) then begin
            if (codigo < a^.data.codigo) then begin
                retornarVentas(a^.HI, codigo, contador);
            end else if (codigo > a^.data.codigo) then begin
                retornarVentas(a^.HD, codigo, contador);
            end else begin
                retornarVentas:= retornarVentas(a, codigo, contador + a^.data.unidades);
            end;
        end;
        retornarVentas:= contador;
    end;
procedure codigoVentas(a: arbol; codigo: integer; var contador: integer);
    begin
        if (a <> nil) then begin
            if (codigo < a^.data.codigo) then begin
                retornarVentas(a^.HI, codigo, contador);
            end else if (codigo > a^.data.codigo) then begin
                retornarVentas(a^.HD, codigo, contador);
            end else if (codigo = a^.data.codigo) then begin
                writeln('pene3');
                contador:= contador + a^.data.unidades;
            end;
        end;
    end;
var
    a: arbol;
    contador: integer;
begin
    cargarArbol(a);
    mirarArbol(a);
    contador:= 0;
    codigoVentas(a, 10, contador);
    writeln('El código ',10,' tuvo ', contador);
end.
