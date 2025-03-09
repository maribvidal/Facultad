{3. Realizar un programa que presente un menú con opciones para:
a. Crear un archivo de registros no ordenados de empleados y completarlo con
datos ingresados desde teclado. De cada empleado se registra: número de
empleado, apellido, nombre, edad y DNI. Algunos empleados se ingresan con
DNI 00. La carga finaliza cuando se ingresa el String ‘fin’ como apellido.}

program pr1ej3a;

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
	
var
	archivo: archEmpleado;
	input: tipoEmpleado;
	nomArch: string;

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

begin
	write('INGRESE EL NOMBRE DEL ARCHIVO: '); readln(nomArch);
	Assign(archivo, nomArch);
	rewrite(archivo);
	leerEmpleado(input);
	while (input.apellido <> STR_CORTE) do begin
		write(archivo, input);
		writeln();
		leerEmpleado(input);
	end;
	close(archivo);
end.
