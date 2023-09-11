{Una empresa desea procesar la información de las horas trabajadas por sus empleados durante 2021.
Para ello, la empresa posee registros de las horas trabajas por cada empleado.
Cada registro consta del numero de empleado, dia, mes y la cantidad de horas trabajadas (a lo sumo 8) para dicho dia y mes.

a. Realizar un modulo que lea la info de los empleados y retorne estructura de datos con todos los registros leidos.
La estructura debe ser eficiente para la busqueda por numero de empleado. La lectura finaliza al ingresar un registro con dia 0
Se sugiere utilizar el modulo leerRegistro().

b. Realizar un modulo que reciba la estructura generada en a. y dos numeros de empleados x e y (incluidos).

c. Realizar un modulo drecursivo que reciba la estructura generada en b. y retorne la cantidad total de horas trabajadas.

NOTA: Implementar el programa principal, que invoque a los incisos a, b y c.}

program parcial;
const
    dia_corte = 0;
type
    t_dia = 0..31;
    t_mes = 1..12;
    t_horas = 1..8;
    empleado = record
        nro: integer;
        dia: t_dia;
        mes: t_mes;
        horasTrabajadas: t_horas;
    end;
    arbol = ^nodo;
    nodo = record
        data: empleado;
        HI: arbol;
        HD: arbol;
    end;
    listaHoras = ^nodo_horas;
    nodo_horas = record
        data: empleado;
        sig: listaHoras;
    end;
procedure leerEmpleado(var e: empleado);
    begin
        e.dia:= Random(31);
        if (e.dia <> dia_corte) then begin
            e.mes:= 1 + Random(11);
            e.nro:= 1 + Random(500);
            e.horasTrabajadas:= 1 + Random(8);
        end;
    end;
procedure agregarArbol(var a: arbol; dato: empleado);
    begin
        if (a = nil) then begin
            new(a);
            a^.data:= dato;
            a^.HI:= nil;
            a^.HD:= nil;
        end else if (dato.nro >= a^.data.nro) then begin
            agregarArbol(a^.HD, dato);
        end else begin //Significa que el valor es menor
            agregarArbol(a^.HI, dato);
        end;
    end;
procedure cargarArbol(var a: arbol);
    var
        e: empleado;
    begin
        leerEmpleado(e);
        while (e.dia <> dia_corte) do begin
                agregarArbol(a, e);
                leerEmpleado(e);
        end;
    end;
procedure imprimirArbol(a: arbol);
    begin
        if (a <> nil) then begin
            imprimirArbol(a^.HD);
            writeln(a^.data.nro);
            imprimirArbol(a^.HI);
        end;
    end;
//PUNTO B
procedure agregarNodo(var l: listaHoras; dato: empleado);
    var
        aux: listaHoras;
    begin
        new(aux);
        aux^.data:= dato;
        aux^.sig:= l;
        l:= aux;
    end;
procedure buscarElementosXeY(a: arbol; nro1, nro2: integer; var l: listaHoras);
    begin
        if (a <> nil) then begin
            if (a^.data.nro >= nro1) and (a^.data.nro <= nro2) then begin
                agregarNodo(l, a^.data);
            end;
            buscarElementosXeY(a^.HI, nro1, nro2, l);
            buscarElementosXeY(a^.HD, nro1, nro2, l);
        end;
    end;
procedure imprimirLista(l: listaHoras);
    begin
        while (l <> nil) do begin
            writeln(l^.data.horasTrabajadas,' / Nro: ',l^.data.nro);
            l:= l^.sig;
        end;
    end;
function moduloC(l: listaHoras):integer;
    begin
        if (l = nil) then
            moduloC:= 0
        else
            moduloC:= moduloC(l^.sig) + l^.data.horasTrabajadas;
    end;
var
    a: arbol;
    l: listaHoras;
begin
    l:= nil;
    Randomize;
    cargarArbol(a);
    imprimirArbol(a);
    buscarElementosXeY(a, 15, 100, l);
    writeln('Leer lista');
    imprimirLista(l);
    writeln('Se trabajó un total de ',moduloC(l),' horas');
end.
