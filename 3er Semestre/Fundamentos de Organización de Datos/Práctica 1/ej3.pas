program pr1ej3;

const
	STR_CORTE = 'fin';

type
	tipoEmpleado = record
		nro: integer;
		apellido: string[15];
		nombre: string[15];
		edad: integer;
		DNI: integer;
	end;
	archEmpleado = file of tipoEmpleado;

{METODOS}
procedure leerEmpleado(var emp: tipoEmpleado);
	begin
		write('APELLIDO DEL EMPLEADO: '); readln(emp.apellido);
		if (emp.apellido <> STR_CORTE) then begin
			write('NOMBRE DEL EMPLEADO: '); readln(emp.nombre);
			write('EDAD DEL EMPLEADO: '); readln(emp.edad);
			write('DNI DEL EMPLEADO: '); readln(emp.DNI);
			write('NUMERO DEL EMPLEADO: '); readln(emp.nro);
		end;
	end;

procedure imprimirEmpleado(emp: tipoEmpleado);
	begin
		write('N ', emp.nro);
		write(' / DNI: ', emp.DNI);
		write(' / NOMBRE COMPLETO DEL EMPLEADO: ', emp.nombre, ' ',emp.apellido);
		write(' / EDAD: ', emp.edad);
		writeln;
	end;

procedure imprimirPorNomApe(var arch: archEmpleado; nombre, apellido: string);
	var
		emp_aux: tipoEmpleado;
	begin
		{Colocar puntero de elemento en el principio}
		seek(arch, 0);
		{Buscar si existe}
		while not eof(arch) do begin
			read(arch, emp_aux);
			if (emp_aux.nombre = nombre) or (emp_aux.apellido = apellido) then begin
				imprimirEmpleado(emp_aux); 
				writeln;
			end;
		end;
	end;

procedure imprimirContenido(var arch: archEmpleado);
	var
		emp_aux: tipoEmpleado;
	begin
		seek(arch, 0);
		while not eof(arch) do begin
			read(arch, emp_aux);
			imprimirEmpleado(emp_aux);
		end;
	end;
	
procedure imprimirPorEdad(var arch: archEmpleado);
	var
		emp_aux: tipoEmpleado;
	begin
		seek(arch, 0);
		while not eof(arch) do begin
			read(arch, emp_aux);
			if (emp_aux.edad > 70) then begin
				imprimirEmpleado(emp_aux);
			end;
		end;
	end;

{OPCIONES DEL MENU}
procedure consignaA(var arch: archEmpleado);
	var
		input: tipoEmpleado;
	begin
		rewrite(arch);
		leerEmpleado(input);
		while (input.apellido <> STR_CORTE) do begin
			write(arch, input);
			writeln();
			leerEmpleado(input);
		end;
	end;

procedure consignaB(var arch: archEmpleado);
	var
		input: string[15];
		input2: string[15];
	begin
		reset(arch);
		{Inciso I}
		write('INGRESE UN NOMBRE A BUSCAR: '); readln(input);
		write('INGRESE UN APELLIDO A BUSCAR: '); readln(input2);
		writeln;
		writeln('LOS SIGUIENTES EMPLEADOS CUMPLEN CON LAS CARACTERISTICAS');
		imprimirPorNomApe(arch, input, input2);
		writeln;
		{Inciso II}
		imprimirContenido(arch);
		writeln;
		{Inciso III}
		imprimirPorEdad(arch);
	end;

{PROGRAMA PRINCIPAL}
var
	archivo: archEmpleado;
	menuInput: integer;
	nomArch: string;

begin
	write('INGRESE EL NOMBRE DEL ARCHIVO: '); readln(nomArch);
	Assign(archivo, nomArch);
	write('QUE DESEA HACER (CREAR 0/LEER 1): '); readln(menuInput);
	if (menuInput = 0) then begin
		consignaA(archivo);
	end else if (menuInput = 1) then begin
		consignaB(archivo);
	end;
	close(archivo);
end.
