//Estoy seguro que alguno de los procedures puede ser un function
//Gonna do it in the future
program ej3pr3;
const
    corte_legajo = 0;
    corte_materia = -1;
type
    materia = record //Registro de los finales rendidos
        codigo: integer;
        nota: integer;
    end;
    lista = ^nodo; //Lista para almacenar finales
    nodo = record
        data: materia;
        sig: lista;
    end;
    alumno = record //Registro de los alumnos
        legajo: integer;
        DNI: integer;
        anoIngreso: integer;
        finales: lista;
    end;
    alumno2 = record //Registro de los alumnos para el punto F
        legajo: integer;
        promedio: real;
    end;
    arbol = ^nodo_arbol;
    nodo_arbol = record
        data: alumno;
        HI: arbol;
        HD: arbol;
    end;
    lista2 = ^nodo2; //Lista para el punto F
    nodo2 = record
        data: alumno2;
        sig: lista2;
    end;
function promediarNotas(l: lista):real; //Función para hacer promedio de las notas de los alumnos
    var
        prom: real;
        aux: integer;
    begin
        prom:= 0;
        aux:= 0;
        while (l <> nil) do begin
            prom:= prom + l^.data.nota;
            aux:= aux + 1;
            l:= l^.sig;
        end;
        promediarNotas:= (prom / aux); //Total de notas dividida por la cantidad de materias
    end;
//PUNTO A
procedure leerMateria(var m: materia);
    begin
        write('Código de la materia: '); readln(m.codigo);
        if (m.codigo <> corte_materia) then begin
            write('Nota del final: '); readln(m.nota);
        end;
    end;
procedure agregarNodo(var l: lista; dataM: materia);
    var
        aux: lista;
    begin
        new(aux);
        aux^.data:= dataM;
        aux^.sig:= l;
        l:= aux;
    end;
procedure cargarLista(var l: lista);
    var
        m: materia;
    begin
        leerMateria(m);
        while (m.codigo <> corte_materia) do begin
            agregarNodo(l, m);
            writeln;
            leerMateria(m);
        end;
    end;
procedure leerAlumno(var a: alumno);
    begin
        write('Legajo del alumno: '); readln(a.legajo);
        if (a.legajo <> corte_legajo) then begin
            write('DNI del alumno: '); readln(a.DNI);
            a.finales:= nil; //Inicializar lista
            cargarLista(a.finales);
        end;
    end;
procedure agregarArbol(var a: arbol; datA: alumno);
    begin
        if (a = nil) then begin
            new(a);
            a^.HI:= nil;
            a^.HD:= nil;
            a^.data:= datA;
        end else begin
            if (datA.legajo <= a^.data.legajo) then
                agregarArbol(a^.HI, datA)
            else
                agregarArbol(a^.HD, datA);
        end;
    end;
procedure cargarArbol(var a: arbol);
    var
        a2: alumno;
    begin
        leerAlumno(a2);
        while (a2.legajo <> corte_legajo) do begin
            agregarArbol(a, a2);
            writeln;
            leerAlumno(a2);
        end;
    end;
//PARA IMPRIMIR
procedure imprimirLista(l: lista);
    begin
        while (l <> nil) do begin
            writeln('Código de la materia: ',l^.data.codigo,' / Nota sacada: ',l^.data.nota);
            l:= l^.sig;
        end;
    end;
procedure imprimirAlumno(a: alumno);
    begin
        writeln('LEGAJO: ',a.legajo);
        writeln('DNI: ',a.DNI);
        writeln('AÑO DE INGRESO: ',a.anoIngreso);
        imprimirLista(a.finales);
        writeln;
    end;
procedure imprimirArbolEnOrden(a: arbol);
    begin
        if (a <> nil) then begin
            imprimirArbolEnOrden(a^.HI);
            writeln('LEGAJO: ',a^.data.legajo);
            imprimirLista(a^.data.finales);
            imprimirArbolEnOrden(a^.HD);
        end;
    end;
procedure puntoB(a: arbol; valor: integer); //Solo tiene que leer aquellos alumnos cuyo legajo sea inferior al valor ingresado
    begin
        if (a <> nil) then begin //El arbol no está vacío
            if (a^.data.legajo < valor) then begin
                imprimirAlumno(a^.data); //Imprimir la información del alumno
                puntoB(a^.HI, valor); //Acceder al nodo izquierdo de manera recursiva
                puntoB(a^.HD, valor); //Acceder al nodo izquierdo de manera recursiva
            end else begin //Si el valor es mayor o igual, entonces
                puntoB(a^.HI, valor); //ir directo al nodo izquierdo
            end;
        end;
    end;
procedure puntoC(a: arbol; var legajo: integer);
    begin
        if (a <> nil) then begin
            if (legajo < a^.data.legajo) then
                legajo:= a^.data.legajo;
            puntoC(a^.HD, legajo);
        end;
    end;
procedure puntoD(a: arbol; var DNI: integer); //No queda otra que recorrer toda la lista lmao
    begin
        if (a <> nil) then begin
            puntoD(a^.HI, DNI); //Ir por la izquierda
            if (DNI < a^.data.DNI) then
                DNI:= a^.data.DNI;
            puntoD(a^.HD, DNI); //Ir por la derecha
        end;
    end;
procedure puntoE(a: arbol; var cant: integer); //No hay método para buscar mas eficientemente así q toca recorrerla todaaaaa
    begin
        if (a <> nil) then begin //Siempre verificar primero que el arbol no se encuentre vacío
            puntoE(a^.HI, cant); //Buscar por la izquierda
            if (((a^.data.legajo) mod 2) <> 0) then //Verificar que no sea par
                cant:= cant + 1;
            puntoE(a^.HD, cant); //Buscar por la derecha
        end;
    end;
procedure puntoF(a: arbol; var legajoMax2: integer; var promMax: real); //Como no hay manera de recorrer la lista de manera mas eficiente, toca recorrerla toda
    begin
        if (a <> nil) then begin
            puntoF(a^.HI, legajoMax2, promMax);
            if (promMax < promediarNotas(a^.data.finales)) then begin //Actualizar máximo
                promMax:= promediarNotas(a^.data.finales);
                legajoMax2:= a^.data.legajo;
            end;
            puntoF(a^.HD, legajoMax2, promMax);
        end;
    end;
//Punto F
procedure agregarNodo2(var l: lista2; data: alumno2);
    var
        aux: lista2;
    begin
        new(aux);
        aux^.data:= data;
        aux^.sig:= l;
        l:= aux;
    end;
procedure puntoG(a: arbol; valor: integer; var listaEspecial: lista2); //Again, no hay busqueda optimizada
    var
        a2: alumno2;
    begin
        if (a <> nil) then begin
            puntoG(a^.HI, valor, listaEspecial);
            if (promediarNotas(a^.data.finales) > valor) then begin
                a2.legajo:= a^.data.legajo;
                a2.promedio:= promediarNotas(a^.data.finales);
                agregarNodo2(listaEspecial, a2);
            end;
            puntoG(a^.HD, valor, listaEspecial);
        end;
    end;
procedure imprimirListaEsp(listaEsp: lista2);
    begin
        while (listaEsp <> nil) do begin
            writeln('Legajo: ', listaEsp^.data.legajo, ' / promedio: ', listaEsp^.data.promedio:2:2);
            listaEsp:= listaEsp^.sig;
        end;
    end;
var
    a: arbol;
    legajoMax, legajoMax2, dniMax, cantImpar: integer;
    promMax: real;
    listaEspecial: lista2;
begin
    a:= nil;
    legajoMax:= -1;
    legajoMax2:= -1;
    listaEspecial:= nil;
    promMax:= 0;
    dniMax:= -1;
    cantImpar:= 0;
    cargarArbol(a);
    puntoB(a, 15);
    puntoC(a, legajoMax);
    puntoD(a, dniMax);
    puntoE(a, cantImpar);
    puntoF(a, legajoMax2, promMax);
    puntoG(a, 7, listaEspecial);
    writeln('Legajo mas grande encontrado: ', legajoMax);
    writeln('DNI mas grande encontrado: ', dniMax);
    writeln('Cantidad de legajos impares: ', cantImpar);
    writeln('El legajo del alumno con el mayor promedio es: ', legajoMax2,' / Su promedio es: ',promMax:2:2);
    imprimirListaEsp(listaEspecial);
end.
