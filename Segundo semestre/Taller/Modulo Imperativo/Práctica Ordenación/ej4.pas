program ej4pr1;
const
    CORTE = 0;
    dimF = 8; //Dimensión física del vector de rubros
    dimF2 = 30; //Dimensión física del vector pedido en el punto C
type
    t_rubro = 1..dimF;
    producto = record
        codigoProd: integer;
        codigoRubro: t_rubro;
        precio: real;
    end;
    lista = ^nodo;
    nodo = record
        data: producto;
        sig: lista;
    end;
    vectorRubros = array [t_rubro] of lista;
    vectorC = array [1..dimF2] of producto;
procedure agregarOrdenado(var l: lista; data: producto);
    var
        aux, ant, act: lista;
    begin
        new(aux);
        aux^.data:= data;
        aux^.sig:= l;
        if (l = nil) then begin
            l:= aux;
        end else begin
            ant:= l;
            act:= l;
            while (act <> nil) and (act^.data.codigoProd < aux^.data.codigoProd) do begin //Recorrer la lista hasta encontrar un lugar adecuado
                ant:= act; //Pasaje de direcciones de memoria
                act:= act^.sig;
            end;
            if (act = l) then begin
                aux^.sig:= l;
                l:= aux;
            end else begin
                ant^.sig:= aux; //Lazo para conectar el nuevo elemento insertado
                aux^.sig:= act;
            end;
        end;
    end;
procedure leerProducto(var p: producto);
    begin
        write('PRECIO: '); readln(p.precio);
        if (p.precio <> CORTE) then begin //La lectura se corta cuando se pasa un 0 como precio
            write('CÓDIGO DEL PRODUCTO: '); readln(p.codigoProd);
            write('CÓDIGO DEL RUBRO: '); readln(p.codigoRubro);
        end;
    end;
procedure cargarEstructura(var v: vectorRubros);
    var
        p: producto;
    begin
        leerProducto(p);
        while (p.precio <> CORTE) do begin //Mientras el precio leído sea distinto de 0...
            agregarOrdenado(v[p.codigoRubro], p); //Acceder a la lista con índice 'p.codigoRubro' del vector e insertar un producto ordenadamente
            writeln; //Dejar espacio para una mejor lectura en la consola
            leerProducto(p); //Leer otro producto
        end;
    end;
procedure leerEstructura(v: vectorRubros);
    var
        aux: lista; //Para recorrer las listas
        i: integer;
    begin
        for i:= 1 to dimF do begin
            aux:= v[i]; //Asignarle a AUX la dirección de memoria de la lista número i
            if (aux <> nil) then begin
                writeln('RUBRO NO.', aux^.data.codigoRubro);
                while (aux <> nil) do begin //Recorrer la lista hasta que la dirección de AUX sea NIL
                    writeln('Código de producto: ', aux^.data.codigoProd);
                    aux:= aux^.sig; //Avanzar al siguiente elemento
                end;
                writeln;
            end;
        end;
    end;
procedure cargarEstructura2(v: vectorRubros; var v2: vectorC; var dimL: integer);
    var
        i: integer;
    begin
        i:= 0;
        //Recorrer la lista del rubro 3
        while (v[3] <> nil) and (i < dimF2) do begin
            i:= i + 1;
            v2[i]:= v[3]^.data; //Insertar elemento de la lista en el vector
            v[3]:= v[3]^.sig;
        end;
        dimL:= i; //La dimensión lógica es igual a las veces que se iteró el WHILE
    end;
procedure bubbleSort(var v2: vectorC; dimL: integer);
    var
        i, j: integer;
        temp: producto;
    begin
        for i:=1 to dimL do begin
            for j:=1 to (dimL - i) do begin
                if (v2[j].precio < v2[j+1].precio) then begin //REALIZAR EL INTERCAMBIO DE ELEMENTOS
                    temp:= v2[j];
                    v2[j]:= v2[j+1];
                    v2[j+1]:= temp;
                end;
            end;
        end;
    end;
procedure leerEstructura2(v2: vectorC; dimL: integer);
    var
        i: integer;
    begin
        for i:= 1 to dimL do begin
            writeln('Precio ',v2[i].precio:2:2,' / código ',v2[i].codigoProd, ' / rubro ',v2[i].codigoRubro);
        end;
    end;
function promedioEstructura2(v2: vectorC; dimL: integer):real;
    var
        i: integer;
        prom: real;
    begin
        prom:= 0;
        for i:=1 to dimL do begin
            prom:= prom + v2[i].precio;
        end;
        promedioEstructura2:= prom/dimL;
    end;
var
    vector1: vectorRubros;
    vector2: vectorC;
    dimL: integer;
begin
    dimL:= 0;
    cargarEstructura(vector1); //MÓDULO A
    leerEstructura(vector1); //MÓDULO B
    cargarEstructura2(vector1, vector2, dimL); //MÓDULO C
    bubbleSort(vector2, dimL); //MÓDULO D
    leerEstructura2(vector2, dimL); //MÓDULO E
    write('El promedio de los precios del segundo vector es de: ',promedioEstructura2(vector2, dimL):2:2); //MÓDULO F
end.
