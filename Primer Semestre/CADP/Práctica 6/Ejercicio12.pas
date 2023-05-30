program Ejercicio12;
type
    lista = ^nodo;
    dispositivo = record
        android: integer;
        pantalla: integer;
        memoria: integer;
    end;
    nodo = record
        data: dispositivo;
        sig: lista;
    end;
procedure crearNodo(var n: lista);
    begin
        n:= nil;
    end;
procedure leerDispositivo(var d: dispositivo);
    begin
        write('Version de Android del dispositivo: '); readln(d.android);
        write('Tamaño de pantalla del dispositivo (pulgadas): '); readln(d.pantalla);
        write('Cantidad de Memoria RAM (en GB): '); readln(d.memoria);
    end;
procedure insertarNodo(var n: lista; d: dispositivo);
    var
        nuevo, anterior, actual: lista;
    begin
        new(nuevo);
        nuevo^.data:= d;
        nuevo^.sig:= nil;
        if (n = nil) then begin
            n:= nuevo;
        end else begin
            actual:= n;
            anterior:= n;
            while (actual <> nil) and (actual^.data.android < nuevo^.data.android) do begin //La información se encuentra ordenada por versión de Android
                anterior:= actual;
                actual:= actual^.sig;
            end;
            if (actual = n) then begin
                nuevo^.sig:= n;
                n:= nuevo;
            end else begin
                anterior^.sig:= nuevo;
                nuevo^.sig:= actual;
            end;
        end;
    end;
procedure cargarLista(var l: lista);
    var
        d: dispositivo;
        t: string[2];
    begin
        t:= '';
        while (t <> 'NO') do begin //Mientras se quiera seguir ingresando nodos a la lista...
            leerDispositivo(d);
            insertarNodo(l, d);
            write('¿Seguir leyendo? (SI/NO): '); readln(t);
            writeln;
        end;
    end;
procedure recorrerLista(l: lista);
    begin
        while (l <> nil) do begin
            writeln('Información del nodo actual: VER ',l^.data.android,'/ PLG ',l^.data.pantalla,'/ MEM ',l^.data.memoria);
            l:= l^.sig;
        end;
    end;
procedure procesarLista(l: lista; var incisoB: integer; var incisoC: real);
    var
        verAndroidActual, cantDisp, cantDispVer, cantDispEsp: integer;
        pantPromedio: real;
    begin
        cantDisp:= 0;
        cantDispVer:= 0;
        cantDispEsp:= 0;
        pantPromedio:= 0;
        verAndroidActual:= l^.data.android;
        while (l <> nil) do begin //Mientras no se haya llegado al último elemento de la lista...
            verAndroidActual:= l^.data.android;
            while (l <> nil) and (l^.data.android = verAndroidActual) do begin //Mientras la versión de android siga siendo la misma... (CORTE DE CONTROL)
                cantDisp:= cantDisp + 1; //Inciso C
                cantDispVer:= cantDispVer + 1; //Inciso A
                if (l^.data.memoria > 3) and (l^.data.pantalla <= 5) then begin //Inciso B
                    cantDispEsp:= cantDispEsp + 1;
                end;
                pantPromedio:= pantPromedio + l^.data.pantalla; //Inciso C
                l:= l^.sig; //Seguir avanzando en la lista
            end;
            writeln('La cantidad de dispositivos con la versión de Android ',verAndroidActual,' es de ',cantDispVer);
            cantDispVer:= 0; //Resetear variable 
        end;
        incisoB:= cantDispEsp;
        incisoC:= (pantPromedio / cantDisp);
    end;
var
    l: lista;
    incisoB: integer;
    incisoC: real;
begin
    crearNodo(l);
    cargarLista(l);
    recorrerLista(l);
    writeln;
    procesarLista(l, incisoB, incisoC);
    writeln('La cantidad de dispositivos con más de 3 GB de memoria y pantallas de a lo sumo a 5 pulgadas es de ',incisoB);
    writeln;
    write('El tamaño promedio de las pantallas de todos los dispositivos es de ',incisoC:2:2,'pulgadas');
end.
