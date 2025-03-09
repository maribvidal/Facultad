program ej3prac1;
const
    corte = -1;
type
    t_genero = 1..8;
    pelicula = record
        codPeli: integer;
        codGen: t_genero;
        puntProm: real;
    end;
    lista = ^nodo;
    nodo = record
        dato: pelicula;
        sig: lista;
    end;
    peli2 = record
        codGen: t_genero;
        puntaje: real;
    end;
    vectorGeneros = array [t_genero] of pelicula;
//MÓDULO A
procedure agregarOrdenado(var l: lista; p: pelicula);
    var
	    aux, act, ant: lista;
    begin 
	    new(aux);
	    aux^.dato:= p;
	    aux^.sig:= l;
	    if (l = nil) then begin
	        l:= aux;
	    end else begin
	        act:= l;
	        ant:= l;
	        while (act <> nil) and (act^.dato.codGen > aux^.dato.codGen) do begin
	            ant:= act;
	            act:= act^.sig;
	        end;
	        if (act = l) then begin
	            aux^.sig:= l;
	            l:= aux;
	        end else begin
	            ant^.sig:= aux;
	            aux^.sig:= act;
	        end;
	   end;
    end;
procedure leerPelicula(var p: pelicula);
    begin
        write('Código de la película: '); readln(p.codPeli);
        if (p.codPeli <> corte) then begin
            write('Código del género: '); readln(p.codGen);
            write('Puntaje promedio: '); readln(p.puntProm);
        end;
    end;
procedure cargarLista(var l: lista);
    var
        p: pelicula;
    begin
        leerPelicula(p);
        while (p.codPeli <> corte) do begin
            agregarOrdenado(l, p); //Ordenar por código de género
            writeln;
            leerPelicula(p);
        end;
    end;
//MÓDULO B - Vector de puntajes
procedure inicializarVector(var v: vectorGeneros);
    var
        i: integer;
    begin
        for i:= 1 to 8 do begin
            v[i].codGen:= i;
            v[i].codPeli:= 0;
            v[i].puntProm:= 0;
        end;
    end;
procedure actualizarMaximo(peliAct: integer; puntAct: real; var peliNue: integer; var puntNue: real);
    begin
        if (puntAct > puntNue) then begin
            peliNue:= peliAct;
            puntNue:= puntAct;
        end;
    end;
procedure vectorPeliPorGenero(l: lista; var v: vectorGeneros);
    var
        generoActual: t_genero;
        peliMax: integer;
        puntMax: real;
    begin
        while (l <> nil) do begin //Recorrer lista para agarrar los puntajes
            generoActual:= l^.dato.codGen;
            peliMax:= 0;
            puntMax:= 0;
            while (l <> nil) and (l^.dato.codGen = generoActual) do begin
                actualizarMaximo(l^.dato.codPeli, l^.dato.puntProm, peliMax, puntMax);
                l:= l^.sig;
            end;
            v[generoActual].codPeli:= peliMax; //Código de la película con mayor aceptación crítica de las del género
            v[generoActual].puntProm:= puntMax; //Puntaje de la película con mayor aceptación crítica de las del género
        end;
    end;
//MÓDULO C - Ordenar vector
procedure bubbleSort(var v: vectorGeneros; dimL: integer);
    var
        i, j: integer;
        temp: pelicula;
    begin
        for i:=1 to dimL do begin
            for j:=1 to (dimL-i) do begin
                if (v[j].puntProm < v[j+1].puntProm) then begin //Ordenar por puntaje
                    temp:= v[j]; //Swap
                    v[j]:= v[j+1];
                    v[j+1]:= temp;
                end;
            end;
        end;
    end;
var
    l: lista;
    v: vectorGeneros;
begin
    l:= nil;
    cargarLista(l);
    //PROBAR EL MÓDULO A
    //while (l <> nil) do begin
    //    writeln(l^.dato.codPeli,' ',l^.dato.codGen);
    //    l:= l^.sig;
    //end;
    inicializarVector(v);
    vectorPeliPorGenero(l, v);
    bubbleSort(v, 8);
    //MÓDULO D
    writeln('El código de película con mayor puntuación es el código ',v[1].codPeli,' con ',v[1].puntProm:2:2,' de puntaje');
    writeln('El código de película con menor puntuación es el código ',v[8].codPeli,' con ',v[8].puntProm:2:2,' de puntaje');
end.
