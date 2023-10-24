{TURNO C TEMA 2
Se lee información de las compras realizadas por los clientes a un supermercado en el año 2022. 
De cada compra se lee el código de cliente, número de mes y monto gastado. La lectura finaliza cuando se lee el cliente con código 0.

a) Realizar un módulo que lea la información de las compras y retorne una estructura de datos eficiente para la búsqueda por código de cliente. 
Para cada cliente, esta estructura debe acumular el monto total gastado para cada mes del año 2022. Se sugiere utilizar el módulo leerCompra().

b)Realizar un módulo que reciba la estructura generada en a) y un cliente, y retorne el mes con mayor gasto de dicho cliente.

c) Realizar un módulo que reciba la estructura generada en a) y un número de mes, y retorne la cantidad de clientes que no gastaron nada en dicho mes.
NOTA: Implementar el programa principal, que invoque a los incisos a, b y c.}

program parcial;

const
    codigo_corte = 0;
    dimF = 12; //Meses
    
type
    t_mes = 1..dimF;
    compra = record
        codigo: integer;
        mes: t_mes;
        monto: real;
    end;
    vectorMes = array [t_mes] of real; //para el monto total
    elemArbol = record
        codigo: integer;
        meses: vectorMes;
    end;
    arbol = ^nodo;
    nodo = record
        dato: elemArbol;
        HI: arbol;
        HD: arbol;
    end;
    
//Procesos
procedure leerCompra(var com: compra);
    begin
        write('Introducir un código >'); readln(com.codigo);
        if (com.codigo <> codigo_corte) then begin
            com.mes:= Random(11) + 1; writeln('Mes: ',com.mes);
            com.monto:= Random(100)/5; writeln('Monto: ',com.monto:2:2);
        end;
    end;
procedure inicializarVector(var vec: vectorMes); //Inicializar vector de meses
    var
        i: integer;
    begin
        for i:=1 to dimF do begin
            vec[i]:= 0;
        end;
    end;
//Punto A
procedure agregarArbol(var arb: arbol; com: compra);
    begin
        if (arb = nil) then begin //Comprobar si el arbol está vacío
            new(arb);
            arb^.dato.codigo:= com.codigo; //Asignarle el código pasado en el módulo al arbol
            inicializarVector(arb^.dato.meses);
            arb^.dato.meses[com.mes]:= com.monto;
            arb^.HI:= nil;
            arb^.HD:= nil;
        end
        else begin //Si no lo está...
            if (arb^.dato.codigo > com.codigo) then begin
                agregarArbol(arb^.HI, com);
            end else if (arb^.dato.codigo < com.codigo) then begin
                agregarArbol(arb^.HD, com);
            end else begin //Si el código del nodo y el pasado coinciden...
                arb^.dato.meses[com.mes]:= arb^.dato.meses[com.mes] + com.monto; //Sumar el monto pasado que pertenece al mismo código
            end;
        end;
    end;
procedure cargarArbol(var arb: arbol); //Punto A
    var
        com: compra;
    begin
        leerCompra(com);
        while (com.codigo <> codigo_corte) do begin //Mientras el código ingresado sea diferente de 0
            agregarArbol(arb, com);
            writeln;
            leerCompra(com); //Leer otro
        end;
    end;
    
//Punto B    
procedure puntoB(arb: arbol; cliente: integer; var mesMax: integer);
    //---FUNCIÓN ADENTRO
    function mesMayor(vec: vectorMes):integer;
        var
            i, mesMax: integer;
            montoMax: real;
        begin
            mesMax:= 0;
            montoMax:= -1;
            for i:=1 to dimF do begin
                if (vec[i] > montoMax) then begin //Si el gasto del elemento actual del vector es mayor a la variable
                    montoMax:= vec[i];
                    mesMax:= i;
                end;
            end;
            mesMayor:= mesMax;
        end;
    //-
    begin
        if (arb <> nil) then begin
            if (cliente = arb^.dato.codigo) then begin
                mesMax:= mesMayor(arb^.dato.meses);
            end else if (arb^.dato.codigo > cliente) then begin
                puntoB(arb^.HI, cliente, mesMax);
            end else begin
                puntoB(arb^.HD, cliente, mesMax);
            end;
        end;
    end;

//Punto C
procedure puntoC(arb: arbol; numMes: integer; var cantClientes: integer); //Manera iterativa
    begin
        if (arb <> nil) then begin
            puntoC(arb^.HI, numMes, cantClientes);
            //Preguntar si el vector del nodo actual tiene algo o nada en dicho mes
            if (arb^.dato.meses[numMes] = 0) then
                cantClientes:= cantClientes + 1;
            puntoC(arb^.HD, numMes, cantClientes);
        end;
    end;
function puntoCfuncion(arb: arbol; numMes: integer):integer; //Manera recursiva
    var
        acumulador: integer; //Acumulando clientes
    begin
        acumulador:= 0;
        if (arb <> nil) then begin
            if (arb^.dato.meses[numMes] = 0) then
                acumulador:= acumulador + 1;
            acumulador:= acumulador + puntoCfuncion(arb^.HI, numMes);
            acumulador:= acumulador + puntoCfuncion(arb^.HD, numMes);
        end;
        puntoCfuncion:= acumulador;
    end;

//Módulos para imprimir
procedure imprimirVectorMes(vec: vectorMes);
    var
        i: integer;
    begin
        for i:=1 to dimF do begin
            writeln('Monto del mes ',i,' es ',vec[i]:2:2);
        end;
    end;
procedure imprimirArbol(arb: arbol);
    begin
        if (arb <> nil) then begin
            imprimirArbol(arb^.HI);
            writeln('CODIGO: ',arb^.dato.codigo);
            imprimirVectorMes(arb^.dato.meses);
            writeln;
            imprimirArbol(arb^.HD);
        end;
    end;

//Programa principal
var
    arb: arbol;
    cantClientes, mesMax, numInput: integer;
begin
    arb:= nil; //Inicializar arbol
    mesMax:= 0;
    cantClientes:= 0;
    Randomize;
    cargarArbol(arb);
    imprimirArbol(arb);
    
    //Punto B
    write('Ingrese un código de cliente: '); readln(numInput);
    puntoB(arb, numInput, mesMax);
    writeln('El mes con mayor monto del cliente es ',mesMax);
    
    //Punto C
    writeln('Ingrese un mes: '); readln(numInput);
    //puntoC(arb, numInput, cantClientes);
    write('Cantidad de clientes que no tienen gastos en el mes ',numInput,': ',puntoCfuncion(arb, numInput));
end.
