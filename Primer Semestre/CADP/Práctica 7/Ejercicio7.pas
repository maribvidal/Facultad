program Ejercicio7;
const
    corte = -1;
    dimF = 24;
type
    t_rango = -1..9999;
    t_nota = 0..10;
    t_materias = 1..24;
    materias = array [t_materias] of t_nota;
    alumno = record
        nro: t_rango;
        apellido: string[15];
        nombres: string[20];
        correo: string[20];
        anioIngreso: t_rango;
        anioEgreso: t_rango;
        notas: materias; //Los aplazos no se registran
    end;
    lista = ^nodo;
    nodo = record
        data: alumno;
        sig: lista;
    end;
function soloDigitosImpares(nro: t_rango):boolean;
    var
        pares, impares: integer;
        condicion: boolean;
    begin
        pares:= 0;
        impares:= 0;
        condicion:= false;
        while (nro <> 0) do begin
            if ((nro mod 10) mod 2) = 0 then
                pares:= pares + 1
            else
                impares:= impares + 1;
            nro:= nro div 10; //Buscar otro dígito
        end;
        if (pares = 0) and (impares <> 0) then
            condicion:= true;
        soloDigitosImpares:= condicion;
    end;
procedure swap(var a, b: t_nota);
	var
		temp: t_nota;
	begin
		temp:= a;
		a:= b;
		b:= temp;
	end;
procedure bubbleSort(var v: materias);
    var
        i, j: integer;
    begin
        for i:= 1 to dimF do begin
            for j:= 1 to (dimF-i) do begin
                if (v[j] < v[j+1]) then
                    swap(v[j], v[j+1]);
            end;
        end;
    end;
procedure leerAlumno(var a: alumno);
    var
        i: integer;
        nota: t_nota;
    begin
        nota:= 0;
        write('Número de alumno: '); readln(a.nro);
        if (a.nro <> corte) then begin
            write('Apellido del alumno: '); readln(a.apellido);
            write('Nombre(s) del alumno: '); readln(a.nombres);
            write('Correo electrónico del alumno: '); readln(a.correo);
            write('Año de ingreso del alumno: '); readln(a.anioIngreso);
            write('Año de egreso del alumno: '); readln(a.anioEgreso);
            
            //Inicializar vector
            for i:= 1 to dimF do begin
                a.notas[i]:= 0;
            end;    
        
            //Asignar notas
            for i:= 1 to dimF do begin
                write('Nota del alumno [',a.nro,']: '); readln(nota);
                if (nota > 3) then
                    a.notas[i]:= nota;
            end;
            
            //Ordenar notas del vector de forma descendente
            bubbleSort(a.notas);
        end;
    end;
procedure agregarNodo(var l: lista; a: alumno);
    var
        aux: lista;
    begin
        new(aux);
        aux^.data:= a;
        aux^.sig:= nil;
        if (l <> nil) then
            aux^.sig:= l;
        l:= aux;
    end;
procedure cargarLista(var l: lista);
    var
        a: alumno;
    begin
        leerAlumno(a);
        while (a.nro <> corte) do begin
            agregarNodo(l, a);
            writeln;
            leerAlumno(a);
        end;
    end;
procedure puntoA(l: lista);
    var
        i: integer;
        promedio: real;
    begin
        while (l <> nil) do begin //Recorrer la lista
            promedio:= 0;
            for i:= 1 to dimF do begin //Agregar todas las notas a una variable acumuladora
                promedio:= promedio + l^.data.notas[i];
            end;
            writeln('Promedio de notas del alumno ',l^.data.nombres,': ',(promedio/24):2:2);
            l:= l^.sig;
        end;
    end;
procedure puntoB(l: lista; var cantEsp: integer);
    begin
        while (l <> nil) do begin
            if (l^.data.anioIngreso = 2012) and (soloDigitosImpares(l^.data.nro)) then
                cantEsp:= cantEsp + 1;
            l:= l^.sig;
        end;
    end;
procedure actualizarMaximo(a1: alumno; tiempoActual: integer; var a2, a3: alumno; var t1, t2: integer);
    begin
        writeln(a3.nombres);
        if (tiempoActual < t1) then begin
            t2:= t1;
            a3:= a2;
            t1:= tiempoActual;
            a2:= a1;
        end else if (tiempoActual < t2) then begin
            t2:= tiempoActual;
            a3:= a1;
        end;
    end;
procedure puntoC(l: lista; var alumnoMax1, alumnoMax2: alumno);
    var
        tiempoActual, tiempoMax1, tiempoMax2: integer;
    begin
        tiempoMax1:= 9999;
        tiempoMax2:= 9999;
        while (l <> nil) do begin
            tiempoActual:= l^.data.anioEgreso - l^.data.anioIngreso;
            actualizarMaximo(l^.data, tiempoActual, alumnoMax1, alumnoMax2, tiempoMax1, tiempoMax2);
            l:= l^.sig;
        end;
    end;
procedure eliminarElemLista(var l: lista; nroIngresado: integer);
    var
        aux, ant: lista;
    begin
        aux:= l;
        while (aux <> nil) and (aux^.data.nro <> nroIngresado) do begin
            ant:= aux;
            aux:= aux^.sig;
        end;
        if (l <> nil) then begin
            if (aux^.data.nro = nroIngresado) then begin
                if (aux = l) then begin
                    l:= aux^.sig; //Mover al nodo ingresado a la siguiente posición
                end else begin
                    ant^.sig:= aux^.sig; //Hacer que el siguiente del anterior sea el siguiente del actual, así la lista se encuentra enlazada
                end;
                dispose(aux); //Liberar la dirección de memoria de AUX
                writeln('El número ',nroIngresado,' fue eliminado con éxito de la lista');
            end;
        end else begin
            writeln('El número no fue encontrado dentro de la lista :(');
        end;
    end;
var
    alumnoMax1, alumnoMax2: alumno;
    cantEsp, nroAlumno: integer;
    l: lista;
begin
    l:= nil;
    cargarLista(l);
    writeln;
    puntoA(l);
    writeln;
    puntoB(l, cantEsp);
    writeln('La cantidad de alumnos ingresantes 2012 cuyo número de alumno está compuesto únicamente por dígitos impares: ',cantEsp);
    writeln;
    puntoC(l, alumnoMax1, alumnoMax2);
    writeln(alumnoMax1.apellido,' ',alumnoMax1.nombres,' ',alumnoMax1.correo);
    writeln(alumnoMax2.apellido,' ',alumnoMax2.nombres,' ',alumnoMax2.correo);
    write('Ingrese un número de alumno: '); readln(nroAlumno);
    eliminarElemLista(l, nroAlumno);
    while (l <> nil) do begin
        writeln(l^.data.nro);
        l:= l^.sig;
    end;
end.
