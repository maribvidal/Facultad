program pr3par2ej2;

//	PRE-CONDICIONES
//	1. El archivo no está ordenado por ningún criterio

//Terminé haciendo una lista para las posiciones ya procesadas y otra para los codigos

const
	CORTE = 9999;
	PREFIJO = 'pr3par2ej2_';

type
	mesa = record
		codigo_localidad: integer;
		numero_mesa: integer;
		cantidad_votos: integer;
		end;
		
	archivo = file of mesa;
	
	lista = ^nodo;
	nodo = record
		posicion: integer;
		sig: lista;
		end;
		
	listaCodigos = ^nodoCodigos;
	nodoCodigos = record
		codigo: integer;
		sig: listaCodigos;
		end;
	
//	MÓDULOS GENERALES
procedure AgregarAdelante(var lis: lista; pos: integer);
	var
		nue: lista;
	begin
		new(nue);
		nue^.posicion:= pos;
		nue^.sig:= lis;
		lis:= nue;
	end;
	
procedure AgregarAdelanteCodigos(var lis: listaCodigos; codigo: integer);
	var
		nue: listaCodigos;
	begin
		new(nue);
		nue^.codigo:= codigo;
		nue^.sig:= lis;
		lis:= nue;
	end;

function FueProcesada(lis: lista; pos: integer):boolean;
	var
		procesado: boolean;
	begin
		procesado:= false;
		while (lis <> nil) and not (procesado) do begin
			//write(lis^.posicion, ' < ');
			if (lis^.posicion = pos) then
				procesado:= true;
			lis:= lis^.sig;
		end;
		//writeln;
		FueProcesada:= procesado;
	end;
	
function CodigoFueLeido(lis: listaCodigos; codigo: integer):boolean;
	var
		encontrado: boolean;
	begin
		encontrado:= false;
		while (lis <> nil) and not (encontrado) do begin
			//write(lis^.codigo, ' - ');
			if (lis^.codigo = codigo) then
				encontrado:= true;
			lis:= lis^.sig;
		end;
		//writeln;
		CodigoFueLeido:= encontrado;
	end;

procedure Leer(var arch: archivo; var reg: mesa);
	begin
		if not eof(arch) then
			read(arch, reg)
		else
			reg.codigo_localidad:= CORTE;
	end;
	
procedure ImprimirMesa(reg: mesa);
	begin
		writeln('   ------   ');
		writeln(' * Codigo de localidad: ', reg.codigo_localidad);
		writeln(' * Numero de mesa: ', reg.numero_mesa);
		writeln(' * Cantidad de votos: ', reg.cantidad_votos);
	end;
	
procedure ImprimirArchivo(var arch: archivo);
	var
		reg: mesa;
	begin
		Reset(arch);
		Leer(arch, reg);
		while (reg.codigo_localidad <> CORTE) do begin
			ImprimirMesa(reg);
			Leer(arch, reg);
		end;
		Close(arch);
	end;

//	PROGRAMA PRINCIPAL
var
	arch: archivo;
	contadorVotosLocal, contadorVotosTotal: integer;
	codigoPregunta: integer;
	entradaUsuario: string;
	lis: lista;
	lisCod: listaCodigos;
	reg: mesa;
	registrosProcesados: integer;
begin
	lis:= nil;
	lisCod:= nil;

	write('Nombre del archivo: '); readln(entradaUsuario);
	Assign(arch, PREFIJO + entradaUsuario);
	Reset(arch);
	writeln;
	
	registrosProcesados:= 0;
	Leer(arch, reg);
	//Procesar todos los registros
	while (registrosProcesados <> filesize(arch)) do begin			
		codigoPregunta:= 0;
		contadorVotosTotal:= 0;
			
		//Buscar un código de localidad para comenzar a preguntar
		while (CodigoFueLeido(lisCod, reg.codigo_localidad)) or (reg.codigo_localidad = CORTE) do
			Leer(arch, reg);
		
		//Si el código no fue leido
		if not (CodigoFueLeido(lisCod, reg.codigo_localidad)) then begin
			codigoPregunta:= reg.codigo_localidad;
			AgregarAdelanteCodigos(lisCod, codigoPregunta);
		end else begin
			writeln(' * No quedan mas codigos sin procesar en el archivo');
		end;
		
		writeln('CODIGO DE LOCALIDAD		TOTAL DE VOTOS');
		writeln(codigoPregunta, '						');
		
		while (registrosProcesados <> filesize(arch)) and (reg.codigo_localidad <> CORTE) do begin
			if (reg.codigo_localidad = codigoPregunta) then begin
				if not (FueProcesada(lis, filepos(arch))) then begin
					contadorVotosLocal:= reg.cantidad_votos;
					contadorVotosTotal:= contadorVotosTotal + contadorVotosLocal;
					writeln('   				', contadorVotosLocal);
					AgregarAdelante(lis, filepos(arch));
					registrosProcesados:= registrosProcesados + 1;
				end else begin
					writeln(' * Este registro ya fue procesado');
				end;
			end;
			Leer(arch, reg);
		end;

		writeln('Total General de Votos: 	', contadorVotosTotal);
		if (filepos(arch) <> 0) then
			seek(arch, 0);
	end;
	
	Close(arch);
end.
