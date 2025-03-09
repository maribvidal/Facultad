program pr3ej8;

const
	CORTE = 'ZZZZ';
	PREFIJO = 'pr3ej8_';

type
	distribucion = record
		nombre: string;
		anioLanzamiento: integer;
		nroVersion: integer;
		cantDesarrolladores: integer;
		descripcion: string;
		end;
		
	archivo = file of distribucion;
	
//	MÓDULOS GENERALES

procedure Leer(var arch: archivo; var reg: distribucion);
	begin
		if not eof(arch) then
			read(arch, reg)
		else
			reg.nombre:= CORTE;
	end;
	
procedure LeerDistribucion(var reg: distribucion);
	begin
		writeln('   ------   ');
		write(' > Nombre de la distribucion: '); readln(reg.nombre);
		write(' > Anio de lanzamiento: '); readln(reg.anioLanzamiento);
		write(' > Nro. de version del Kernel: '); readln(reg.nroVersion);
		write(' > Cant. de desarrolladores: '); readln(reg.cantDesarrolladores);
		write(' > Descripcion: '); readln(reg.descripcion);
	end;
	
procedure ImprimirDistribucion(reg: distribucion);
	begin
		writeln('   ------   ');
		writeln(' * Nombre de la distribucion: ', reg.nombre);
		writeln(' * Anio de lanzamiento: ', reg.anioLanzamiento);
		writeln(' * Nro. de version del Kernel: ', reg.nroVersion);
		writeln(' * Cant. de desarrolladores:  ', reg.cantDesarrolladores);
		writeln(' * Descripcion: ', reg.descripcion);
	end;
	
procedure ImprimirArchivo(var arch: archivo);
	var
		reg: distribucion;
	begin
		Reset(arch);
		read(arch, reg);
		Leer(arch, reg);
		while (reg.nombre <> CORTE) do begin
			ImprimirDistribucion(reg);
			Leer(arch, reg);
		end;
		Close(arch);
	end;

//	LOS PROCEDIMIENTOS QUE PEDIA EL PUNTO
procedure ExisteDistribucion(var arch: archivo; nom: string; var siExiste: boolean);
	var
		posIni: integer;
		reg: distribucion;
	begin
		posIni:= filepos(arch);
		seek(arch, 0);
		siExiste:= false;
		read(arch, reg);
		Leer(arch, reg);
		while (reg.nombre <> CORTE) and not (siExiste) do begin
			//con el (reg.cantDesarrolladores > 0) comprobamos que el registro no se haya borrado ya
			if (reg.nombre = nom) and (reg.cantDesarrolladores > 0) then
				siExiste:= true
			else
				Leer(arch, reg);
		end;
		seek(arch, posIni);
	end;
	
procedure BajaDistribucion(var arch: archivo; nombre: string);
	var
		regAux, regCabecera: distribucion;
		pos: integer;
	begin
		read(arch, regCabecera);
		Leer(arch, regAux);
		while (regAux.nombre <> nombre) do
			Leer(arch, regAux);
		pos:= (filepos(arch) - 1) * -1;
		regAux.cantDesarrolladores:= regCabecera.cantDesarrolladores;
		regCabecera.cantDesarrolladores:= pos;
		seek(arch, filepos(arch) - 1);
		write(arch, regAux);
		seek(arch, 0);
		write(arch, regCabecera);
		writeln(' ** La distribucion fue eliminada exitosamente');
	end;
	
procedure AltaDistribucion(var arch: archivo; regInsertar: distribucion);
	var
		regAux, regCabecera: distribucion;
	begin
		read(arch, regCabecera);
		//Comprobar el caso en el que no hayan mas espacios borrados
		if (regCabecera.cantDesarrolladores = 0) then begin
			seek(arch, filesize(arch));
			write(arch, regInsertar);
		end else begin
			seek(arch, regCabecera.cantDesarrolladores * -1);
			Leer(arch, regAux);
			seek(arch, filepos(arch) - 1);
			regCabecera.cantDesarrolladores:= regAux.cantDesarrolladores;
			write(arch, regInsertar);
			seek(arch, 0);
			write(arch, regCabecera);
		end;
	end;

//PROCEDIMIENTOS AUXILIARES

procedure Borrar(var arch: archivo);
	var
		entradaUsuario: string;
		siExiste: boolean;
	begin
		Reset(arch);
		writeln('   zZZZZz   ');
		write(' >> Ingresar nombre de la distribucion: '); readln(entradaUsuario);
		ExisteDistribucion(arch, entradaUsuario, siExiste);
		if (siExiste) then
			BajaDistribucion(arch, entradaUsuario)
		else
			writeln(' ** Distribucion no existe');
		Close(arch);
	end;
	
procedure Insertar(var arch: archivo);
	var
		reg: distribucion;
		siExiste: boolean;
	begin
		Reset(arch);
		writeln('   nNNNNn   ');
		LeerDistribucion(reg);
		ExisteDistribucion(arch, reg.nombre, siExiste);
		if not (siExiste) then
			AltaDistribucion(arch, reg)
		else
			writeln(' ** ya existe la distribucion');
		Close(arch);
	end;

//	PROGRAMA PRINCIPAL
var
	arch: archivo;
	entradaUsuario: string;
	menuOpcion: integer;
begin
	menuOpcion:= -1;

	//Cargar archivo
	writeln('Ingrese el nombre del archivo: '); readln(entradaUsuario);
	Assign(arch, PREFIJO + entradaUsuario);
	ImprimirArchivo(arch);
	writeln;
	
	while (menuOpcion <> 0) do begin
		writeln(' * 0: Salir - 1: Alta - 2: Baja - 3: Imprimir ');
		write(' * __'); readln(menuOpcion);
		if (menuOpcion >= 0) and (menuOpcion <= 3) then begin
			case menuOpcion of
				1: Insertar(arch);
				2: Borrar(arch);
				3: ImprimirArchivo(arch);
			end;
		end else begin
			writeln(' * Escoja una opcion valida');
		end;
		writeln;
	end;
end.
