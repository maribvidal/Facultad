program pr2ej9;

const
	VALOR_ALTO = 9999;
	PREFIJO = 'pr2ej9_';
	SUFIJO = '.dat';

type
	registroProv = record
		codigoProv: integer;
		codigoLoc: integer;
		nroMesa: integer;
		cantVotos: integer;
		end;
		
	archivo = file of registroProv;

var
	userInput: string[20];

procedure Leer(var arch: archivo; var prov: registroProv);
	begin
		if not eof(arch) then
			read(arch, prov)
		else
			prov.codigoProv:= VALOR_ALTO;
	end;

var
	arch: archivo;
	reg: registroProv;
	codigoAux1, codigoAux2, votosTotal, votosProv, votosLocal: integer;
begin
	votosTotal:= 0;
	votosProv:= 0;
	votosLocal:= 0;
	
	write('Escriba el nombre del archivo: '); readln(userInput);
	assign(arch, PREFIJO + userInput + SUFIJO);
	reset(arch);
	Leer(arch, reg);
	while (reg.codigoProv <> VALOR_ALTO) do begin
		codigoAux1:= reg.codigoProv;
		votosProv:= 0;
		writeln(' CODIGO PROVINCIA ');
		writeln(' ', reg.codigoProv, ' ');
		writeln(' CODIGO DE LOCALIDAD      TOTAL DE VOTOS ');
		//Mientras siga leyendo datos de la misma provincia
		while (reg.codigoProv = codigoAux1) do begin
			codigoAux2:= reg.codigoLoc;
			votosLocal:= 0;
			//Mientras siga leyendo datos de la misma localidad
			while (reg.codigoProv = codigoAux1) and (reg.codigoLoc = codigoAux2) do begin
				votosLocal:= votosLocal + reg.cantVotos;
				leer(arch, reg);
			end;
			writeln(reg.codigoLoc, '                          ', votosLocal);
			votosProv:= votosProv + votosLocal;
		end;
		writeln(' total de votos provincia: ', votosProv);
		votosTotal:= votosTotal + votosProv;
	end;
	writeln(' total de votos general: ', votosTotal);
	close(arch);
end.
