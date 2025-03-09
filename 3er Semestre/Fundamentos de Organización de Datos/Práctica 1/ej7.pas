{7. b) Abrir el archivo binario y permitir la actualización del mismo. Se debe poder
agregar una novela y modificar una existente. Las búsquedas se realizan por
código de novela.
}
program pr1ej7;

Uses sysutils;

type
	novela = record
		codigo: integer;
		nombre: string[20];
		genero: string[20];
		precio: real;
	end;
	archivo_nov = file of novela;

procedure crearArchivo(var arch: archivo_nov);
	var
		archivo_texto: text;
		nov_aux: novela;
	begin
		rewrite(arch);
		Assign(archivo_texto, 'novelas.txt');
		reset(archivo_texto);
		while not eof(archivo_texto) do begin
			readln(archivo_texto, nov_aux.codigo, nov_aux.precio, nov_aux.genero);
			readln(archivo_texto, nov_aux.nombre);
			write(arch, nov_aux);
		end;
		close(archivo_texto);
		close(arch);
	end;

procedure leerNovela(var nov: novela);
	begin
		with nov do begin
			write(' > Codigo de la novela: '); readln(codigo);
			write(' > Nombre de la novela: '); readln(nombre);
			write(' > Genero de la novela: '); readln(genero);
			write(' > Precio de la novela: '); readln(precio);
		end;
		writeln;
	end;

procedure agregarNovela(var arch: archivo_nov);
	var
		nov_aux: novela;
	begin
		seek(arch, filesize(arch));
		leerNovela(nov_aux);
		write(arch, nov_aux);
	end;
	
procedure modificarNovela(var arch: archivo_nov);
	var
		nov_cod: integer;
		nov_aux: novela;
	begin
		write(' > Ingrese un codigo: '); readln(nov_cod);
		seek(arch, 0);
		read(arch, nov_aux);
		while (nov_cod <> nov_aux.codigo) do begin
			read(arch, nov_aux);
		end;
		if (nov_cod <> nov_aux.codigo) then begin
			writeln('No se encontro ese codigo en nuestro registro');
		end else begin
			seek(arch, filepos(arch)-1);
			writeln('Novela encontrada, modifiquela a su gusto');
			leerNovela(nov_aux);
			write(arch, nov_aux);
		end;
	end;

procedure actualizarArchivo(var arch: archivo_nov);
	var
		menu: integer;
	begin
		reset(arch);
		menu:= -1;
		while (menu <> 3) do begin
			writeln('QUE DESEA HACER: ');
			writeln(' - Agregar informacion: 1 ');
			writeln(' - Modificar informacion: 2 ');
			writeln(' - Salir: 3 ');
			writeln;
			write(' Accion: '); readln(menu);
			if (menu <> 3) then begin
				if (menu > 0) and (menu < 3) then begin
					case menu of
						1: agregarNovela(arch);
						2: modificarNovela(arch);
					end;
				end else begin
					writeln('Esa opcion no existe...');
				end;
			end else begin
				writeln('Cerrando...');
			end;
		end;
		close(arch);
	end;

{PROGRAMA PRINCIPAL}
var
	archivo: archivo_nov;
	user_input: string[20];
	menu: integer;
begin
	menu:= -1;
	write('Nombre del archivo que desea abrir: '); readln(user_input);
	Assign(archivo, user_input);
	writeln;
	while (menu <> 2) do begin
		write('QUE DESEA HACER (0 abrir archivo / 1 actualizar archivo / 2 cerrar programa): '); readln(menu);
		if (menu <> 2) then begin
			if (menu > -1) and (menu < 2) then begin
				case menu of
					0: crearArchivo(archivo);
					1: actualizarArchivo(archivo);
				end;
			end else begin
				writeln('Esa opcion no existe...');
			end;
		end else begin
			writeln('Cerrando programa...');
		end;
	end;
end.
