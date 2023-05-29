//Se dispone de información sobre los 3600 usuarios que utilizan el portal.
//De cada usuario se conoce su email, su rol (1: Editor; 2. Autor; 3. Revisor; 4. Lector), revista en la que participa y
//cantidad de días desde el último acceso.
program Ejercicio13;
type
    lista = ^nodo;
    usuario = record
        email: string[20];
        rol: 1..4;
        revista: string[20];
        dias_acceso: 0..1000;
    end;
    nodo = record
        data: usuario;
        sig: lista;
    end;
    vector_roles = array [1..4] of integer; 
procedure crearLista(var l: lista);
    begin
        l:= nil; //Inicializar nodo inicial
    end;
procedure leerUsuario(var u: usuario);
    begin
        write('E-Mail del usuario: '); readln(u.email);
        write('Rol del usuario: '); readln(u.rol);
        write('Revista del usuario: '); readln(u.revista);
        write('Días desde su último acceso: '); readln(u.dias_acceso);
    end;
procedure inicializarVector(var v: vector_roles);
    var
        i: integer;
    begin
        for i:= 1 to 4 do begin
            v[i]:= 0;
        end;
    end;
procedure insertarEnLista(var l: lista; u: usuario);
    var
        nuevo, anterior, actual: lista;
    begin
        new(nuevo);
        nuevo^.data:= u;
        nuevo^.sig:= nil;
        if (l = nil) then begin
            l:= nuevo;
        end else begin
            actual:= l;
            anterior:= l;
            while (actual <> nil) and (actual^.data.dias_acceso > nuevo^.data.dias_acceso) do begin //La información se encuentra ordenada en orden ascendente por los dias de acceso
                anterior:= actual;
                actual:= actual^.sig;
            end;
            if (actual = l) then begin
                nuevo^.sig:= l;
                l:= nuevo;
            end else begin
                anterior^.sig:= nuevo;
                nuevo^.sig:= actual;
            end;
        end;
    end;
procedure cargarLista(var l: lista); //De manera ordenada por días de acceso
    var
        u: usuario;
        t: char;
    begin
        t:= 'Q';
        while (t <> 'N') do begin //Se van a cargar elementos hasta que no se quiera mas
            leerUsuario(u);
            insertarEnLista(l, u);
            //writeln('E-Mail: ',u.email,' / Días desde el ult. acceso: ',u.dias_acceso);
            write('¿Seguir? (S/N): '); readln(t);
            writeln;
        end;
    end;
procedure actualizarMaximo(emailActual: string; var emailMax1, emailMax2: string; diasActual: integer; var diasMax1, diasMax2: integer);
    begin
        if (diasActual > diasMax1) then begin
            diasMax2:= diasMax1;
            emailMax2:= emailMax1;
            diasMax1:= diasActual;
            emailMax1:= emailActual;
        end else if (diasActual > diasMax2) then begin
            diasMax2:= diasActual;
            emailMax2:= emailActual;
        end;
    end;
procedure procesarLista(l: lista; var v: vector_roles; var emailMax1, emailMax2: string);
    var
        diasMax1, diasMax2: 0..1000;
    begin
        while (l <> nil) do begin //Recorrer toda la lista
            //Punto A
            if (l^.data.revista = 'Económica') then begin
                writeln('E-Mail: ',l^.data.email,' / Días desde el ult. acceso: ',l^.data.dias_acceso);
            end;
            
            //Punto B
            v[l^.data.rol]:= v[l^.data.rol] + 1;
            
            //Punto C
            actualizarMaximo(l^.data.email, emailMax1, emailMax2, l^.data.dias_acceso, diasMax1, diasMax2);
            
            //Seguir leyendo la lista
            l:= l^.sig;
        end;
    end;
//procedure wtf(l: lista);
    //begin
        //while (l <> nil) do begin
            //l^.data.email:= 'JA LOL XD';
            //l:= l^.sig;
        //end;
    //end;
var
    l: lista;
    i: integer;
    v: vector_roles;
    eM1, eM2: string[20];
begin
    inicializarVector(v);
    crearLista(l);
    writeln;
    cargarLista(l);
    writeln;
    procesarLista(l, v, eM1, eM2);
    writeln;
    for i:= 1 to 4 do begin //Punto B - Leer vector
        writeln('Hay ',v[i],' personas pertenecientes al rol ',i);
    end;
    writeln;
    write('Los E-Mails de quienes no ingresaron al portal de vuelta por el mayor tiempo son: ', eM1,' ',eM2);
end.
