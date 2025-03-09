program Ejercicio14;
const
    corte = -1;
type
    lista = ^nodo;
    vector_alumnos = array [1..1300] of integer;
    vector_transp = array [1..5] of integer;
    viaje = record
        codigo: -1..1300;
        dia_mes: 1..31;
        facultad: string[15];
        transporte: vector_transp;
    end;
    nodo = record
        dato: viaje;
        sig: lista;
    end;
procedure leerViaje(var v: viaje);
    var
        i, j: integer;
    begin
        for i:= 1 to 5 do begin //Inicializar vector en 0
            v.transporte[i]:= 0;
        end;
        j:= -1;
        write('Leer código: '); readln(v.codigo);
        if (v.codigo <> corte) then begin
            write('Leer día del mes: '); readln(v.dia_mes);
            write('Leer facultad: '); readln(v.facultad);
            while (j <> 0) do begin
                write('¿Qué tipo de transporte utilizó? (0 para cortar): '); readln(j);
                v.transporte[j]:= v.transporte[j] + 1;
            end;
        end;
    end;
procedure agregarNodo(var l: lista; var v: viaje); //Agregar de adelante
    var
        aux: lista;
    begin
        new(aux);
        aux^.dato:= v;
        aux^.sig:= nil;
        if (l = nil) then begin
            l:= aux;
        end else begin
            aux^.sig:= l;
            l:= aux;
        end;
    end;
function valorPorTipo(veces, t: integer):real;
    begin //Hay una tabla con información sobre el precio de cada tipo de viaje
        case t of
            1: valorPorTipo:= 10 * veces; //Colectivo Urbano
            2: valorPorTipo:= 15 * veces; //Colectivo Interurbano
            3: valorPorTipo:= 5 * veces; //Tren Universitario
            4: valorPorTipo:= 10 * veces; //Tren Roca
            5: valorPorTipo:= 2 * veces; //Bicicleta
        end;
    end;
procedure cargarLista(var l: lista);
    var
        v: viaje;
    begin
        leerViaje(v);
        while (v.codigo <> corte) do begin
            agregarNodo(l, v);
            writeln;
            leerViaje(v);
        end;
    end;
procedure actualizarMaximo(uA, tA: integer; var uM1, uM2, tM1, tM2: integer); 
    begin
        if (uA > uM1) then begin
            uM2:= uM1;
            tM2:= tM1;
            uM1:= uA;
            tM1:= tA;
        end else if (uA > uM2) then begin
            uM2:= uA;
            tM2:= tA;
        end;
    end;
procedure procesarLista(l: lista; var cantPuntoA, cantPuntoB, puntoC1, puntoC2, cantPuntoD: integer);
    var
        i, usosTransp, usarMax1, usarMax2: integer;
        gastosTransp: real;
        v1: vector_alumnos;
        v2: vector_transp;
        usoBicicleta: boolean;
    begin
        usarMax1:= -1;
        usarMax2:= -1;
        gastosTransp:= 0;
        usosTransp:= 0;
        usoBicicleta:= false;
        for i:= 1 to 1300 do begin //Inicializar vector alumnos
            v1[i]:= 0; 
        end;
        for i:= 1 to 5 do begin //Inicializar vector transporte
            v2[i]:= 0;
        end;
        while (l <> nil) do begin
            v1[l^.dato.codigo]:= v1[l^.dato.codigo] + 1; //Punto A
            for i:= 1 to 5 do begin //Para ver si supera los 80 dolares y para hacer el punto D
                if (l^.dato.transporte[i] <> 0) then begin //Si se cuenta con algo del tipo de transporte...
                    if (i = 5) then begin usoBicicleta:= true; end; //Punto D
                    v2[i]:= v2[i] + 1; //Punto C
                    usosTransp:= usosTransp + 1;
                    gastosTransp:= gastosTransp + valorPorTipo(l^.dato.transporte[i], i);
                end;
            end;
            
            //Punto B
            if (gastosTransp > 80) then begin
                cantPuntoB:= cantPuntoB + 1;
            end;
            
            //Punto D
            if (usosTransp > 1) and (usoBicicleta) then begin cantPuntoD:= cantPuntoD + 1; end;
            
            //Reiniciar variables
            usosTransp:= 0;
            usoBicicleta:= false;
            gastosTransp:= 0;
            
            //Leer el próximo nodo
            l:= l^.sig;
        end;
        //Punto A
        for i:= 1 to 1300 do begin
            if (v1[i] > 6) then begin cantPuntoA:= cantPuntoA + 1; end;
        end;
        
        //Punto C
        for i:= 1 to 5 do begin
            actualizarMaximo(v2[i], i, usarMax1, usarMax2, puntoC1, puntoC2);
        end;
    end;
var
    l: lista;
    cantPuntoA, cantPuntoB, puntoC1, puntoC2, cantPuntoD: integer;
begin
    l:= nil;
    cantPuntoA:= 0;
    cantPuntoB:= 0;
    puntoC1:= 0;
    puntoC2:= 0;
    cantPuntoD:= 0;
    cargarLista(l);
    procesarLista(l, cantPuntoA, cantPuntoB, puntoC1, puntoC2, cantPuntoD);
    writeln;
    writeln('Cantidad de alumnos que realizan más de 6 viajes por día: ',cantPuntoA);
    writeln('Cantidad de alumnos que gastan en transporte más de $80 por día: ',cantPuntoB);
    writeln('Los dos medios de transporte más utilizados: ',puntoC1, ' ', puntoC2);
    write('Cantidad de alumnos que combinan bicicleta con algún otro medio de transporte: ',cantPuntoD);
end.
