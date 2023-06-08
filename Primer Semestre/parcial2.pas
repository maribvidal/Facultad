program prueba;
const
    corte = -1;
type
    t_tema = 1..10;
    t_codigo = 1..1500;
    lista = ^nodo;
    lista2 = ^nodo2;
    lista3 = ^nodo3;
    libro = record
        titulo: string[20];
        autor: string[20];
        anio: integer;
        nro: t_tema;
    end;
    socio = record
        nro: integer;
        correo: string[20];
        prestamos: lista2;
    end;
    nodo = record
        data: socio;
        sig: lista;
    end;
    prestamo = record
        codigo: t_codigo;
        fecha: string[8];
    end;
    nodo2 = record
        data: prestamo;
        sig: lista2;
    end;
    nodo3 = record
        nroSocio: integer;
        cantPrestamos: integer;
        sig: lista3;
    end;
    vector_libros = array [t_codigo] of libro;
    vector_temas = array [t_tema] of integer;
procedure leerPrestamo(var p: prestamo);
    begin
        write('código de libro: '); readln(p.codigo);
        if (p.codigo <> corte) then begin
            write('fecha: '); readln(p.fecha);
        end;
    end;
procedure agregarNodo2(var l: lista2; p: prestamo); //se dispone
    var
        nuevo: lista2;
    begin
        new(nuevo);
        nuevo^.data:= p;
        nuevo^.sig:= nil;
        if (l <> nil) then 
            nuevo^.sig:= l;
        l:= nuevo;
    end;
procedure agregarNodo(var l: lista; s: socio);
    var
        nuevo: lista;
    begin
        new(nuevo);
        nuevo^.data:= s;
        nuevo^.sig:= nil;
        if (l <> nil) then 
            nuevo^.sig:= l;
        l:= nuevo;
    end;
procedure agregarNodo3(var l: lista3; nroSocio, cantPrestamos: integer);
    var
        nuevo: lista3;
    begin
        new(nuevo);
        nuevo^.nroSocio:= nroSocio;
        nuevo^.cantPrestamos:= cantPrestamos;
        nuevo^.sig:= nil;
        if (l <> nil) then 
            nuevo^.sig:= l;
        l:= nuevo;
    end;
procedure leerSocio(var s: socio);
    var
        p: prestamo;
    begin
        write('numero de socio: '); readln(s.nro);
        if (s.nro <> corte) then begin
            write('correo: '); readln(s.correo);
            leerPrestamo(p);
            while (p.codigo <> corte) do begin
                agregarNodo2(s.prestamos, p);
                writeln;
                leerPrestamo(p);
            end;
        end;
    end;
procedure cargarLista(var l: lista);
    var
        s: socio;
    begin
        leerSocio(s);
        while (s.nro <> corte) do begin
            agregarNodo(l, s);
            writeln;
            leerSocio(s);
        end;
    end;
procedure inciso1(l: lista; var l2: lista3); //Retornar, en una estructura adecuada, numero de socio y su cantidad de préstamos para cada socio que realizó más de 20 préstamos
    var
        contador: integer;
        aux: lista;
    begin
        while (l <> nil) do begin
            contador:= 0;
            //Contar la cantidad de prestamos que tiene cada socio
            aux:= l^.data.prestamos;
            while (aux <> nil) do begin
                contador:= contador + 1;
                aux:= aux^.sig;
            end;
            
            //Si el socio realizó mas de 20 prestamos...
            if (contador > 20) then
                agregarNodo3(l2, l^.data.nro, contador); //Agregar a la nueva estructura
                
            //Avanzar
            l:= l^.sig;
        end;
    end;
procedure inciso2y3(l: lista; var v: vector_temas; var cantVeces: integer);
    var
        contador: integer;
    begin
        while (l <> nil) do begin
            contador:= 0;
            while (l^.data.prestamos <> nil) do begin
                //la cantidad de veces que se sacaron libros para cada tema
                cantVeces:= cantVeces + 1;
                v[l^.data.prestamos.data.codigo]:= v[l^.data.prestamos.data.codigo] + 1;
                l^.data.prestamos:= l^.data.prestamos^.sig;
            end;
        end;
    end;
procedure inicializarVector(var v: vector_temas);
    var
        i: integer;
    begin
        for i:= 1 to 10 do begin
            v[i]:= 0;
        end;
    end;
procedure actualizarMaximo(prestamosActual, nroActual: integer; var prestamosNuevo, nroNuevo: integer);
    begin
        if (prestamosActual > prestamosNuevo) then begin
            prestamosNuevo:= prestamosActual;
            nroNuevo:= nroActual;
        end;
    end;
//retornar el número de tema con mayor cantidad de préstamos. El programa debe informar dicho valor
procedure puntoB(l: lista; v: vector_temas; var nroMax: integer);
    var
        prestamosMax: integer;
    begin
        prestamosMax:= -1;
        for i:= 1 to 10 do begin
            actualizarMaximo(v[i], i, prestamosMax, nroMax);
        end;
    end;
function igualParImpar(nro: integer):boolean;
    var
        pares, impares: integer;
    begin
        while (nro <> 0) do begin
            if ((nro mod 10) mod 2) = 0 then begin
                pares:= pares + 1;
            end else begin
                impares:= impares + 1;
            end;
            nro:= nro div 10;
        end;
        igualParImpar:= (pares = impares);
    end;
//invoque a un módulo que reciba el valor leido y la estructura correspondiente retornada en a) para imprimir los numeros 
//de clientes que tengan la misma cantidad de digitos pares e impares y cuya cantidad de préstamos coincida con el valor ingresado
procedure puntoC(l: lista; valor: integer; var cantEsp: integer);
    var
        contador: integer;
        condicion1, condicion2: boolean;
    begin
        contador:= 0;
        condicion1:= false;
        condicion2:= false;
        while (l <> nil) do begin
            condicion1:= igualParImpar(l^.data.nro); //misma cantidad de digitos pares e impares
            while (l^.data.prestamos <> nil) do begin
                contador:= contador + 1;
                l^.data.prestamos:= l^.data.prestamos^.sig;
            end;
            condicion2:= (contador = valor); //cuya cantidad de préstamos coincida con el valor ingresado
            
            //Fijarse si el cliente cumple con las dos condiciones
            if (condicion1) and (condicion2) then
                cantEsp:= cantEsp + 1;
                
            //Avanzar
            l:= l^.sig;
        end;
    end;
var
    l: lista;
    l2, aux: lista3;
    v: vector_temas;
    i, valorIngresar, cantVeces, nroMax, cantEsp: integer;
begin
    cantVeces:= 0;
    nroMax:= 0;
    l:= nil;
    l2:= nil;
    inicializarVector(v); //Este va a contener la cantidad de veces que se sacaron libros para cada tema
    cargarLista(l);
    inciso1(l, l2);
    inciso2y3(l, v, cantVeces);
    puntoB(l, v, nroMax);
    write('Ingrese un número cualquiera: '); readln(valorIngresar);
    puntoC(l, valorIngresar, cantEsp);
    
    //Leer datos obtenidos
    if (l2 <> nil) then begin
        aux:= l2;
        while (aux <> nil) do begin
            writeln('Nro. socio: ',aux^.nroSocio,' / Cant. prestamos: ',aux^.cantPrestamos);
            aux:= aux^.sig;
        end;
    end;
    for i:= 1 to 10 do begin
        writeln('cantidad de veces que se sacaron libros para el tema ',i,': ',v[i]);
    end;
    writeln('cantidad total de préstamos que realizó la biblioteca: ',cantVeces);
    writeln('número de tema con mayor cantidad de préstamos: ',nroMax);
    write('numeros de clientes que tengan la misma cantidad de digitos pares e impares y cuya cantidad de préstamos coincida con el valor ingresado: ',cantEsp);
end.
