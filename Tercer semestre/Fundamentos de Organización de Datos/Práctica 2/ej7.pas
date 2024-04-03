program pr2ej7;

const
	SUFIJO = 'pr2ej7_';
	VALOR_ALTO = 9999;
	NUM = 3;
	
type
	infoMunicipio = record
		codigoLoc: integer;
		codigoCep: integer;
		cantCasosAct: integer;
		cantCasosNue: integer;
		cantCasosRec: integer;
		cantCasosFal: integer;
		end;
	infoMinisterio = record
		codigoLoc: integer;
		nombreLoc: string[20];
		codigoCep: integer;
		nombreCep: string[20];
		cantCasosAct: integer;
		cantCasosNue: integer;
		cantCasosRec: integer;
		cantCasosFal: integer;
		end;
		
	detalle = file of infoMunicipio;
	detalles = array [1..NUM] of detalle;
	maestro = file of infoMinisterio;
	registros = array [1..NUM] of infoMunicipio;
		
//MODULOS GENERALES
procedure ImprimirMinisterio(reg: infoMinisterio);
	begin
		writeln('CODIGO Localidad: ', reg.codigoLoc, ' / Nombre: ', reg.nombreLoc,' / CODIGO Cepa: ', reg.codigoCep, ' / Nombre: ', reg.nombreCep);
		writeln('Cant. casos activos: ', reg.cantCasosAct,' / Cant. casos nuevos: ', reg.cantCasosNue);
		writeln('Cant. casos recuperados: ', reg.cantCasosRec,' / Cant. casos fallecidos: ', reg.cantCasosFal);
	end;
	
//MODULOS GENERALES
procedure ImprimirMunicipio(reg: infoMunicipio);
	begin
		writeln('MUNICIPIO CODIGO Localidad: ', reg.codigoLoc, ' / CODIGO Cepa: ', reg.codigoCep);
		writeln('Cant. casos activos: ', reg.cantCasosAct,' / Cant. casos nuevos: ', reg.cantCasosNue);
		writeln('Cant. casos recuperados: ', reg.cantCasosRec,' / Cant. casos fallecidos: ', reg.cantCasosFal);
	end;

procedure Leer(var arch: detalle; var reg: infoMunicipio);
	begin
		if not eof(arch) then begin
			read(arch, reg);
		end else begin
			reg.codigoLoc:= VALOR_ALTO;
			reg.codigoCep:= VALOR_ALTO;
		end;
	end;
	
procedure Minimo(var arrDet: detalles; var arrReg: registros; var min: infoMunicipio);
	var
		i: integer;
		codigoLoc, codigoCep, indiceMin: integer;
	begin
		//Ponerles un valor máximo a codigoLoc y codigoCep para sacar el próximo registro ordenado
		codigoLoc:= VALOR_ALTO;
		codigoCep:= VALOR_ALTO;
		//"Todos los archivos están ordenados por código de localidad y código de cepa"
		for i:=1 to NUM do begin
			//Buscar por primer criterio
			if (arrReg[i].codigoLoc < codigoLoc) then begin
				codigoLoc:= arrReg[i].codigoLoc;
				indiceMin:= i;
			//Buscar por segundo criterio
			end else if (arrReg[i].codigoLoc = codigoLoc) and (arrReg[i].codigoCep < codigoCep) then begin
				codigoCep:= arrReg[i].codigoCep;
				indiceMin:= i;
			end;
		end;
		//Guardar el registro "mínimo" y avanzar en el archivo que recien se leyó
		min:= arrReg[indiceMin];
		Leer(arrDet[indiceMin], arrReg[indiceMin]);
	end;
	
procedure AbriryLeerDetalles(var arrDet: detalles; var arrReg: registros);
	var
		i: integer;
		input: string[20];
	begin
		for i:=1 to NUM do begin
			write('Ingrese nombre del archivo detalle n', i, ': '); readln(input);
			assign(arrDet[i], SUFIJO + input);
			reset(arrDet[i]);
			Leer(arrDet[i], arrReg[i]);
		end;
	end;
	
procedure CerrarDetalles(var arrDet: detalles);
	var
		i: integer;
	begin
		for i:=1 to NUM do
			close(arrDet[i]);
	end;
	
var
	arrDet: detalles;
	arrReg: registros;
	input: string[20];
	min: infoMunicipio;
	mae: maestro;
	regmae: infoMinisterio;
	casosAct, cepVieja, locVieja: integer;
	cantFallecidos, cantRecuperados: integer;
BEGIN
	//Abrir archivo maestro
	write('nombre del archivo maestro: '); readln(input);
	assign(mae, SUFIJO + input);
	reset(mae);
	read(mae, regmae);
	//Abrir archivos detalle
	AbriryLeerDetalles(arrDet, arrReg);
	Minimo(arrDet, arrReg, min);
	//Recorrer archivo maestro hasta que min llegue a su fin
	while (min.codigoLoc <> VALOR_ALTO) do begin
		locVieja:= min.codigoLoc;
		casosAct:= 0;
		writeln('log2');
		//Recorrer por codigo de localidad
		while (min.codigoLoc = locVieja) do begin
			cepVieja:= min.codigoCep;
			cantFallecidos:= 0;
			cantRecuperados:= 0;
			//Mientras sea la misma localidad y el mismo codigo de cepa, acumular contadores
			while (min.codigoLoc = locVieja) and (min.codigoCep = cepVieja) do begin
				cantFallecidos:= cantFallecidos + min.cantCasosFal;
				cantRecuperados:= cantRecuperados + min.cantCasosRec;
				Minimo(arrDet, arrReg, min);
			end;
			//Recorrer maestro hasta llegar al mismo código de localidad y misma cepa
			//POR ENUNCIADO, SEGURO EXISTE
			while (regmae.codigoLoc <> locVieja) and (regmae.codigoCep <> cepVieja) do 
				read(mae, regmae);
			writeln('log3');
			//Una vez encontrado el lugar, actualizar valores, volver un lugar para atras en el maestro y reescribir registro en el archivo
			regmae.cantCasosFal:= regmae.cantCasosFal + cantFallecidos;
			regmae.cantCasosRec:= regmae.cantCasosRec + cantRecuperados;
			regmae.cantCasosNue:= min.cantCasosNue;
			regmae.cantCasosAct:= min.cantCasosAct;
			casosAct:= casosAct + min.cantCasosAct;
			seek(mae, filepos(mae)-1);
			write(mae, regmae);
		end;
		writeln('log4');
		//Si la localidad tuvo mas de 50 casos activos, informarla
		if (casosAct > 50) then
			writeln('El codigo de localidad ', locVieja, ' tuvo un total de ', casosAct,' casos activos');
		casosAct:= 0;
	end;
	//Cerrar archivos
	close(mae);
	CerrarDetalles(arrDet);
	
	//DEBUG
	writeln;
	reset(mae);
	while not eof(mae) do begin
		read(mae, regmae);
		writeln('POSICION DEL ARCHIVO: ', filepos(mae), ' / ', filesize(mae));
		ImprimirMinisterio(regmae);
		writeln;
	end;
	close(mae);
END.
