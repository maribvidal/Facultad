program Ejercicio6;
const
    corte = 'GAIA';
type
    lista = ^nodo;
    sonda = record
        nombre: string[20];
        duracion: 0..1000; //Meses
        costo_constr: real;
        costo_mensual: real;
        rango: 1..7; //Categoría
    end;
    nodo = record //Registro del nodo
        data: sonda;
        sig: lista;
    end;
    vector_rango = array [1..7] of integer; //Vector para la categoría del rango

procedure crearNodo(var n: lista);
    begin
        n:= nil;
    end;
procedure leerSonda(var s: sonda);
    begin
        write('NOMBRE >'); readln(s.nombre);
        write('DURACION (en meses) >'); readln(s.duracion);
        write('CONSTO DE CONSTRUCCIÓN >'); readln(s.costo_constr);
        write('CONSTO DE MANTENIMIENTO MENSUAL >'); readln(s.costo_mensual);
        write('RANGO DEL ESPECTRO ELECTROMAGNÉTICO >'); readln(s.rango);
    end;
procedure agregarNodo(var n: lista; s: sonda); //Adelante
    var
        aux: lista;
    begin
        new(aux);
        aux^.data:= s;
        aux^.sig:= nil;
        if (n = nil) then begin
            n:= aux;
        end else begin
            aux^.sig:= n;
            n:= aux;
        end;
    end;
procedure cargarLista(var l: lista);
    var
        s: sonda;
    begin
        s.nombre:= '';
        while (s.nombre <> corte) do begin //Repetir hasta que el nombre de la sonda sea igual al de 'GAIA', que debe ser la última en procesarse...
            leerSonda(s);
            agregarNodo(l, s);
        end;
    end;
procedure procesarLista(l: lista; var nombreAMax: string; var vect: vector_rango; var puntoC: integer);
    var
        aux: lista;
        cantSondas, duracionPromedio: integer;
        puntoAMax, puntoASuma, costoPromedio: real;
    begin
        duracionPromedio:= 0;
        costoPromedio:= 0;
        cantSondas:= 0;
        puntoAMax:= -1;
        aux:= l; //Para no perder la dirección del primer nodo y así poder comenzar de vuelta a leer la lista
        while (l <> nil) do begin //Mientras el nodo actual no tenga la dirección de memoria del último (NIL)...
            //Punto A
            puntoASuma:= l^.data.costo_constr + l^.data.costo_mensual;
            if (puntoASuma > puntoAMax) then begin
                puntoAMax:= puntoASuma; //Actualizar máximo
                nombreAMax:= l^.data.nombre;
            end;
            
            //Punto B
            vect[l^.data.rango]:= vect[l^.data.rango] + 1;
            
            //Punto C - Sacar duración promedio
            duracionPromedio:= duracionPromedio + l^.data.duracion;
            
            //Punto D - Sacar costo de construcción promedio
            costoPromedio:= costoPromedio + l^.data.costo_constr;
            
            //Avanzar
            cantSondas:= cantSondas + 1; //Sumarle 1 a la cantidad de sondas leidas
            l:= l^.sig;
        end;
        //La lista debe leerse otra vez necesariamente para poder hacer los puntos C y D
        l:= aux;
        costoPromedio:= (costoPromedio / cantSondas);
        duracionPromedio:= (duracionPromedio div cantSondas);
        while (l <> nil) do begin
            //Punto C
            if (l^.data.duracion > duracionPromedio) then begin
                puntoC:= puntoC + 1;
            end;
            
            //Punto D
            if (l^.data.costo_constr > costoPromedio) then begin //Leer punto D
                writeln('El costo de la sonda ',l^.data.nombre,' supera el costo de construcción promedio');
            end;
            l:= l^.sig;
        end;
    end;
var
    l: lista;
    vect: vector_rango;
    nombreAMax: string[20];
    i, puntoC: integer;
begin
    nombreAMax:= ''; //Inicializar
    i:= 1;
    puntoC:= 0;
    crearNodo(l);
    cargarLista(l);
    procesarLista(l, nombreAMax, vect, puntoC);
    writeln('El nombre de la sonda más costosa: ',nombreAMax); //Leer punto A
    while (i <= 7) do begin //Leer punto B
        writeln('Cantidad de sondas que realizarán sus estudios en el rango de la categoría [',i,']: ',vect[i]);
        i:= i + 1;
    end;
    write('Cantidad de sondas cuya duración estimada supera la duración promedio de todas las sondas: ',puntoC); //Leer punto C
end.
