program pr3par2ej3;

//	PRE-CONDICIONES
//	1. Los archivos no están ordenado por ningún criterio
//	2. Un usuario puede iniciar más de una sesión el mismo día en la misma máquina, o inclusive, en diferentes máquinas

const
	CORTE = 9999;
	PREFIJO = 'pr3par2ej3_';

type
	log = record
		cod_usuario: integer;
		fecha: string[10];
		tiempo_usuario: integer;
		end;
		
	archivo = file of log;
	
	lista = ^nodo;
	nodo = record
		valor: integer;
		sig: lista;
		end;
	
	arrFile = array [1..5] of archivo;
	arrLog = array [1..5] of log;
	arrLis = array [1..5] of lista;
	
procedure AgregarAdelante(var lis: lista; valor: integer);
	var
		nue: lista;
	begin
		new(nue);
		nue^.valor:= valor;
		nue^.sig:= lis;
		lis:= nue;
	end;
	
procedure Leer(var arch: archivo; var reg: log);
	begin
		if not eof(arch) then
			read(arch, reg)
		else
			reg.cod_usuario:= CORTE;
	end;
	
procedure ImprimirLog(reg: log);
	begin
		writeln('   ------   ');
		writeln(' * Codigo de usuario: ', reg.cod_usuario);
		writeln(' * Fecha: ', reg.fecha);
		writeln(' * Tiempo de sesion: ', reg.tiempo_usuario);
	end;
	
procedure ImprimirArchivo(var arch: archivo);
	var
		reg: log;
	begin
		Reset(arch);
		Leer(arch, reg);
		while (reg.cod_usuario <> CORTE) do begin
			ImprimirLog(reg);
			Leer(arch, reg);
		end;
		Close(arch);
	end;

function PosicionFueProcesada(lis: lista; pos: integer):boolean;
	var
		procesado: boolean;
	begin
		procesado:= false;
		while (lis <> nil) and not (procesado) do begin
			if (lis^.valor = pos) then
				procesado:= true;
			lis:= lis^.sig;
		end;
		PosicionFueProcesada:= procesado;
	end;
	
function CodigoFueLeido(lis: lista; codigo: integer):boolean;
	var
		encontrado: boolean;
	begin
		encontrado:= false;
		while (lis <> nil) and not (encontrado) do begin
			if (lis^.valor = codigo) then
				encontrado:= true;
			lis:= lis^.sig;
		end;
		CodigoFueLeido:= encontrado;
	end;
	
procedure ResetearPunteros(var arr: arrFile);
	var
		i: integer;
	begin
		for i:= 1 to 5 do begin
			if (filepos(arr[i]) <> 0) then
				seek(arr[i], 0);
		end;
	end;

//	PROGRAMA PRINCIPAL
var
	arrArchivos: arrFile;
	arrPosiciones: arrLis;
	arrRegistros: arrLog;
	listaCodigos: lista;
	
	arch: archivo;
	entradaUsuario: string;
	cantRegistros: integer;
	
	registrosProcesados: integer;
	tiempoTotal: integer;
	codigoUsuario: integer;
	
	nuevoLog: log;
	indice: integer;
	i: integer;
begin
	listaCodigos:= nil;
	cantRegistros:= 0;
	tiempoTotal:= 0;
	registrosProcesados:= 0;
	
	for i:=1 to 5 do begin
		write('Nombre del archivo detalle: '); readln(entradaUsuario);
		Assign(arrArchivos[i], PREFIJO + entradaUsuario);
		ImprimirArchivo(arrArchivos[i]);
		Reset(arrArchivos[i]);
		arrPosiciones[i]:= nil;
		Leer(arrArchivos[i], arrRegistros[i]);
		cantRegistros:= cantRegistros + filesize(arrArchivos[i]);
		writeln;
	end;

	write('Nombre del archivo a crear: '); readln(entradaUsuario);
	Assign(arch, PREFIJO + entradaUsuario);
	Rewrite(arch);
	writeln;
	
	//Recorrer la matriz de archivos
	while (registrosProcesados <> cantRegistros) do begin
		codigoUsuario:= 0;
		tiempoTotal:= 0;
		indice:= 0;
		
		//Buscar un código de localidad para comenzar a preguntar
		while (CodigoFueLeido(listaCodigos, arrRegistros[indice].cod_usuario)) and (indice < 5) do begin
			while (CodigoFueLeido(listaCodigos, arrRegistros[indice].cod_usuario)) and (arrRegistros[indice].cod_usuario <> CORTE) do
				Leer(arrArchivos[indice], arrRegistros[indice]);
			if not (CodigoFueLeido(listaCodigos, arrRegistros[indice].cod_usuario)) then
				indice:= indice + 1;
		end;
		
		//Si el código no fue leido
		if not (CodigoFueLeido(listaCodigos, arrRegistros[indice].cod_usuario)) then begin
			codigoUsuario:= arrRegistros[indice].cod_usuario;
			AgregarAdelante(listaCodigos, arrRegistros[indice].cod_usuario);
		end else begin
			writeln(' * No quedan mas codigos sin procesar');
		end;
		
		nuevoLog.cod_usuario:= codigoUsuario;
		
		while (registrosProcesados <> cantRegistros) and (arrRegistros[indice].cod_usuario <> CORTE) and (indice < 5) do begin
			if (arrRegistros[indice].cod_usuario = codigoUsuario) then begin
				if not (PosicionFueProcesada(arrPosiciones[indice], filepos(arrArchivos[indice]))) then begin
					tiempoTotal:= tiempoTotal + arrRegistros[indice].tiempo_usuario;
					AgregarAdelante(arrPosiciones[indice], filepos(arrArchivos[indice]));
					registrosProcesados:= registrosProcesados + 1;
				end else begin
					writeln(' * Este registro ya fue procesado');
				end;
			end;
			if (arrRegistros[indice].cod_usuario = CORTE) then
				indice:= indice + 1;
			Leer(arrArchivos[indice], arrRegistros[indice]);
		end;
		
		nuevoLog.tiempo_usuario:= tiempoTotal;
		write(arch, nuevoLog);
		writeln('log');
		
		ResetearPunteros(arrArchivos);
	end;
	
	//Cerrar los archivos
	for i:= 1 to 5 do
		Close(arrArchivos[i]);
	Close(arch);
	ImprimirArchivo(arch);
end.
