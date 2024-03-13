{Realizar un algoritmo, que utilizando el archivo de números enteros no ordenados
creado en el ejercicio 1, informe por pantalla cantidad de números menores a 1500 y el
promedio de los números ingresados. El nombre del archivo a procesar debe ser
proporcionado por el usuario una única vez. Además, el algoritmo deberá listar el
contenido del archivo en pantalla.}

program pr1ej2;

Uses sysutils;

{CONSTANTES}
const
	NUM_CORTE = 30000;
	NUM_ESP = 1500;

{TIPOS}
type
	archivo_numero = file of integer;

{MÉTODOS}
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
	end;

{VARIABLES}
var
	num_arch: archivo_numero;
	num_input, num_prom, num_veces: integer;
	str_input: string;

{PROGRAMA PRINCIPAL}
begin
	{INICIALIZACIÓN}
	num_prom:= 0;
	num_veces:= 0;
	
	{CREAR ARCHIVO}
	write('INGRESE EL NOMBRE DEL ARCHIVO: '); readln(str_input);
	Assign(num_arch, str_input); {Asignar nombre lógico a un archivo físico}
	rewrite(num_arch); {Crearlo y, por lo tanto, solo hacer operaciones de escritura}
	
	{CARGAR NÚMEROS}
	write('INGRESE UN NÚMERO: '); readln(num_input);
	while (num_input <> NUM_CORTE) do begin
		write(num_arch, num_input);
		num_prom:= num_prom + num_input;
		if (num_input < NUM_ESP) then begin
			num_veces:= num_veces + 1;
		end;
		write('INGRESE UN NÚMERO: '); readln(num_input);
	end;
	
	{IMPRIMIR EL CONTENIDO DEL ARCHIVO EN PANTALLA}
	writeln('Numeros inferiores a 1500: ', num_veces);
	writeln('Promedio de los números ingresados: ', (num_prom/filesize(num_arch)):2:0);
	debug(num_arch);
	
	{CERRAR ARCHIVO}
	close(num_arch);
end.
