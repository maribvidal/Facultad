program pr5ej3;

const
    codigo_corte = -1;
    dimF = 10;
    
type
    t_rubro = 1..dimF;
    producto = record
        codigo: integer;
        rubro: t_rubro;
        stock: integer;
        precio_uni: real;
        end;
    arbolProd = ^nodoProd;
    nodoProd = record
        data: producto;
        HI: arbolProd;
        HD: arbolProd;
        end;
    vectorRubros = array [t_rubro] of arbolProd;
    
    //Punto C
    codigoyStock = record
        codigo: integer;
        stock: integer;
    end;
    vectorMayor = array [t_rubro] of codigoyStock;
    
    //Punto D
    vectorCodigos = array [t_rubro] of integer;

procedure leerProducto(var prod: producto); //Lectura asistida
    begin
        write('Introducir código >'); readln(prod.codigo);
        if (prod.codigo <> codigo_corte) then begin
            prod.rubro:= Random(10) + 1; writeln('Rubro generado >',prod.rubro);
            prod.stock:= Random(50) + 1; writeln('Stock generado >',prod.stock);
            prod.precio_uni:= Random(25)/7 + 0.5; writeln('PPU generado >',prod.precio_uni:2:2);
        end;
    end;
procedure inicializarVector(var vec: vectorRubros);
    var
        i: integer;
    begin
        for i:= 1 to dimF do begin
            vec[i]:= nil; //Inicializar arboles en nil
        end;
    end;
//Punto A
procedure agregarArbol(var arb: arbolProd; prod: producto);
    begin
        if (arb = nil) then begin
            new(arb);
            arb^.data:= prod;
            arb^.HI:= nil;
            arb^.HD:= nil;
        end else begin
            if (arb^.data.codigo > prod.codigo) then
                agregarArbol(arb^.HI, prod)
            else
                agregarArbol(arb^.HD, prod);
        end;
    end;
procedure cargarVector(var vec: vectorRubros);
    var
        prod: producto;
    begin
        leerProducto(prod);
        while (prod.codigo <> codigo_corte) do begin
            agregarArbol(vec[prod.rubro], prod);
            writeln;
            leerProducto(prod);
        end;
    end;
//Punto B
function existeCodigo(arb: arbolProd; codigo:integer):boolean;
    var
        encontrado: boolean;
    begin
        encontrado:= false;
        if (arb <> nil) then begin
            if (arb^.data.codigo = codigo) then begin
                encontrado:= true;
            end else begin
                if (arb^.data.codigo < codigo) then //Búsqueda acotada
                    encontrado:= existeCodigo(arb^.HD, codigo)
                else
                    encontrado:= existeCodigo(arb^.HI, codigo);
            end;
        end;
        existeCodigo:= encontrado;
    end;
//Punto C
procedure inicializarVector2(var vec2: vectorMayor);
    var
        i: integer;
    begin
        for i:= 1 to dimF do begin
            vec2[i].codigo:= 0;
            vec2[i].stock:= 0;
        end;
    end;
procedure buscarMayor(arb: arbolProd; var codigoMax, stockMax: integer);
    begin
        if (arb <> nil) then begin
            if (arb^.data.codigo > codigoMax) then begin //Preguntar si el código del nodo actual es mayor que el pasado por el parámetro
                codigoMax:= arb^.data.codigo; //Actualizar máximo
                stockMax:= arb^.data.stock;
            end;
            buscarMayor(arb^.HD, codigoMax, stockMax); //Si nos interesa el código mayor, aprovechamos que el arbol esté ordenado por código y buscamos para la derecha
        end;
    end;
procedure codigoRubros(vec: vectorRubros; var vec2: vectorMayor);
    var
        i: integer;
        codigoMax, stockMax: integer;
    begin
        for i:= 1 to dimF do begin
            codigoMax:= -1;
            stockMax:= -1;
            buscarMayor(vec[i], codigoMax, stockMax);
            vec2[i].codigo:= codigoMax;
            vec2[i].stock:= stockMax;
        end;
    end;
//Punto D
procedure inicializarVector3(var vec3: vectorCodigos);
    var
        i: integer;
    begin
        for i:= 1 to dimF do begin
            vec3[i]:= 0;
        end;
    end;
procedure codigosEntre(arb: arbolProd; inf, sup: integer; var cont: integer);
    begin
        if (arb <> nil) then begin
            if (arb^.data.codigo >= inf) then begin //Acotar búsqueda
                if (arb^.data.codigo <= sup) then begin //Acotar búsqueda
                    cont:= cont + 1;
                    codigosEntre(arb^.HI, inf, sup, cont);
                    codigosEntre(arb^.HD, inf, sup, cont);
                end else begin
                    codigosEntre(arb^.HI, inf, sup, cont);
                end;
            end else begin
                codigosEntre(arb^.HD, inf, sup, cont);
            end;
        end;
    end;
procedure puntoD(vec: vectorRubros; inf, sup: integer; var vec3: vectorCodigos);
    var
        i, contador: integer;
    begin
        for i:= 1 to dimF do begin
            contador:= 0;
            codigosEntre(vec[i], inf, sup, contador);
            vec3[i]:= contador;
        end;
    end;
//Módulos para imprimir
procedure imprimirArbolOrden(arb: arbolProd);
    begin
        if (arb <> nil) then begin
            imprimirArbolOrden(arb^.HI);
            writeln('Código: ',arb^.data.codigo,' / Stock: ',arb^.data.stock,' / PPU: ',arb^.data.precio_uni:2:1);
            imprimirArbolOrden(arb^.HD);
        end;
    end;
procedure imprimirVector1(vec: vectorRubros);
    var
        i: integer;
    begin
        for i:= 1 to dimF do begin
            writeln('RÚBRO: ',i);
            imprimirArbolOrden(vec[i]);
            writeln;
        end;
    end;
procedure imprimirVector2(vec2: vectorMayor);
    var
        i: integer;
    begin
        for i:= 1 to dimF do begin
            writeln('RUBRO: ',i);
            writeln('Código mayor: ',vec2[i].codigo,' / Stock: ',vec2[i].stock);
            writeln;
        end;
    end;
procedure imprimirVector3(vec3: vectorCodigos);
    var
        i: integer;
    begin
        for i:= 1 to dimF do begin
            writeln('RUBRO: ',i);
            writeln('Cantidad de productos entre los códigos ingresados previamente: ',vec3[i]);
            writeln;
        end;
    end;
//Programa principal
var
    vec1: vectorRubros;
    vec2: vectorMayor;
    vec3: vectorCodigos;
    numInput1, numInput2: integer;
begin
    Randomize;
    
    //Inicializar variables
    inicializarVector(vec1);
    inicializarVector2(vec2);
    inicializarVector3(vec3);
    numInput1:= 0;
    numInput2:= 0;
    
    //Punto A
    cargarVector(vec1);
    
    //Punto B
    write('Ingrese el rubro en el que se desea buscar el código >'); readln(numInput1);
    write('Ingrese el código a buscar en la estructura de datos >'); readln(numInput2);
    writeln(existeCodigo(vec1[numInput1], numInput2));
    
    //Punto C
    codigoRubros(vec1, vec2);
    
    //Punto D
    write('Ingrese un código límite inferior >'); readln(numInput1);
    write('Ingrese un código límite superior >'); readln(numInput2);
    puntoD(vec1, numInput1, numInput2, vec3);
    
    //Imprimir
    writeln('<<Punto A>>');
    imprimirVector1(vec1);
    writeln('<<Punto B>>');
    imprimirVector2(vec2);
    writeln('<<Punto D>>');
    imprimirVector3(vec3);
end.
