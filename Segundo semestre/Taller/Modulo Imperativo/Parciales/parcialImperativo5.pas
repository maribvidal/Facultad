program parcialPlay;

const
    codigo_corte = 0;
    mes_dimF = 12;

type
    t_dia = 1..31;
    t_mes = 1..mes_dimF;
    compra = record
        videojuego: integer;
        codigo_cli: integer;
        dia: t_dia;
        mes: t_mes;
        end;
    
    //Estructura i
    arbolCli = ^nodoCli;
    nodoCli = record
        elem: compra;
        HI: arbolCli;
        HD: arbolCli;
        end;
        
    //Estructura ii
    regMes = record
        cant_compras: integer;
        mes: t_mes;
        end;
    vectorMes = array [t_mes] of regMes; //Para almacenar las compras
    
    //Punto B
    listaCompras = ^nodoCompras;
    nodoCompras = record
        data: compra;
        sig: listaCompras;
        end;
    
//Módulos
procedure leerCompra(var com: compra);
    begin
        write('Ingrese un código para el cliente: '); readln(com.codigo_cli);
        if (com.codigo_cli <> codigo_corte) then begin 
            com.dia:= Random(31) + 1; writeln('Día generado: ',com.dia);
            com.mes:= Random(12) + 1; writeln('Mes generado: ',com.mes);
            com.videojuego:= Random(20000) + 1; writeln('Código de videojuego generado: ',com.videojuego);
        end;
    end;
procedure inicializarVector(var vec: vectorMes);
    var
        i: integer;
    begin
        for i:=1 to mes_dimF do begin
            vec[i].cant_compras:= 0;
            vec[i].mes:= i;
        end;
    end;

//Punto A
procedure agregarArbolCli(var arb: arbolCli; elem: compra);
    begin
        if (arb = nil) then begin
            new(arb);
            arb^.elem:= elem;
            arb^.HI:= nil;
            arb^.HD:= nil;
        end else begin
            if (arb^.elem.codigo_cli <= elem.codigo_cli) then
                agregarArbolCli(arb^.HD, elem)
            else
                agregarArbolCli(arb^.HI, elem);
        end;
    end;
procedure cargarEstructuras(var arb: arbolCli; var vec: vectorMes); //cargar el arbolCli y el vectorMes
    var
        com: compra;
    begin
        leerCompra(com);
        while (com.codigo_cli <> codigo_corte) do begin
            agregarArbolCli(arb, com); //Agregar registro al árbol
            vec[com.mes].cant_compras:= vec[com.mes].cant_compras + 1; //Incrementar la cantidad de compras del mes
            writeln;
            leerCompra(com); //Leer otro registro
        end;
    end;

//Punto B
procedure agregarAdelante(var lis: listaCompras; data: compra);
    var
        aux: listaCompras;
    begin
        new(aux);
        aux^.data:= data;
        aux^.sig:= lis;
        lis:= aux;
    end;
procedure comprasCliente(arb: arbolCli; codigo: integer; var lis: listaCompras);
    begin
        if (arb <> nil) then begin
            if (arb^.elem.codigo_cli = codigo) then begin
                agregarAdelante(lis, arb^.elem);
                comprasCliente(arb^.HI, codigo, lis); //Buscar en los alrededores del nodo
                comprasCliente(arb^.HD, codigo, lis);
            end else if (arb^.elem.codigo_cli > codigo) then begin
                comprasCliente(arb^.HI, codigo, lis);
            end else begin
                comprasCliente(arb^.HD, codigo, lis);
            end;
        end;
    end;

//Punto C
procedure metodoSeleccion(var vec: vectorMes);
    var
        i, j: integer;
        temp: regMes;
    begin
        for i:=1 to mes_dimF do begin
            for j:=1 to (mes_dimF - i) do begin
                if (vec[j].cant_compras < vec[j+1].cant_compras) then begin
                    temp:= vec[j];
                    vec[j]:= vec[j+1];
                    vec[j+1]:= temp;
                end;
            end;
        end;
    end;

//Módulos para imprimir
procedure imprimirVector(vec: vectorMes);
    var
        i: integer;
    begin
        for i:=1 to mes_dimF do begin
            writeln('Compras realizadas en el mes [',vec[i].mes,']: ',vec[i].cant_compras);
        end;
    end;
procedure imprimirLista(lis: listaCompras);
    begin
        while (lis <> nil) do begin
            writeln('Código de videojuego: ',lis^.data.videojuego,' / Día: ',lis^.data.dia,' / Mes: ',lis^.data.mes);
            lis:= lis^.sig;
        end;
    end;
procedure imprimirArbolCli(arb: arbolCli); //De manera ordenada
    begin
        if (arb <> nil) then begin
            imprimirArbolCli(arb^.HI);
            writeln('CÓDIGO CLIENTE: ',arb^.elem.codigo_cli);
            writeln('Código de videojuego: ',arb^.elem.videojuego,' / Día: ',arb^.elem.dia,' / Mes: ',arb^.elem.mes);
            imprimirArbolCli(arb^.HD);
        end;
    end;
    
//Programa principal
var
    arb: arbolCli;
    vec: vectorMes;
    lis: listaCompras;
    input: integer;
begin
    //Inicializar variables
    arb:= nil;
    lis:= nil;
    input:= 0;
    inicializarVector(vec);
    
    //Punto A
    cargarEstructuras(arb, vec);
    writeln;
    writeln('LEER ARBOL ORDENADO POR CÓDIGOS DE CLIENTE');
    imprimirArbolCli(arb);
    writeln;
    writeln('LEER VECTOR DE MESES');
    imprimirVector(vec);
    writeln;
    
    //Punto B
    write('INGRESAR UN CÓDIGO DE CLIENTE: '); readln(input);
    comprasCliente(arb, input, lis);
    imprimirLista(lis);
    writeln;
    
    //Punto C
    writeln('ORDENAR VECTOR DE MESES POR CANTIDAD DE COMPRAS DE MAYOR A MENOR');
    metodoSeleccion(vec);
    imprimirVector(vec);
end.
