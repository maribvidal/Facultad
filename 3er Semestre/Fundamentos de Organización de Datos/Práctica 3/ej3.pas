//En vez de usar una lista usé un campo extra en cada registro, no sé si esté bien

program pr3ej3;

const
	CORTE = 9999;
	PREFIJO = 'pr3ej3_';

type
	string_campo = string[20];

	novela = record
		codigo: integer;
		genero: string_campo;
		nombre: string_campo;
		duracion: integer;
		director: string_campo;
		precio: real;
		proximaPos: integer; //Lista
		end;
		
	archivo_novela = file of novela;

//Módulos generales	
procedure CargarRegistro(var reg: novela);
	begin
		write(' > Codigo: '); readln(reg.codigo);
		write(' > Genero: '); readln(reg.genero);
		write(' > Nombre: '); readln(reg.nombre);
		write(' > Duracion: '); readln(reg.duracion);
		write(' > Director: '); readln(reg.director);
		write(' > Precio: '); readln(reg.precio);
		reg.proximaPos:= 1; //Asumimos que todas las posiciones van a estar en negativo
	end;
	
procedure ImprimirRegistro(reg: novela);
	begin
		writeln(' - Codigo: ', reg.codigo);
		writeln(' - Genero: ', reg.genero);
		writeln(' - Nombre: ', reg.nombre);
		writeln(' - Duracion: ', reg.duracion);
		writeln(' - Director: ', reg.director);
		writeln(' - Precio: ', reg.precio:2:2);
	end;

procedure Leer(var arch: archivo_novela; var reg: novela);
	begin
		if not eof(arch) then
			read(arch, reg)
		else
			reg.codigo:= CORTE;
	end;

//Primer punto
procedure GenerarArchivo(var arch: archivo_novela);
	var
		reg: novela;
		seguirLeyendo: string_campo;
	begin
		seguirLeyendo:= 'si';
		Rewrite(arch);
		//Crear el primer campo ficticio para la lista
		reg.codigo:= 0; //No hay espacio libre
		write(arch, reg);
		//Escribir archivo
		while (seguirLeyendo = 'si') or (seguirLeyendo = 'Si') do begin
			CargarRegistro(reg);
			write(arch, reg);
			write(' * Seguir leyendo? '); readln(seguirLeyendo);
		end;
		close(arch);
	end;
	
//Segundo punto
//	INCISO A
procedure InsertarNovela(var arch: archivo_novela);
	var
		reg, primerReg, insertar: novela;
		posLibre: integer;
	begin
		Reset(arch);
		//Leer el nuevo registro
		CargarRegistro(insertar); 
		//Asumimos que en la primera posición se encuentra el registro ficticio
		read(arch, primerReg);
		//Si hay espacio libre, recuperarlo
		if (primerReg.codigo <> 0) then begin
			posLibre:= primerReg.codigo * -1;
			//Insertar registro
			seek(arch, posLibre - 1);
			read(arch, reg); //Leer archivo por si tiene proximaPos
			seek(arch, posLibre - 1);
			write(arch, insertar);
			//Ver si hay mas espacio en la lista invertida
			if (reg.proximaPos <> -1) then
				posLibre:= reg.proximaPos
			else
				posLibre:= 0;
			//Volver al registro ficticio
			seek(arch, 0);
			primerReg.codigo:= posLibre;
			write(arch, primerReg);
		end else begin
			//Si el código del registro ficticio es 0, eso significa que no hay espacios libres
			//Y por lo tanto vamos a tener que insertar el registro nuevo al final
			seek(arch, filesize(arch));
			write(arch, insertar);
		end;
		close(arch);
	end;

//	INCISO B
procedure ModificarNovela(var arch: archivo_novela);
	var
		codigoBuscado: integer;
		modificado: boolean;
		reg: novela;
	begin
		write(' > Ingrese el codigo de la novela que desea modificar: '); readln(codigoBuscado);
		modificado:= false;
		Reset(arch);
		Leer(arch, reg);
		while (reg.codigo <> CORTE) and not (modificado) do begin
			if (reg.codigo = codigoBuscado) then begin
				CargarRegistro(reg);
				seek(arch, filepos(arch)-1);
				write(arch, reg);
				modificado:= true;
			end;
			Leer(arch, reg);
		end;
		if not (modificado) then
			writeln(' * Lo lamentamos, no se ha encontrado dicho registro');
		close(arch);
	end;

//	INCISO C
procedure EliminarNovela(var arch: archivo_novela);
	var
		codigoBuscado: integer;
		encontrado: boolean;
		posRegistro, posNueva: integer;
		regCabecera, reg: novela;
	begin
		//Inicializar variables
		posRegistro:= 0;
		encontrado:= false;
		write(' > Ingrese el codigo de la novela que desea eliminar: '); readln(codigoBuscado);
		Reset(arch);
		//Primero, ver si el registro ficticio tiene alguna posicion ya guardada, y si la tiene, almacenarla
		read(arch, regCabecera);
		if (regCabecera.codigo <> 0) then
			posRegistro:= regCabecera.codigo;
		//Buscar registro
		Leer(arch, reg);
		while (reg.codigo <> CORTE) and not (encontrado) do begin
			if (reg.codigo = codigoBuscado) then begin
				encontrado:= true;
				//Comprobar si el registro no está eliminado
				if (reg.proximaPos < 1) then begin
					writeln(' * El registro ya se encontraba eliminado');
				end else begin
					posNueva:= filepos(arch);
					seek(arch, filepos(arch)-1);
					//Si no está borrada, primero agregarle la marca
					reg.nombre:= '@' + reg.nombre;
					//Luego, colocar la posición del último registro borrado en la proximaPos de este registro
					reg.proximaPos:= posRegistro;
					write(arch, reg);
					//Luego, colocar la nueva posicion borrada en el registro cabecera
					seek(arch, 0);
					regCabecera.codigo:= posNueva * -1;
					write(arch, regCabecera);
					
				end;
			end;
			Leer(arch, reg);
		end;
		close(arch);
	end;
	
//Tercer punto
procedure ExportarNovelas(var arch: archivo_novela);
	var
		reg: novela;
		texto: Text;
	begin
		Assign(texto, PREFIJO + 'novelas.txt');
		Reset(arch);
		Rewrite(texto);
		read(arch, reg); //No nos interesa la cabecera
		Leer(arch, reg);
		//Exportar todas las novelas, incluso las que están borradas lógicamente
		while (reg.codigo <> CORTE) do begin
			writeln(texto, reg.codigo, ' / Genero: ', reg.genero, ' / Nombre: ', reg.nombre);
			writeln(texto, reg.duracion, ' horas / Precio: ', reg.precio:2:2, ' / Director: ', reg.director);
			writeln(texto, '');
			Leer(arch, reg);
		end;
		close(texto);
		close(arch);
	end;
	
//Segundo menu
procedure MenuModificarArchivo(var arch: archivo_novela);
	var
		menuOpcion: integer;
	begin
		menuOpcion:= -1;
		while (menuOpcion <> 0) do begin
			writeln(' ---    --- ');
			writeln(' 1: Insertar Novela - 2: Modificar Novela - 3: Eliminar Novela - 0: Salir del Menu ');
			write(' ---: '); readln(menuOpcion);
			if (menuOpcion < 0) and (menuOpcion > 3) then begin
				writeln(' ERROR: Ingrese una opcion valida ');
			end else begin
				writeln(' --- YYY --- YYY --- YYY --- ');
				case menuOpcion of
					1: InsertarNovela(arch);
					2: ModificarNovela(arch);
					3: EliminarNovela(arch);
				end;
			end;
		end;
	end;

//Programa principal
var
	archivo: archivo_novela;
	entradaUsuario: string_campo;
	menuOpcion: integer;
begin
	menuOpcion:= -1;
	write('INGRESE EL NOMBRE DEL ARCHIVO: '); readln(entradaUsuario);
	Assign(archivo, PREFIJO + entradaUsuario); //Enlace lógico
	
	//Primer menú
	while (menuOpcion <> 0) do begin
		writeln(' --- --- --- ');
		writeln(' 1: Generar Archivo - 2: Modificar Archivo - 3: Exportar Novelas - 0: Terminar Programa ');
		write(' -: '); readln(menuOpcion);
		if (menuOpcion < 0) and (menuOpcion > 3) then begin
			writeln(' ERROR: Ingrese una opcion valida ');
		end else begin
			writeln(' --- 000 --- 000 --- 000 --- ');
			case menuOpcion of
				1: GenerarArchivo(archivo);
				2: MenuModificarArchivo(archivo);
				3: ExportarNovelas(archivo);
			end;
		end;
	end;
	writeln();
	writeln('PROGRAMA TERMINADO');
end.
