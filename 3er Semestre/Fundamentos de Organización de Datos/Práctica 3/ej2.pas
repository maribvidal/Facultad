//Definir un programa que genere un archivo con registros de longitud fija 
//conteniendo información de asistentes a un congreso a partir de la información obtenida por teclado. 
//Se deberá almacenar la siguiente información: nro de asistente, apellido y nombre, email, teléfono y D.N.I. 
//Implementar un procedimiento que, a partir del archivo de datos generado, 
//elimine de forma lógica todos los asistentes con nro de asistente inferior a 1000.
program pr3ej2;

const
	CORTE = 9999;
	PREFIJO = 'pr3ej2_';

type
	asistente = record
		nro: integer;
		apellidoNombre: string[40];
		email: string[30];
		telefono: integer;
		DNI: integer;
		end;

	archivo = file of asistente;

procedure Leer(var arch: archivo; var reg: asistente);
	begin
		if not eof(arch) then
			read(arch, reg)
		else
			reg.nro:= CORTE;
	end;

procedure LeerAsistente(var asi: asistente);
	begin
		writeln(' ---------- ');
		write('NUMERO: '); readln(asi.nro);
		write('NOMBRE COMPLETO: '); readln(asi.apellidoNombre);
		write('EMAIL: '); readln(asi.email);
		write('TELEFONO: '); readln(asi.telefono);
		write('DNI: '); readln(asi.DNI);
	end;

procedure ImprimirAsistente(asi: asistente);
	begin
		writeln(' ---------- ');
		writeln('NUMERO: ', asi.nro, ' / Nombre: ', asi.apellidoNombre, ' / Email: ', asi.email);
		writeln('Telefono: ', asi.telefono, ' / DNI: ', asi.DNI);
	end;
	
procedure GenerarArchivo(var arch: archivo);
	var
		registro: asistente;
		seguirLeyendo: char;
	begin
		//Inicializar variables
		seguirLeyendo:= 's';
		//Abrir archivo para su escritura
		Rewrite(arch);
		//Mientras se quiera seguir leyendo
		while ((seguirLeyendo = 's') or (seguirLeyendo = 'S')) do begin
			LeerAsistente(registro);
			write(arch, registro);
			writeln(' ---------- ');
			write('¿Desea seguir leyendo? (escriba "s" o "S" para continuar): '); readln(seguirLeyendo);
		end;
		//Cerrar archivo
		writeln(' ---------- ');
		close(arch);
	end;
procedure MarcarRegistros(var arch: archivo);
	var
		registro: asistente;
	begin
		Reset(arch);
		Leer(arch, registro);
		while (registro.nro <> CORTE) do begin
			//Eliminar de forma lógica los asistentes con número de asistente menor a 1000
			if (registro.nro < 1000) then begin
				registro.apellidoNombre:= '*' + registro.apellidoNombre; //Colocar marca
				seek(arch, filepos(arch)-1);
				write(arch, registro);
			end;
			Leer(arch, registro);
		end;
		close(arch);
	end;
procedure ImprimirArchivo(var arch: archivo);
	var
		registro: asistente;
	begin
		Reset(arch);
		Leer(arch, registro);
		while (registro.nro <> CORTE) do begin
			ImprimirAsistente(registro);
			writeln(' ---------- ');
			Leer(arch, registro);
		end;
		close(arch);
	end;
var
	arch: archivo;
	opcion: integer;
	userInput: string[20];
begin
	opcion:= -1;
	write('Nombre del archivo: '); readln(userInput);
	Assign(arch, PREFIJO + userInput);
	while (opcion <> 0) do begin
		write(' 1: Generar Archivo - 2: Baja Logica - 3: Imprimir Archivo - 0: Cerrar Programa ___'); readln(opcion);
		case opcion of
			1: GenerarArchivo(arch);
			2: MarcarRegistros(arch);
			3: ImprimirArchivo(arch);
		end;
	end;
	writeln(' Programa finalizado ');
end.
