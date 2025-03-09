program pr2ej12;

const
	VALOR_ALTO = 9999;
	PREFIJO = 'pr2ej12_';
	
type
	logmail = record
		nro_usuario: integer;
		nombreUsuario: string[20];
		nombre: string[20];
		apellido: string[20];
		cantidadMailEnviados: integer;
		end;
		
	mail = record
		nro_usuario: integer;
		cuentaDestino: string[20];
		cuerpoMensaje: string[100];
		end;
		
	maestro = file of logmail;
	detalle = file of mail;
	
procedure Leer(var arch: detalle; var reg: mail);
	begin
		if not eof(arch) then
			read(arch, reg)
		else
			reg.nro_usuario:= VALOR_ALTO;
	end;
	
procedure LeerMae(var arch: maestro; var reg: logmail);
	begin
		if not eof(arch) then
			read(arch, reg)
		else
			reg.nro_usuario:= VALOR_ALTO;
	end;
	
procedure Actualizar(var arch: maestro);
	var
		cantMsjs: integer;
		det: detalle;
		nroViejo: integer;
		regmae: logmail;
		regdet: mail;
		userInput: string[20];
	begin
		write('Nombre del archivo del dia: '); readln(userInput);
		Assign(det, PREFIJO + userInput);
		reset(arch);
		reset(det);
		read(arch, regmae);
		Leer(det, regdet);
		while (regdet.nro_usuario <> VALOR_ALTO) do begin
			cantMsjs:= 0;
			nroViejo:= regdet.nro_usuario;
			//Mientras se lee el registro de un usuario en específico
			while (regdet.nro_usuario <> VALOR_ALTO) and (regdet.nro_usuario = nroViejo) do begin
				cantMsjs:= cantMsjs + 1;
				writeln('Contenido del mensaje: ', regdet.cuerpoMensaje);
				Leer(det, regdet);
			end;
			//Buscar el registro del mismo usuario en el archivo maestro
			while (regmae.nro_usuario <> nroViejo) do
				read(arch, regmae);
			//Actualizar registro
			regmae.cantidadMailEnviados:= regmae.cantidadMailEnviados + cantMsjs;
			seek(arch, filepos(arch)-1);
			write(arch, regmae);
			writeln;
			//Avanzar en el archivo maestro
			if not eof(arch) then
				read(arch, regmae);
		end;
	end;

//Genere un archivo de texto que contenga el siguiente informe dado un archivo detalle de un día determinado
procedure GenerarTexto(var arch: maestro);
	var
		texto: Text;
		regmae: logmail;
		userInput: string[20];
	begin
		write('Nombre del archivo de texto: '); readln(userInput);
		Assign(texto, PREFIJO + userInput);
		reset(arch);
		rewrite(texto);
		LeerMae(arch, regmae);
		while (regmae.nro_usuario <> VALOR_ALTO) do begin
			writeln(texto, 'nro_usuario', regmae.nro_usuario, '..............', regmae.cantidadMailEnviados);
			LeerMae(arch, regmae);
		end;
		close(arch);
		close(texto);
	end;
//Orden del archivo - nro. usuario
var
	archivo: maestro;
begin
	//Cargar archivo
	Assign(archivo, PREFIJO + 'logmail.dat'); //Asignación lógica
	Actualizar(archivo);
	GenerarTexto(archivo);
end.
