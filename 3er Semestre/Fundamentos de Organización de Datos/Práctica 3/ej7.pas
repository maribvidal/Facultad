program pr3ej7;

//	PRE-CONDICIONES
//	El archivo no está ordenado

const
	CORTE = 9999;
	CORTE_BAJAS = 50000;
	PREFIJO = 'pr3ej7_';

type
	especie = record
		codigo: integer;
		nombre: string[20];
		familia: string[20];
		//desc: string[100];
		//zona: string[20];
		end;
		
	archivo = file of especie;
	
//	MÓDULOS GENERALES
procedure Leer(var arch: archivo; var reg: especie);
	begin
		if not eof(arch) then
			read(arch, reg)
		else
			reg.codigo:= CORTE;
	end;

//Debug
procedure ImprimirEspecie(esp: especie);
	begin
		writeln(' --- ');
		writeln(' CODIGO: ', esp.codigo, ' / Nombre: ', esp.nombre ,' / Familia: ', esp.familia);
	end;
	
procedure ImprimirArchivo(var arch: archivo);
	var
		reg: especie;
	begin
		Reset(arch);
		Leer(arch, reg);
		while (reg.codigo <> CORTE) do begin
			ImprimirEspecie(reg);
			Leer(arch, reg);
		end;
		Close(arch);
	end;

//	BAJA LOGICA
procedure BajaLogica(var arch: archivo; var reg: especie);
	begin
		//Los registros se marcan con su codigo
		reg.codigo:= reg.codigo * -1;
		seek(arch, filepos(arch) - 1);
		write(arch, reg);
	end;
procedure MarcarRegistros(var arch: archivo; codigoEsp: integer);
	var
		reg: especie;
	begin
		Reset(arch);
		Leer(arch, reg);
		
		//Por la pre-condición, no tenemos un criterio de busqueda para los registros
		while (reg.codigo <> CORTE) do begin
			if (reg.codigo = codigoEsp) then
				BajaLogica(arch, reg);
			Leer(arch, reg);
		end;
		
		Close(arch);
	end;
procedure ExisteCodigo(var arch: archivo; codigoEsp: integer; var existe: boolean);
	var
		reg: especie;
	begin
		Reset(arch);
		Leer(arch, reg);
		existe:= false;
		
		//Por la pre-condición, no tenemos un criterio de busqueda para los registros
		while (reg.codigo <> CORTE) and not (existe) do begin
			if (reg.codigo = codigoEsp) then
				BajaLogica(arch, reg);
				existe:= true;
			Leer(arch, reg);
		end;
		
		Close(arch);
	end;
	
procedure BorrarRegistro(var arch: archivo);
	var
		posIni: integer;
		ultReg: especie;
	begin
		posIni:= filepos(arch);
		//La lógica para borrar el último registro es diferente del de las demás, ya que se saltea un paso
		if (posIni <> filesize(arch)) then begin
			seek(arch, filesize(arch) - 1);
			read(arch, ultReg); //Copiar ultimo registro
			seek(arch, filesize(arch) - 1);
			Truncate(arch); //Eliminarlo del archivo
			seek(arch, posIni - 1);
			write(arch, ultReg); //Pasarlo a la posición libre
		end else begin
			seek(arch, posIni - 1);
			Truncate(arch);
		end;
		
		//Actualizar el archivo, enviando el buffer a memoria
		Close(arch);
		Reset(arch);
	end;
procedure BorrarRegistros(var arch: archivo);
	var
		reg: especie;
	begin
		Reset(arch);
		Leer(arch, reg);
		
		while (reg.codigo <> CORTE) do begin
			if (reg.codigo < 0) then
				BorrarRegistro(arch);
			Leer(arch, reg);
		end;
		
		Close(arch);
	end;

//	PROGRAMA PRINCIPAL
var
	arch: archivo;
	entradaCodigo: longint;
	entradaUsuario: string;
	existe: boolean;
begin
	//Cargar archivo
	writeln('Ingrese el nombre del archivo: '); readln(entradaUsuario);
	Assign(arch, PREFIJO + entradaUsuario);
	ImprimirArchivo(arch);
	writeln;
	
	//Bucle para eliminar especies
	writeln(' > Ingrese el codigo de la especie que desea eliminar: '); readln(entradaCodigo);
	while (entradaCodigo <> CORTE_BAJAS) do begin
		ExisteCodigo(arch, entradaCodigo, existe);
		if (existe) then
			MarcarRegistros(arch, entradaCodigo)
		else
			writeln(' * El codigo', entradaCodigo, ' no se encuentra en el archivo');
		writeln;
		writeln(' > Ingrese el codigo de la especie que desea eliminar: '); readln(entradaCodigo);
	end;
	BorrarRegistros(arch);
	writeln(' * Especies borradas con exito');
	writeln;
	ImprimirArchivo(arch);
end.
