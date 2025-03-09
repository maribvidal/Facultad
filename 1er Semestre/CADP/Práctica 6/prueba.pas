//El enunciado aclara que ya se DISPONE con un listado de elementos, lo que quiere decir que no tenemos que cargar la lista nosotros.
program ejercicio_parcial;
const
    dimF_vectorTurno = 4; //Son 4 turnos
type
    lista = ^nodo;
    ingresante = record //Registro para el ingresante
        dni: integer;
        nombre: string;
        apellido: string;
        nota: 4..10; //Utilizar subrango del 4 al 10
        turno: 1..4;
        asistencias: 1..12;
    end;
    nodo = record //Registro para el nodo
        data: ingresante;
        sig: lista;
    end;
    vector_turno = array [1..dimF_vectorTurno] of integer; //Crear un vector para mantener la cuenta de los alumnos que hay en cada turno
procedure crearNodo(var nodo: lista);
    begin
        nodo:= nil; //Asignarle la dirección NIL al NODO
    end;
procedure agregarNodo(var l: lista; v: ingresante); //Agregar de adelante
    var
        aux: lista;
    begin
        new(aux); //Crear nueva dirección de memoria
        aux^.data:= v; //Asignarle al nodo auxiliar el registro ingresado
        aux^.sig:= nil; //Asignarle al 'siguiente' del nodo auxiliar NIL
        if (l = nil) then begin
            l:= aux;
        end else begin
            aux^.sig:= l;
            l:= aux; //Asignarle a L el nodo auxiliar, y de esta forma el nodo L va a tener el registro cargado, la dirección de memoria creada adentro, y el siguiente va a ser L
        end;
    end;
procedure nuevaLista(l: lista; var l2: lista);
    begin
        while (l <> nil) do begin //Recorrer toda la PRIMERA LISTA para formar la SEGUNDA
            if (l^.data.asistencias >= 8) then begin //Si el alumno cuenta con al menos 8 asistencias...
                agregarNodo(l2, l^.data); //Agregar el registro INGRESANTE, que se encuentra en la dirección del elemento de la lista L actual, a la SEGUNDA LISTA
            end;
            l:= l^.sig; //Pasar al siguiente elemento
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
        while (i <= dimF_vectorTurno) do begin //Recorrer todo el vector
            if (vector[i] > alumnosMax) then begin //Si la cantidad de alumnos en un TURNO es mayor que la variable...
                turnoMax:= i; //Actualizar variables
                alumnosMax:= vector[i];
            end;
            i:= i + 1; //Seguir con el próximo indice
        end;
        writeln('El turno con mayor cantidad de alumnos en condiciones de rendir el examen es el ',turnoMax);
    end;
var
    l1, l2: lista;
begin
    crearNodo(l1);
    crearNodo(l2);
    cargarLista(l1); //No escribimos los procesos requeridos para esto porque el enunciado aclara que ya se DISPONE con esta información
    nuevaLista(l1, l2);
    imprimirLista(l2);
end.
