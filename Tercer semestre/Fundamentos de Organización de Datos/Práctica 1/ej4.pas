program pr1ej3;

Uses sysutils;

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
	
procedure controlUnicidad(var arch: archEmpleado; emp: tipoEmpleado);
	var
		posVieja: integer;
		encontrado: boolean;
		emp_aux: tipoEmpleado;
	begin
		encontrado:= false;
		posVieja:= FilePos(arch);
		{Irse al principio del archivo y buscar}
		seek(arch, 0);
		while not eof(arch) and not (encontrado) do begin
			read(arch, emp_aux);
			if (emp.nro = emp_aux.nro) then
				encontrado:= true;
		end;
		{Devolver la posición original}
		seek(arch, posVieja);
		if not (encontrado) then
			write(arch, emp)
		else
			writeln('ESE NUMERO DE USUARIO YA SE ENCUENTRA USADO, PRUEBE CON OTRO');
	end;
	
procedure buscarEmpPorNum(var arch: archEmpleado; nro: integer; var emp_pos: integer);
	var
		emp_aux: tipoEmpleado;
	begin
		emp_pos:= -1;
		while not eof(arch) and not (emp_pos <> -1) do begin
			read(arch, emp_aux);
			if (emp_aux.nro = nro) then
				emp_pos:= FilePos(arch);
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
	
procedure consignaC(var arch: archEmpleado);
	var
		input: tipoEmpleado;
	begin
		reset(arch);
		seek(arch, filesize(arch)); {Ir al final del archivo para agregar}
		leerEmpleado(input);
		while (input.apellido <> STR_CORTE) do begin
			controlUnicidad(arch, input);
			writeln();
			leerEmpleado(input);
		end;
	end;
	
procedure consignaD(var arch: archEmpleado);
	var
		emp_pos, input1, input2: integer;
		emp_nue: tipoEmpleado;
	begin
		reset(arch);
		write('INGRESE EL NUMERO DEL USUARIO A QUIEN QUIERA MODIFICARLE LA EDAD: '); readln(input1);
		write('INGRESE SU NUEVA EDAD: '); readln(input2);
		buscarEmpPorNum(arch, input1, emp_pos);
		if (emp_pos <> -1) then begin
			seek(arch, emp_pos - 1);
			read(arch, emp_nue);
			write('SE LE REEMPLAZO LA EDAD DE ',emp_nue.edad,' A ');
			emp_nue.edad:= input2;
			seek(arch, emp_pos - 1);
			write(arch, emp_nue);
			write(input2);
		end else begin
			writeln('NO SE ENCUENTRA UN USUARIO CON ESE NUMERO');
		end;
	end;
	
procedure consignaE(var arch: archEmpleado);
	var
		txt: text;
		emp_aux: tipoEmpleado;
	begin
		Assign(txt, 'todos_empleados.txt');
		rewrite(txt);
		while not eof(arch) do begin
			read(arch, emp_aux);
			writeln('log');
			writeln(txt, 'Numero ', emp_aux.nro,' / DNI: ', emp_aux.DNI, ' / ',emp_aux.nombre, ' ', emp_aux.apellido, ' / Edad: ',emp_aux.edad);
		end;
		close(txt);
	end;

{PROGRAMA PRINCIPAL}
var
	archivo: archEmpleado;
	menuInput: integer;
	nomArch: string;

begin
	write('INGRESE EL NOMBRE DEL ARCHIVO: '); readln(nomArch);
	Assign(archivo, nomArch);
	write('QUE DESEA HACER (CREAR 0/LEER 1/AGREGAR 2/MODIFICAR_EDAD 3/EXPORTAR_TEXTO 4): '); readln(menuInput);
	case menuInput of
		0: consignaA(archivo);
	    1: consignaB(archivo);
	    2: consignaC(archivo);
	    3: consignaD(archivo);
	    4: consignaE(archivo);
	end;
	close(archivo);
end.
