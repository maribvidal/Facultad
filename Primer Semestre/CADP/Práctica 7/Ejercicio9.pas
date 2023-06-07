//EJERCICIO 9 - ENUNCIADO
//Un cine posee la lista de películas que proyectará durante el mes de Febrero. De cada película se tiene:
//código de película, título de la película, código de género (1: acción, 2: aventura, 3: drama, 4: suspenso,
//5: comedia, 6: bélica, 7: documental y 8: terror) y puntaje promedio otorgado por las críticas. Dicha
//estructura no posee orden alguno.
program Ejercicio9;
const
    corte = -1;
type
    //Crear el registro para las películas
    t_genero = 1..8; //Un subrango para el género
    pelicula = record 
        codigo: integer;
        titulo: string[15];
        genero: t_genero;
        puntaje: real;
    end;
    //Crear el registro para las críticas
    critica = record
        dni: longint;
        nombre_completo: string[30];
        codigo: integer;
        puntaje: real;
    end;
    //La lista de películas estructura no posee orden alguno.
    lista = ^nodo;
    lista2 = ^nodo2;
    nodo = record
        data: pelicula;
        sig: lista;
    end;
    nodo2 = record
        data: critica;
        sig: lista2;
    end;
    //Vector de categoría de películas
    v_genero = array [t_genero] of real;

//ESTOS MÓDULOS "SE DISPONEN", PERO LOS ESCRIBO IGUAL PARA QUE FUNCIONE EL PROGRAMA
procedure leerPelicula(var p: pelicula); //Módulo que lee los registros de películas
    begin
        with p do begin
            write('Código de la película: '); readln(codigo);
            write('Título de la película: '); readln(titulo);
            write('Código del género: '); readln(genero);
            write('Puntaje promedio de la crítica: '); readln(puntaje);
        end;
    end;
procedure agregarNodo(var l: lista; p: pelicula); //Módulo que agrega un nodo a la lista de adelante
    var
        aux: lista;
    begin
        new(aux); //Asignarle una posición de memoria al nodo auxiliar
        aux^.data:= p; //Asignarle en la posición de memoria que apunta el registro cargado
        aux^.sig:= nil; //Asignarle como su siguiente "nil"
        if (l <> nil) then //Si la lista no está vacía...
            aux^.sig:= l; //Asignarle como su siguiente la dirección del nodo ingresado
        l:= aux; //Asignarle al nodo ingresado la dirección del nodo auxiliar
    end;
procedure cargarLista(var l: lista); //La lista de películas que tiene el cine
    var
        p: pelicula;
        seguir: integer;
    begin
        seguir:= -1;
        while (seguir <> 0) do begin
            leerPelicula(p);
            agregarNodo(l, p);
            write('¿Seguir ingresando? (0/1): '); readln(seguir);
            writeln;
        end;
    end;
    
//LOS MÓDULOS SIGUIENTES SI LOS PIDE EL PUNTO
//Punto A - Actualizar (en la lista que se dispone) el puntaje promedio otorgado por las críticas. 
//Para ello se debe leer desde teclado las críticas que han realizado críticos de cine, de cada crítica se lee: 
//DNI del crítico, apellido y nombre del crítico, código de película y el puntaje otorgado. 
//La lectura finaliza cuando se lee el código de película -1 y la información viene ordenada por código de película.
function igualParImpar(dni: longint):boolean;
    var
        pares, impares: integer;
    begin
        pares:= 0;
        impares:= 0;
        while (dni <> 0) do begin
            if ((dni mod 10) mod 2) = 0 then
                pares:= pares + 1
            else 
                impares:= impares + 1;
            dni:= dni div 10;
        end;
        igualParImpar:= (pares = impares);
    end;
procedure leerCritica(var c: critica); //Módulo para leer los registros de las críticas
    begin
        write('Código de la película: '); readln(c.codigo);
        if (c.codigo <> corte) then begin //Si el código de la película no es -1
            write('DNI del crítico: '); readln(c.dni);
            write('Apellido y nombre del crítico: '); readln(c.nombre_completo);
            write('Puntaje otorgado: '); readln(c.puntaje);
        end;
    end;
procedure insertarNodo(var l: lista2; c: critica); //Insertar nodos de manera ordenada "la información viene ordenada por código de película"
    var
        aux, ant, act: lista2;
    begin
        new(aux);
        aux^.data:= c;
        aux^.sig:= nil;
        if (l = nil) then begin
            l:= aux;
        end else begin
            act:= l;
            ant:= l;
            while (act <> nil) and (act^.data.codigo < aux^.data.codigo) do begin //Encontrar la posición deseada
                ant:= act; //A anterior, asignarle la dirección de memoria del actual
                act:= act^.sig; //A actual, asignarle la dirección de memoria del siguiente
            end;
            if (ant = act) then begin //Si ninguno de los dos nodos se movieron de posición (están en la primera posición)...
                aux^.sig:= l;
                l:= aux;
            end else begin //Si no...
                ant^.sig:= aux;
                aux^.sig:= act;
            end;
        end;
    end;
procedure cargarLista2(var l2: lista2); //Cargar la lista con las críticas, que se encuentra ordenada por código de película
    var
        c: critica;
    begin
        leerCritica(c);
        while (c.codigo <> corte) do begin
            insertarNodo(l2, c);
            writeln;
            leerCritica(c);
        end;
    end;
procedure actualizarLista(var l: lista; l2: lista2);
    var
        codigoActual, aux1: integer;
        puntajePromedio: real;
        aux: lista;
    begin
        while (l2 <> nil) do begin
            codigoActual:= l2^.data.codigo;
            puntajePromedio:= 0;
            aux1:= 0; //Para guardar la cantidad de películas del mismo código
            writeln('Código actual:',codigoActual);
            while (l2 <> nil) and (codigoActual = l2^.data.codigo) do begin
                puntajePromedio:= puntajePromedio + l2^.data.puntaje; //Agregar a la variable el puntaje
                aux1:= aux1 + 1;
                l2:= l2^.sig;
            end;
            //Buscar la película en la lista y actualizarla
            if (l2 <> nil) then begin
                writeln('Nuevo código:',l2^.data.codigo);
                aux:= l;
                while (aux <> nil) and (aux^.data.codigo <> codigoActual) do begin //Mientras no se haya alcanzado la última posición Y no se haya alcanzado la posición con el código actual
                    aux:= aux^.sig; //Recorrer la lista
                end;
                //Una vez encontrada la dirección (seguro existe) actualizar el valor del puntaje promedio
                puntajePromedio:= ((puntajePromedio / aux1) + aux^.data.puntaje)/2; //Sumarle el promedio anterior y dividir todo por 2
                aux^.data.puntaje:= puntajePromedio;
                writeln('Puntaje promediado!');
            end;
        end;
    end;
procedure puntoB(l: lista; var categoriaMax: integer);
    var
        vector: v_genero;
        i: integer;
        puntajeMax: real;
    begin
        puntajeMax:= -1;
        for i:= 1 to 8 do begin //Inicializar vector
            vector[i]:= 0;
        end;
        while (l <> nil) do begin //Anotar puntajes por categoría
            vector[l^.data.genero]:= vector[l^.data.genero] + l^.data.puntaje;
            l:= l^.sig;
        end;
        for i:= 1 to 8 do begin //Actualizar máximo
            if (vector[i] > puntajeMax) then begin
                puntajeMax:= vector[i];
                categoriaMax:= i;
            end;
        end;
    end;
procedure puntoC(l2: lista2);
    begin
        while (l2 <> nil) do begin
            if (igualParImpar(l2^.data.dni)) then
                writeln('El crítico ',l2^.data.nombre_completo,' tiene un DNI con igual cantidad de pares que impares (',l2^.data.dni,')');
            l2:= l2^.sig;
        end;
    end;
procedure puntoD(var l: lista; codEliminar: integer);
    var
        aux, ant: lista;
    begin
        aux:= l;
        while (aux <> nil) and (aux^.data.codigo <> codEliminar) do begin
            ant:= aux;
            aux:= aux^.sig;
        end;
        if (aux^.data.codigo = codEliminar) then begin //Revisar si el código fue encontrado
            if (aux = l) then
                l:= l^.sig //Mover a L un lugar mas a la derecha para eliminar la posición primera
            else
                ant^.sig:= aux^.sig;
            dispose(aux);
        end;
    end;
//PROGRAMA PRINCIPAL
var
    l, aux: lista;
    l2, aux2: lista2;
    categoriaMax: integer;
begin
    l:= nil;
    l2:=nil;
    categoriaMax:= 0;
    cargarLista(l);
    cargarLista2(l2);
    actualizarLista(l, l2);
    aux2:= l2;
    writeln;
    while (aux2 <> nil) do begin
        writeln('Codigo: ',aux2^.data.codigo,' / Elemento: ',aux2^.data.puntaje:2:2);
        aux2:= aux2^.sig;
    end;
    writeln;
    puntoB(l, categoriaMax);
    writeln('La categoría con mas puntaje es ',categoria);
    writeln;
    puntoC(l2);
    puntoD(l, 15);
    aux:= l;
    writeln;
    while (aux <> nil) do begin
        writeln('Codigo: ',aux^.data.codigo,' / Nuevo puntaje promedio: ',aux^.data.puntaje:2:2);
        aux:= aux^.sig;
    end;
end.
