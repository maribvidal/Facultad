program pr1ej6;

Uses sysutils;

const
	STR_CORTE = 'fin';
	
type
	celular = record
		codigo: integer;
		nombre: string[20];
		desc: string[200];
		marca: string[10];
		precio: real;
		stock_min: integer;
		stock_disp: integer;
	end;
	archivocel = file of celular;

{PROGRAMAS SECUNDARIOS}
procedure leerCelular(var c: celular);
	begin
		with c do begin
			write('Ingrese el codigo del celular: '); readln(codigo);
			write('Ingrese el nombre del celular: '); readln(nombre);
			write('Ingrese la descripcion del celular: '); readln(desc);
			write('Ingrese la marca del celular: '); readln(marca);
			write('Ingrese el precio del celular: '); readln(precio);
			write('Ingrese el stock minimo del celular: '); readln(stock_min);
			write('Ingrese el stock actual del celular: '); readln(stock_disp);
		end;
	end;
	
procedure imprimirInfoCelular(c: celular);
	begin
		with c do
			writeln(codigo, ' / NOMBRE: ', nombre, ' / DESC.: ', desc, ' / MARCA: ', marca, ' / PRECIO: ', precio);
	end;
	
{Inciso A}
procedure crearArchivo(var arch: archivocel);
	var
		cel_aux: celular;
		archivo_texto: text;
	begin
		{Inicialización}
		Assign(archivo_texto, 'celulares.txt');
		rewrite(arch);
		reset(archivo_texto);
		
		while not eof(archivo_texto) do begin
			readln(archivo_texto, cel_aux.codigo, cel_aux.nombre, cel_aux.desc);
			readln(archivo_texto, cel_aux.marca, cel_aux.precio, cel_aux.stock_min);
			readln(archivo_texto, cel_aux.stock_disp);
			write(arch, cel_aux);
		end;
		
		close(archivo_texto);
		close(arch);
	end;

{Inciso B}
procedure listarDatos(var arch: archivocel);
	var
		cel_aux: celular;
	begin
		reset(arch);
		while not eof(arch) do begin
			read(arch, cel_aux);
			if (cel_aux.stock_disp < cel_aux.stock_min) then
				imprimirInfoCelular(cel_aux);
		end;
		close(arch);
	end;

{Inciso C}
procedure listarCelulares(var arch: archivocel);
	var
		cel_aux: celular;
		user_input: string[200];
	begin
		reset(arch);
		write('Ingrese una descripcion: '); readln(user_input);
		while not eof(arch) do begin
			read(arch, cel_aux);
			if (cel_aux.desc = user_input) then
				imprimirInfoCelular(cel_aux);
		end;
		close(arch);
	end;

{Inciso D}
procedure exportarArchivo(var arch: archivocel);
	var
		archivo_texto: text;
		cel_aux: celular;
	begin
		Assign(archivo_texto, 'celulares.txt');
		reset(arch);
		rewrite(archivo_texto);
		while not eof(arch) do begin
			read(arch, cel_aux);
			writeln(archivo_texto, cel_aux.codigo, cel_aux.nombre, cel_aux.desc);
			writeln(archivo_texto, cel_aux.marca, cel_aux.precio, cel_aux.stock_min);
			writeln(archivo_texto, cel_aux.stock_disp);
		end;
		close(archivo_texto);
		close(arch);
	end;
	
{Inciso E}
procedure agregarInformacion(var arch: archivocel);
	var
		cel_aux: celular;
		user_input: string[1];
	begin
		reset(arch);
		seek(arch, filesize(arch));
		user_input:= ' ';
		while (user_input <> 'N') do begin
			write('Ingrese S si quiere agregar un celular, ingrese N en caso contrario: '); readln(user_input);
			if (user_input = 'S') then begin
				leerCelular(cel_aux);
				write(arch, cel_aux);
			end;
		end;
		close(arch);
	end;

{PROGRAMA PRINCIPAL}
var
	archivo: archivocel;
	menu_input: integer;
	nombre_archivo: string[20];
begin
	{Inicializar}
	menu_input:= -1;
	write('Nombre del archivo: '); readln(nombre_archivo);
	Assign(archivo, nombre_archivo);
	writeln;
	writeln(' PROGRAMA PARA TIENDA DE CELULARES ');
	
	
	{Menu}
	while (menu_input <> 0) do begin
		writeln('>>0 - Cerrar programa ');
		writeln('>>1 - Crear archivo ');
		writeln('>>2 - Listar datos con stock menor al minimo ');
		writeln('>>3 - Listar celulares con tal descripción ');
		writeln('>>4 - Exportar archivo (texto) ');
		writeln('>>5 - Agregar informacion ');
		writeln;
		write('Que opcion elige: '); readln(menu_input);
		
		// Comprobar el input
		if (menu_input <> 0) then begin
			if (menu_input < 6) and (menu_input > 0) then begin
				writeln;
				case menu_input of
					1: crearArchivo(archivo);
					2: listarDatos(archivo);
					3: listarCelulares(archivo);
					4: exportarArchivo(archivo);
					5: agregarInformacion(archivo);
				end;
			end else begin
				writeln('Lo sentimos, esa opcion no existe');
			end;
		end;
		writeln;
	end;
end.
