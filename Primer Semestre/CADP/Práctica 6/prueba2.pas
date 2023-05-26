program Puntero;
type
    lista = ^nodo;
    ingresante = record
        dni: integer;
        nombre: string;
        apellido: string;
        nota: 4..10;
        turno: 1..4;
        asistencias: integer;
    end;
    nodo = record
        data: ingresante;
        sig: lista;
    end;
    vector_turno = array [1..4] of integer; //Crear un vector para mantener la cuenta de los alumnos que hay en cada turno
procedure crearNodo(var n: lista);
    begin
        n:= nil;
    end;
procedure leerIngresante(var i: ingresante);
    var
        j, aux: integer;
        texto: string;
    begin
        aux:= 0;
        j:= 1;
        write('DNI >'); readln(i.dni);
        write('NOMBRE >'); readln(i.nombre);
        write('APELLIDO >'); readln(i.apellido);
        write('NOTA >'); readln(i.nota);
        write('TURNO >'); readln(i.turno);
        while (j <= 12) do begin
            write('P O A: '); readln(texto);
            if (texto = 'P') then begin
                aux:= aux + 1;
            end;
            j:= j + 1;
        end;
        i.asistencias:= aux;
    end;
procedure agregarNodo(var l: lista; i: ingresante); //Agregar método adelante
    var
        nuevo_nodo: lista;
    begin
        new(nuevo_nodo);
        nuevo_nodo^.data:= i;
        nuevo_nodo^.sig:= nil;
        if (l = nil) then begin
            l:= nuevo_nodo;
        end else begin
            nuevo_nodo^.sig:= l;
            l:= nuevo_nodo;
        end;
    end;
procedure cargarLista(var l: lista);
    var
        i: ingresante;
        aux: integer;
        preguntar: string;
    begin
        aux:= 1;
        while (aux <> 0) do begin
            leerIngresante(i);
            agregarNodo(l, i);
            write('¿Seguir leyendo lista? (SI/NO): '); readln(preguntar);
            if (preguntar = 'NO') then begin
                aux:= 0;
            end;
        end;
    end;
procedure procesarLista(l: lista; var l2: lista);
    begin
        while (l <> nil) do begin
            if (l^.data.asistencias >= 8) then begin
                agregarNodo(l2, l^.data);
            end;
            l:= l^.sig;
        end;
    end;
function elDNIPoseeAlgunCero(dni: integer):boolean;
    var
        aux: integer;
        condicion: boolean;
    begin
        condicion:= false; //Comencemos asumiendo que la condición (el DNI posee algún cero) es falsa
        while (dni <> 0) and not (condicion) do begin //Mientras el DNI no sea 0 y la CONDICION sea FALSA
            aux:= dni mod 10;
            if (aux = 0) then begin
                condicion:= true; //La condición es verdadera porque hay un cero
            end;
            dni:= dni div 10;
        end;
        elDNIPoseeAlgunCero:= condicion;
    end;
procedure imprimirLista(l: lista);
    var
        i, alumnosMax, turnoMax, cant_alumnos: integer;
        vector: vector_turno;
    begin
        i:= 1;
        alumnosMax:= -1;
        turnoMax:= 0;
        cant_alumnos:= 0;
        while (l <> nil) do begin //Mientras no se haya alcanzado el último elemento
            //PUNTO B INCISO 1
            if (l^.data.nota >= 8) then begin //Si el alumno se sacó una nota igual o mayor a 8...
                writeln('Nombre: ',l^.data.nombre);
                writeln('Apellido: ',l^.data.apellido);
                writeln('DNI: ',l^.data.dni);
            end;
            
            //PUNTO B INCISO 3
            if (not (elDNIPoseeAlgunCero(l^.data.dni)) then begin
                cant_alumnos:= cant_alumnos + 1;
            end;
            
            //PUNTO B INCISO 2
            vector[l^.data.turno]:= vector[l^.data.turno] + 1;
            l:= l^.sig; //Pasar al siguiente elemento
        end;
        writeln('La cantidad de alumnos cuyo DNI no posee ningún 0 es de ',cant_alumnos);
        
        //BUSCAR EL TURNO CON MAYOR CANTIDAD DE ALUMNOS
        while (i <= 4) do begin //Recorrer todo el vector
            if (vector[i] > alumnosMax) then begin //Si la cantidad de alumnos en un TURNO es mayor que la variable...
                turnoMax:= i; //Actualizar variables
                alumnosMax:= vector[i];
            end;
            i:= i + 1; //Seguir con el próximo indice
        end;
        writeln('El turno con mayor cantidad de alumnos en condiciones de rendir el examen es el ',turnoMax);
    end;
var
    l, l2: lista;
begin
    crearNodo(l);
    crearNodo(l2);
    cargarLista(l);
    procesarLista(l, l2);
    imprimirLista(l2);
end.
