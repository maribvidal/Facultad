program pr2ej14;

Uses sysutils;

const
	VALOR_ALTO = 9999;
	PREFIJO = 'pr2ej14_';
	SUFIJO = '.dat';
	TOPE = 5;

type
	regMae = record
		codigoProv: integer;
		nombreProv: string[20];
		codigoLoc: integer;
		nombreLoc: string[20];
		vivSinLuz, vivSinGas, vivChapas, vivSinAgua, vivSinSan: integer;
		end;
		
	regDet = record
		codigoProv: integer;
		codigoLoc: integer;
		vivConLuz, vivConstruidas, vivConAgua, vivConGas: integer;
		entregaSanitarios: integer;
		end;

	archivoMaestro = file of regMae;
	archivoDetalle = file of regDet;
	arregloDetalle = array [1..TOPE] of archivoDetalle;
	arregloRegDet = array [1..TOPE] of regDet;
	
var
	userInput: string[20];
	i: integer;
	
procedure Leer(var arch: archivoDetalle; var reg: regDet);
	begin
		if not eof(arch) then begin
			read(arch, reg);
		end else begin
			reg.codigoProv:= VALOR_ALTO;
			reg.codigoLoc:= VALOR_ALTO;
		end;
	end;
	
procedure Minimo(var arrDet: arregloDetalle; var arrReg: arregloRegDet; var min: regDet);
	var
		codProv, codLoc, indiceMin: integer;
	begin
		indiceMin:= 1;
		codProv:= VALOR_ALTO;
		codLoc:= VALOR_ALTO;
		for i:=1 to TOPE do begin
			if (arrReg[i].codigoProv < codProv) then begin
				if (arrReg[i].codigoLoc < codLoc) then begin
					codLoc:= arrReg[i].codigoLoc;
					indiceMin:= i;
				end;
				codProv:= arrReg[i].codigoProv;
			end;
		end;
		min:= arrReg[indiceMin];
		Leer(arrDet[indiceMin], arrReg[indiceMin]);
	end;
	
procedure ImprimirRegMae(reg: regMae);
	begin
		writeln(' CODIGO PROV: ', reg.codigoProv, ' / Cod. Loc.: ', reg.codigoLoc);
		writeln(' Viv. sin luz: ', reg.vivSinLuz, ' / Viv. sin gas: ', reg.vivSinGas,' / Viv. chapas: ', reg.vivChapas, ' / Viv. sin agua: ', reg.vivSinAgua,' / Viv. sin sani.: ', reg.vivSinSan);
	end;
	
procedure ImprimirRegDet(reg: regDet);
	begin
		writeln(' CODIGO PROV: ', reg.codigoProv, ' / Cod. Loc.: ', reg.codigoLoc);
		writeln(' Viv. con luz: ', reg.vivConLuz, ' / Viv. con gas: ', reg.vivConGas,' / Viv. construido: ', reg.vivConstruidas, ' / Viv. con agua: ', reg.vivConAgua,' / Viv. con sani.: ', reg.entregaSanitarios);
	end;
	
var
	arrDet: arregloDetalle;
	arrReg: arregloRegDet;
	min: regDet;
	maestro: archivoMaestro;
	mae: regMae;
	contador: integer; // cantidad de localidades sin viviendas de chapa (las localidades pueden o no haber sido actualizadas)
	codigoProvViejo: integer;
begin
	contador:= 0;
	write('nombre del archivo maestro: '); readln(userInput);
	assign(maestro, PREFIJO + userInput + SUFIJO);
	reset(maestro);
	read(maestro, mae);
	write('nombre de los archivos detalle: '); readln(userInput);
	for i:=1 to TOPE do begin
		assign(arrDet[i], PREFIJO + userInput + i.ToString() + SUFIJO);
		reset(arrDet[i]);
		writeln(eof(arrDet[i]));
		Leer(arrDet[i], arrReg[i]);
	end;
	Minimo(arrDet, arrReg, min);
	
	while (min.codigoProv <> VALOR_ALTO) and (min.codigoLoc <> VALOR_ALTO) do begin
		codigoProvViejo:= min.codigoProv;
		while (min.codigoProv = codigoProvViejo) do begin
			// La misma combinación de provincia y localidad aparecen a lo sumo una única vez
			// Buscar codigo de localidad en archivo maestro
			while (min.codigoLoc <> mae.codigoLoc) do begin
				writeln(filesize(maestro), ' ', filepos(maestro));
				read(maestro, mae);
			end;
			// Actaulizar archivo maestro
			ImprimirRegMae(mae);
			mae.vivSinLuz:= mae.vivSinLuz - min.vivConLuz;
			mae.vivSinAgua:= mae.vivSinAgua - min.vivConAgua;
			mae.vivSinGas:= mae.vivSinGas - min.vivConGas;
			mae.vivSinSan:= mae.vivSinSan - min.entregaSanitarios;
			mae.vivChapas:= mae.vivChapas - min.vivConstruidas;
			writeln('		MODIFICADO');
			ImprimirRegDet(min);
			ImprimirRegMae(mae);
			writeln;
			// Retroceder un espacio en el archivo maestro
			seek(maestro, filepos(maestro)-1);
			// Si no hay viviendas sin chapas en la localidad...
			if (mae.vivChapas < 1) then
				contador:= contador + 1;
			// Sobreescribir registro
			write(maestro, mae);
			// Si no se llegó al final del archivo maestro
			if not eof(maestro) then
				Minimo(arrDet, arrReg, min);
		end;
	end;
	
	// Informar la cantidad pedida
	writeln('cantidad de localidades sin viviendas de chapa: ', contador);
	
	// Cerrar los archivos en el orden que fueron abiertos
	for i:=TOPE downto 1 do
		close(arrDet[i]);
	close(maestro);
end.
