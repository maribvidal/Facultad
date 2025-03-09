program prIniEj3;
type
    t_productos = 1..1000;
    stockPrecio = record //SE DISPONE
        precio: real;
        stock: integer;
    end;
    vectorTabla = array [t_productos] of stockPrecio; //SE DISPONE (precio - stock)
    producto = record
        codigoProducto: t_productos;
        unidadesSolicitadas: integer;
        precioUnitario: real;
    end;
    venta = record
        codigoVenta: integer;
        productosVendidos: listaProductos;
    end;
    listaProductos = ^nodo;
    nodo = record
        dato: producto;
        sig: listaProductos;
    end;
    ticket = record
        codigoVenta: integer;
        productosVendidos: listaProductos; //detalle
        montoTotal: real;
    end;
    listaTickets = ^nodo2;
    nodo2 = record
        dato: ticket;
        sig: listaTickets;
    end;
procedure leerProducto(var p: producto; var tabla: vectorTabla);
    begin
        write('Cantidad de unidades vendidas: '); readln(p.unidadesSolicitadas);
        if (p.unidadesSolicitadas <> 0) then begin //CÓDIGO CORTE
            write('Código del producto: '); readln(p.codigoProducto);
            if ((tabla[p.codigoProducto].stock - p.unidadesSolicitadas) < 1) then begin //SE DISPONE
                p.unidadesSolicitadas:= tabla[p.codigoProducto].stock; //En caso de no haber stock suficiente, se venderá la máxima cantidad posible
            end else begin //Si no hay problema, osea hay stock suficiente, entonces restar las unidades solicitadas
                tabla[p.codigoProducto].stock:= tabla[p.codigoProducto].stock - p.unidadesSolicitadas;
            end;
        end;
    end;
procedure agregarElemento(var l: listaProductos; dato: producto);
    var
        nue: listaProductos;
    begin
        new(nue);
        nue^.dato:= dato;
        nue^.sig:= l;
        l:= nue;
    end;
procedure leerVenta(var ven: venta; var tabla: vectorTabla);
    var
        p: producto;
    begin
        write('Código de venta: '); readln(ven.codigoVenta);
        if (ven.codigoVenta <> -1) then begin //CÓDIGO CORTE
            leerProducto(p, tabla);
            while (p.unidadesSolicitadas <> 0) do begin //Mientras las unidades solicitadas del producto sean diferentes que 0
                p.precioUnitario:= tabla[p.codigoProducto].precio; //SE DISPONE
                agregarElemento(ven.productosVendidos, p); //Agregar producto a la lista de productos vendidos
                writeln;
                leerProducto(p, tabla);
            end;
        end;
    end;
procedure leerTicket(var t: ticket; var tabla: vectorTabla);
    var
        ven: venta;
        aux: listaProductos;
        montoTotal: real;
    begin
        leerVenta(ven, tabla);
        montoTotal:= 0;
        if (ven.codigoVenta <> -1) then
            t.codigoVenta:= ven.codigoVenta;
            t.productosVendidos:= ven.productosVendidos;
            //Recorrer lista para sacar el monto total
            aux:= t.productosVendidos;
            while (aux <> nil) do begin
                montoTotal:= montoTotal + (aux^.dato.unidadesSolicitadas * aux^.dato.precioUnitario);
                aux:= aux^.sig;
            end;
            t.montoTotal:= montoTotal;
        end;
    end;
procedure agregarElementoT(var l: listaTickets; dato: ticket);
    var
        nue: listaTickets;
    begin
        new(nue);
        nue^.dato:= dato;
        nue^.sig:= l;
        l:= nue;
    end;
procedure cargarLista(var l: listaTickets; var tabla: vectorTabla);
    var
        t: ticket;
        letra: char;
    begin
        letra:= '';
        while (letra <> 'N') do begin
            leerTicket(t, tabla);
            agregarElementoT(l, t);
            writeln;
            write('¿Leer otro ticket? (S/N): '); readln(letra);
        end;
    end;
var
    v: vectorTabla;
    l: listaTickets;
begin
    l:= nil;
    cargarVectorTabla(v); //SE DISPONE
    cargarLista(l, v);
end.
