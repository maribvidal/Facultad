program pr1ej1;

Uses sysutils;

{CONSTANTES}
const
	NUM_CORTE = 30000;

{TIPOS}
type
	archivo_numero = file of integer;

procedure debug(var archivo: archivo_numero);
	var
		tipo_dato: integer;
	begin
		{Ir al principio del archivo}
		seek(archivo, 0);
		while not eof(archivo) do begin
			read(archivo, tipo_dato);
			write(tipo_dato, ' ');
		end;
		writeln('En el archivo hay ', filesize(archivo), 'datos.');
	end;

{VARIABLES}
var
	num_arch: archivo_numero;
	num_input: integer;
	str_input: string;

{PROGRAMA PRINCIPAL}
begin
	{CREAR ARCHIVO}
	write('INGRESE EL NOMBRE DEL ARCHIVO: '); readln(str_input);
	Assign(num_arch, str_input); {Asignar nombre lógico a un archivo físico}
	rewrite(num_arch); {Crearlo y, por lo tanto, solo hacer operaciones de escritura}
	
	{CARGAR NÚMEROS}
	write('INGRESE UN NÚMERO: '); readln(num_input);
	while (num_input <> NUM_CORTE) do begin
		write(num_arch, num_input);
		write('INGRESE UN NÚMERO: '); readln(num_input);
	end;
	
	{PROBAR QUE TODO HAYA SALIDO BIEN}
	debug(num_arch);
	
	{CERRAR ARCHIVO}
	close(num_arch);
end.
