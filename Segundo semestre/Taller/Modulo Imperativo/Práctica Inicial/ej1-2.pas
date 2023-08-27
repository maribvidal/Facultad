program untitled;
const 
    mat_const = 36;
	codigo_corte = 11111;
type 
    vector = array [1..mat_const] of integer;
	nota = 1..mat_const;
	alumno = record
		apellido: string;
		nro, ano: integer;
		materias: vector;
		dimL: integer;
	end;
	lista = ^nodo;
	nodo = record
		dato: alumno;
		sig: lista;
	end;
	alumno2 = record
		nro: integer;
		promedio: real;
	end;
	lista2 = ^nodo2;
	nodo2 = record
		dato: alumno2;
		sig: lista2;
	end;
procedure agregarAdelante(var l: lista; a: alumno);
    var
	    nue: lista;
    begin 
	    new(nue);
	    nue^.dato:= a;
	    nue^.sig:= l;
	    l:= nue;
    end;
procedure cargarVector(var v: vector; var dimL: integer);
	var
		notaa: integer;
	begin
		dimL:= 0;
		write('Nota: '); readln(notaa);
		while (dimL < mat_const) and (notaa > 4) do begin
			dimL:= dimL + 1;
			v[dimL]:= notaa;
			write(notaa);
			write('Nota: '); readln(notaa);
		end;
	end;
procedure leerAlumno(var a: alumno);
	begin
		write('Nro. Alumno: '); readln(a.nro);
		if (a.nro <> codigo_corte) then begin
			write('Apellido: '); readln(a.apellido);
			write('Año de ingreso: '); readln(a.ano);
			cargarVector(a.materias, a.dimL);
		end;
	end;
procedure cargarLista(var l: lista);
	var
		a: alumno;
	begin
		leerAlumno(a);
		while (a.nro <> codigo_corte) do begin
			agregarAdelante(l, a);
			writeln;
			leerAlumno(a);
		end;
    end;
procedure agregarAdelante2(var l2: lista2; a2: alumno2);
    var
	    nue: lista2;
    begin 
	    new(nue);
	    nue^.dato:= a2;
	    nue^.sig:= l2;
	    l2:= nue;
    end;
procedure recorrerLista(l: lista; var l2: lista2);
    var
        prom: real;
        i, dimL, alumnoNro: integer;
        a2: alumno2;
	begin
        while (l <> nil) do begin
		    alumnoNro:= l^.dato.nro;
		    dimL:= l^.dato.dimL;
		    prom:= 0;
		    while (i < dimL) do begin
		        prom:= prom + l^.dato.materias[i]; //Agregar la nota
		        write(l^.dato.materias[i]); writeln;
		        write(prom:2:2);
		        i:= i + 1; //Pasar a la siguiente materia
		    end;
		    a2.nro:= alumnoNro;
		    a2.promedio:= prom / mat_const;
		    agregarAdelante2(l2, a2);
		    i:= 0;
		    l:= l^.sig; //Pasar al siguiente elemento de la lista
	    end;
	end;
var
    l: lista;
    l2: lista2;
begin
    l:= nil;
    l2:= nil;
    cargarLista(l);
    recorrerLista(l, l2);
    
    //PRUEBA - Recorrer la lista 2
    while (l2 <> nil) do begin
        write('Número: ',l2^.dato.nro,' / Promedio: ',l2^.dato.promedio:2:2);
        writeln;
        l2:= l2^.sig;
    end;
end.
