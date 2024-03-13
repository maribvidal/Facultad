{3. Realizar un programa que presente un menú con opciones para:
b. Abrir el archivo anteriormente generado y
i. Listar en pantalla los datos de empleados que tengan un nombre o apellido
determinado, el cual se proporciona desde el teclado.
ii. Listar en pantalla los empleados de a uno por línea.
iii. Listar en pantalla los empleados mayores de 70 años, próximos a jubilarse.}

program pr1ej3b;

type
	tipoEmpleado = record
		nro: integer;
		apellido: string[15];
		nombre: string[15];
		edad: integer;
		DNI: integer;
	end;
	archEmpleado = file of tipoEmpleado;

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
			writeln;
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
	
var
	archivo: archEmpleado;
	input: string[15];
	input2: string[15];
	nomArch: string;

begin
	write('INGRESE EL NOMBRE DEL ARCHIVO: '); readln(nomArch);
	Assign(archivo, nomArch);
	reset(archivo);
	{Inciso I}
	write('INGRESE UN NOMBRE A BUSCAR: '); readln(input);
	write('INGRESE UN APELLIDO A BUSCAR: '); readln(input2);
	writeln;
	writeln('LOS SIGUIENTES EMPLEADOS CUMPLEN CON LAS CARACTERISTICAS');
	imprimirPorNomApe(archivo, input, input2);
	writeln;
	{Inciso II}
	imprimirContenido(archivo);
	writeln;
	{Inciso III}
	imprimirPorEdad(archivo);
	close(archivo);
end.
