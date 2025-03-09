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
            if (data.codigo < a^.data.codigo) then begin
                agregarArbol2(a^.HI, data);
            end else if (data.codigo > a^.data.codigo) then begin
                agregarArbol2(a^.HD, data);
            end else begin
                a^.data.unidades:= a^.data.unidades + data.unidades;
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
function puntoB(a: arbol; codigo: integer):integer;
    var
        cant: integer;
    begin
        cant:= 0; //Inicializar variable en 0
        if (a <> nil) then begin //Si el arbol no está vacío...
            if (codigo < a^.data.codigo) then begin //Si el código es menor que el del nodo actual del arbol...
                cant:= puntoB(a^.HI, codigo); //Ir al hijo izquierdo
            end else if(codigo > a^.data.codigo) then begin//Si el código es mayor que el del nodo actual del arbol...
                cant:= puntoB(a^.HD, codigo); //Ir al hijo derecho
            end else begin //Si no (osea si es igual) entonces
                cant:= a^.data.unidades; //Asignarle a cant las unidades del nodo actual
                cant:= cant + puntoB(a^.HI, codigo); //Y sumarle las que hayan del lado izquierdo
                cant:= cant + puntoB(a^.HD, codigo); //Y sumarle las que hayan del lado derecho
            end;
        end;
        puntoB:= cant; //Retornar cantidad de unidades vendidas
    end;
function puntoC(a2: arbol; codigo: integer):integer;
    var
        cant: integer;
    begin
        cant:= 0; //Inicializar variable en 0
        if (a2 <> nil) then begin //Si el arbol no está vacío...
            if (codigo < a2^.data.codigo) then begin //Si el código es menor que el del nodo actual del arbol...
                cant:= puntoC(a2^.HI, codigo); //Ir al hijo izquierdo
            end else if(codigo > a2^.data.codigo) then begin//Si el código es mayor que el del nodo actual del arbol...
                cant:= puntoC(a2^.HD, codigo); //Ir al hijo derecho
            end else begin //Si no (osea si es igual) entonces
                cant:= a2^.data.unidades; //Asignarle a cant las unidades del nodo actual
            end;
        end;
        puntoC:= cant; //Retornar cantidad de unidades vendidas
    end;
var
    a, a2: arbol;
begin
    a:= nil;
    a2:= nil;
    cargarArbol(a);
    cargarArbol2(a2);
    mirarArbol(a);
    writeln('El código ',10,' tuvo ', puntoB(a, 10));
    writeln('El código ',5,' tuvo ', puntoC(a2, 5));
end.
