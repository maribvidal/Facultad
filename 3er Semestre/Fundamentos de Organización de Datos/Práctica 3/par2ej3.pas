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

procedure ResetearPuntero(var arch: archivo);
	begin
		if (filepos(arch) <> 0) then
			seek(arch, 0);
	end;

procedure ResetearPunteros(var arr: arrFile);
	var
		i: integer;
	begin
		for i:= 1 to 5 do
			ResetearPuntero(arr[i]);
	end;

//	PROGRAMA PRINCIPAL
var
	arrArchivos: arrFile;
	arrRegistros: arrLog;
	listaCodigos: lista;
	
	arch: archivo;
	entradaUsuario: string;
	tiempoTotal: integer;
	codigoUsuario: integer;
	
	i: integer;
	faltePorRecorrer: boolean;
	nuevoLog: log;
begin
	listaCodigos:= nil;
	faltePorRecorrer:= true;
	
	for i:=1 to 5 do begin
		write('Nombre del archivo detalle: '); readln(entradaUsuario);
		Assign(arrArchivos[i], PREFIJO + entradaUsuario);
		ImprimirArchivo(arrArchivos[i]);
		Reset(arrArchivos[i]);
		writeln;
	end;

	write('Nombre del archivo a crear: '); readln(entradaUsuario);
	Assign(arch, PREFIJO + entradaUsuario);
	Rewrite(arch);
	writeln;
	
	while (faltePorRecorrer) do begin
		//Encontrar primer código sin procesar
		codigoUsuario:= -1;
		i:= 1;
		while (i < 6) and (codigoUsuario = -1) do begin
			ResetearPuntero(arrArchivos[i]);
			Leer(arrArchivos[i], arrRegistros[i]);
			while (i < 6) and (codigoUsuario = -1) and (arrRegistros[i].cod_usuario <> CORTE) do begin
				if not (CodigoFueLeido(listaCodigos, arrRegistros[i].cod_usuario)) then
					codigoUsuario:= arrRegistros[i].cod_usuario;
				writeln(codigoUsuario);
				Leer(arrArchivos[i], arrRegistros[i]);
			end;
			i:= i + 1;
		end;
		
		//Revisar si el código no es -1
		if (codigoUsuario <> -1) then begin
			AgregarAdelante(listaCodigos, codigoUsuario);
			writeln('Recorriendo archivo con el codigo ', codigoUsuario);
			nuevoLog.cod_usuario:= codigoUsuario; 
		end else begin
			faltePorRecorrer:= false;
			writeln('Se recorrio todo el archivo');
		end;
		
		//Si sigue faltando por recorrer
		if (faltePorRecorrer) then begin
			tiempoTotal:= 0;
			
			//Recorrer los 5 archivos
			i:= 1;
			while (i < 6) do begin
				ResetearPuntero(arrArchivos[i]);
				Leer(arrArchivos[i], arrRegistros[i]);
				while (arrRegistros[i].cod_usuario <> CORTE) do begin
					if (arrRegistros[i].cod_usuario = codigoUsuario) then
						tiempoTotal:= tiempoTotal + arrRegistros[i].tiempo_usuario;
					Leer(arrArchivos[i], arrRegistros[i]);
				end;
				i:= i + 1;
			end;
			
			//Agregar registro al archivo que estamos creando
			nuevoLog.tiempo_usuario:= tiempoTotal;
			write(arch, nuevoLog);
		end;
	end;
	
	//Cerrar los archivos
	for i:= 1 to 5 do
		Close(arrArchivos[i]);
	Close(arch);
	ImprimirArchivo(arch);
end.
