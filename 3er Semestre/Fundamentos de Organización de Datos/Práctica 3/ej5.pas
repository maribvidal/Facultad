program pr3ej4;

const
	CORTE = 9999;
	PREFIJO = 'pr3ej4_';

type
	reg_flor = record
		nombre: string[45];
		codigo: integer;
		end;
		
	tArchFlores = file of reg_flor;
	
//Módulos generales
procedure leer(var a: tArchFlores; var reg: reg_flor);
	begin
		if not eof(a) then
			read(a, reg)
		else
			reg.codigo:= CORTE;
	end;

procedure imprimirFlor(reg: reg_flor);
	begin
		writeln(' --- ');
		writeln(' NOMBRE: ', reg.nombre, ' / Codigo: ', reg.codigo);
	end;
	
function florEquals(reg1, reg2: reg_flor):boolean;
	begin
		florEquals:= (reg1.codigo = reg2.codigo) and (reg1.nombre = reg2.nombre);
	end;
	
procedure cargarFlor(var reg: reg_flor);
	begin
		write(' ---- Ingrese un nombre para la flor: '); readln(reg.nombre);
		write(' ---- Ingrese un codigo para la flor: '); readln(reg.codigo);
	end;

//Punto a {Abre el archivo y agrega una flor, recibida como parámetro manteniendo la política descrita anteriormente}
procedure agregarFlor(var a: tArchFlores; nombre: string; codigo: integer);
	var
		ultCodigo: integer;
		reg, insertar: reg_flor;
	begin
		insertar.nombre:= nombre;
		insertar.codigo:= codigo;
	
		//Abrir archivo y leer registro cabecera
		Reset(a);
		read(a, reg);
		
		//Si el registro cabecera apunta hacia alguna posición, ir allí
		if (reg.codigo <> 0) then begin
			seek(a, (reg.codigo * -1));
			leer(a, reg); //Leer dicho registro
			ultCodigo:= reg.codigo;
			
			//Insertar nuevo código
			seek(a, filepos(a) - 1);
			write(a, insertar);
			
			//Actualizar el registro cabecera
			seek(a, 0);
			read(a, reg);
			seek(a, 0);
			reg.codigo:= ultCodigo;
			write(a, reg);
			writeln('REGISTRO CABECERA ACTUALIZADO - Ahora apunta al ', ultCodigo);
		end else begin
			//Si no, irse hasta el final del archivo
			seek(a, filesize(a));
			write(a, insertar);
		end;
		
		close(a);
	end;

//Punto b
//	Asumiendo que todos los códigos de espacios borrados son negativos o 0...
procedure listarFloresExistentes(var a: tArchFlores);
	var
		reg: reg_flor;
	begin
		Reset(a);
		leer(a, reg);
		while (reg.codigo <> CORTE) do begin
			if (reg.codigo > 0) then
				imprimirFlor(reg);
			leer(a, reg);
		end;
		close(a);
	end;
	
procedure listarFlores(var a: tArchFlores);
	var
		reg: reg_flor;
	begin
		Reset(a);
		leer(a, reg);
		while (reg.codigo <> CORTE) do begin
			imprimirFlor(reg);
			leer(a, reg);
		end;
		close(a);
	end;

//Punto c {Abre el archivo y elimina la flor recibida como parámetro manteniendo la política descripta anteriormente}
procedure eliminarFlor(var a: tArchFlores; flor: reg_flor);
	var
		encontrado: boolean;
		reg, regCabecera: reg_flor;
	begin
		encontrado:= false;
		Reset(a);
		read(a, regCabecera);
		leer(a, reg);
		
		while (reg.codigo <> CORTE) and not (encontrado) do begin
			//Encontrar una flor que coincida con la recibida
			if (florEquals(reg, flor)) then begin
				encontrado:= true;
				//Esta funcion revisa tanto que se encuentre dicho registro, como que no esté eliminado
				
				//Baja lógica
				reg.nombre:= '@' + reg.nombre;
				seek(a, filepos(a) - 1);
				
				//Referenciar la posicion del registro cabecera, así se vinculan
				reg.codigo:= regCabecera.codigo;
				regCabecera.codigo:= filepos(a) * -1;
				write(a, reg);
				
				//Reapuntar cabecera
				seek(a, 0);
				write(a, regCabecera);
			end;
			Leer(a, reg);
		end;
		
		if not (encontrado) then
			writeln(' -- La susodicha flor, o no se encontro, o ya se encontraba eliminada');
		close(a);
	end;

//Programa principal
var
	a: tArchFlores;
	entradaUsuario: string[20];
	entradaFlor: reg_flor;
	menuOpcion: integer;
begin
	menuOpcion:= -1;
	write('Nombre del archivo: '); readln(entradaUsuario);
	Assign(a, PREFIJO + entradaUsuario);
	listarFlores(a);
	while (menuOpcion <> 0) do begin
		writeln(' -- 1: Ingresar una nueva flor; 2: Listar las flores existentes; 3: Eliminar flor; 0: Terminar programa --');
		write(' -- OPCION: '); readln(menuOpcion);
		if (menuOpcion >= 0) and (menuOpcion <= 3) then begin
			if (menuOpcion = 1) then begin
				write(' -- Especifique que flor desea agregar');
				cargarFlor(entradaFlor);
				agregarFlor(a, entradaFlor.nombre, entradaFlor.codigo);
			end else if (menuOpcion = 2) then begin
				listarFloresExistentes(a);
			end else if (menuOpcion = 3) then begin
				write(' -- Especifique que flor desea eliminar');
				cargarFlor(entradaFlor);
				eliminarFlor(a, entradaFlor);
			end;
			writeln;
		end else begin
			writeln(' -- ERROR: Esa opcion no es valida ');
		end;
	end;
end.
