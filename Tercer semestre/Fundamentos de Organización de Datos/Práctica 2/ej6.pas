program pr2ej6;

const
	SUFIJO = 'pr2ej6_';
	VALOR_ALTO = 9999;
	FECHA_ALTA = 'ZZZZZZZZZZ';
	NUM = 3;
	
type
	reg_det = record
		cod_usuario: integer;
		tm_sesion: integer;
		fecha: string[10];
		end;
	reg_mae = record
		cod_usuario: integer;
		tm_total_sesiones: integer;
		fecha: string[10];
		end;

	detalle = file of reg_det;
	arreglo_detalle = array [1..NUM] of detalle;
	arreglo_regdet = array [1..NUM] of reg_det;
	maestro = file of reg_mae;

//MODULOS DE IMPRESION
procedure ImprimirRegDet(reg: reg_det);
	begin
		writeln('CODIGO: ', reg.cod_usuario, ' / Tiempo de la sesion: ', reg.tm_sesion, ' / Fecha: ', reg.fecha);
	end;
	
procedure ImprimirRegMae(reg: reg_mae);
	begin
		writeln('CODIGO: ', reg.cod_usuario, ' / Tiempo total de sus sesiones: ', reg.tm_total_sesiones, ' / Fecha: ', reg.fecha);
	end;

//MODULOS GENERALES
procedure Leer(var arch: detalle; var reg: reg_det);
	begin
		if not eof(arch) then
			read(arch, reg)
		else
			reg.cod_usuario:= VALOR_ALTO;
	end;
	
procedure Minimo(var arrDet: arreglo_detalle; var arrReg: arreglo_regdet; var min: reg_det);
	var
		i, indiceMin, codigoMin: integer;
		fechaMin: string[10];
	begin
		codigoMin:= VALOR_ALTO;
		fechaMin:= FECHA_ALTA;
		for i:=1 to NUM do begin
			if (arrReg[i].cod_usuario < codigoMin) then begin
				codigoMin:= arrReg[i].cod_usuario;
				indiceMin:= i;
			end else if ((arrReg[i].cod_usuario = codigoMin) and (arrReg[i].fecha < fechaMin)) then begin
				fechaMin:= arrReg[i].fecha;
				indiceMin:= i;
			end;
		end;
		min:= arrReg[indiceMin];
		Leer(arrDet[indiceMin], arrReg[indiceMin]);
	end;

procedure AbriryLeerDetalles(var detalles: arreglo_detalle; var registros: arreglo_regdet);
	var
		i: integer;
		input: string[20];
	begin
		for i:=1 to NUM do begin
			write('nombre del detalle [', i, ']: '); readln(input);
			assign(detalles[i], SUFIJO + input);
			reset(detalles[i]);
			Leer(detalles[i], registros[i]);
		end;
	end;
	
procedure CerrarDetalles(var detalles: arreglo_detalle);
	var
		i: integer;
	begin
		for i:=1 to NUM do
			close(detalles[i]);
	end;
	
procedure RecorrerMaestro(var arch: maestro);
	var
		reg: reg_mae;
	begin
		while not eof(arch) do begin
			read(arch, reg);
			ImprimirRegMae(reg);
		end;
	end;
	
var
	regmae: reg_mae;
	mae: maestro;
	detalles: arreglo_detalle;
	registros: arreglo_regdet;
	min: reg_det;
	input: string[20];
BEGIN
	//Inicializar variables y archivos
	write('nombre del archivo maestro: '); readln(input);
	assign(mae, SUFIJO + input);
	rewrite(mae);
	AbriryLeerDetalles(detalles, registros);
	Minimo(detalles, registros, min);
	//Recorrer archivos detalles para mergearlos en el maestro
	while (min.cod_usuario <> VALOR_ALTO) do begin
		regmae.cod_usuario:= min.cod_usuario;
		regmae.tm_total_sesiones:= 0;
		//Mientras se lea al mismo codigo de usuario en los detalles
		while (min.cod_usuario = regmae.cod_usuario) do begin
			regmae.fecha:= min.fecha;
			//Mientras se lea al mismo usuario con la misma fecha en los detalles
			while (min.cod_usuario = regmae.cod_usuario) and (min.fecha = regmae.fecha) do begin
				regmae.tm_total_sesiones:= regmae.tm_total_sesiones + min.tm_sesion;
				Minimo(detalles, registros, min);
			end;
		end;
		//Escribir el registro con toda la informacion acumulada del mismo codigo de usuario y misma fecha
		write(mae, regmae);
	end;
	//Cerrar los archivos
	close(mae);
	CerrarDetalles(detalles);
	//Abrir y cerrar
	reset(mae);
	writeln;
	RecorrerMaestro(mae);
	close(mae);
END.
