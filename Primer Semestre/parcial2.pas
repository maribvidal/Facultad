programa prueba;
const
    corte = -1;
type
    t_tema = 1..10;
    t_codigo = 1..1500;
    lista = ^nodo;
    lista2 = ^nodo2;
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
    vector_libros = array [t_codigo] of libro;
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
procedure inciso1(l: lista; var l2: lista);
    begin
        
    end;
var
    l, l2: lista;
begin
    l:= nil;
    l2:= nil;
    cargarLista(l);
    
    
