program pr2ej16;

Uses sysutils;

const
	VALOR_ALTO = 9999;
	PREFIJO = 'pr2ej16_';
	TOPE = 5;
	
type
	regMoto = record
		codigo: integer;
		nombre: string[20];
		desc: string[100];
		modelo: integer;
		marca: string[20];
		stockActual: integer;
		end;
	regDet = record
		codigo: integer;
		precio: real;
		fechaVenta: string[10];
		end;
		
	maestro = file of regMoto;
	detalle = file of regDet;
	arrDetalles = array [1..TOPE] of detalle;
	arrRegDet = array [1..TOPE] of regDet;
	
procedure Leer(var arch: detalle; var reg: regDet);
	begin
		if not eof(arch) then
			read(arch, reg)
		else
			reg.codigo:= VALOR_ALTO;
	end;
	
procedure ImprimirMae(regm: regMoto);
	begin
		with regm do
			writeln(' Codigo: ', codigo,' / Nombre: ', nombre,' / Stock actual: ', stockActual);
	end;
	
procedure CargarDetalles(var detalles: arrDetalles);
	var
		i: integer;
		userInput: string[20];
	begin
		write('nombre de los detalles: '); readln(userInput);
		for i:=1 to TOPE do begin
			Assign(detalles[i], PREFIJO + userInput + i.ToString() + '.dat');
			Reset(detalles[i]);
		end;
	end;
	
procedure LeerDetalles(var detalles: arrDetalles; var registros: arrRegDet);
	var
		i: integer;
	begin
		for i:=1 to TOPE do
			Leer(detalles[i], registros[i]);
	end;
	
procedure Minimo(var detalles: arrDetalles; var registros: arrRegDet; var min: regDet);
	var
		i: integer;
		codigoMin: integer;
		indiceMin: integer;
	begin
		codigoMin:= 32767;
		for i:= 1 to TOPE do begin
			if (registros[i].codigo < codigoMin) then begin
				codigoMin:= registros[i].codigo;
				indiceMin:= i;
			end;
		end;
		min:= registros[indiceMin];
		Leer(detalles[indiceMin], registros[indiceMin]);
	end;
	
procedure CerrarDetalles(var detalles: arrDetalles);
	var
		i: integer;
	begin
		for i:=1 to TOPE do
			close(detalles[i]);
	end;

procedure Actualizar(var mae: maestro);
	var
		detalles: arrDetalles;
		registros: arrRegDet;
		codigo_aux: integer;
		motomax_codigo: integer;
		motomax_ventas: integer;
		min: regDet;
		regm: regMoto;
		tot_ventas: integer;
	begin
		//Inicializar variables
		motomax_codigo:= 0;
		motomax_ventas:= -1;
		CargarDetalles(detalles);
		LeerDetalles(detalles, registros);
		Minimo(detalles, registros, min);
		read(mae, regm);
		
		//Recorrer archivos detalle
		while (min.codigo <> VALOR_ALTO) do begin
			codigo_aux:= min.codigo;
			tot_ventas:= 0;
			while (min.codigo <> VALOR_ALTO) and (min.codigo = codigo_aux) do begin
				tot_ventas:= tot_ventas + 1; //Cada registro que contenga el código de la moto cuenta como una venta
				Minimo(detalles, registros, min);
			end;
			//Actualizar máximo
			if (tot_ventas > motomax_ventas) then begin
				motomax_ventas:= tot_ventas;
				motomax_codigo:= codigo_aux;
			end;
			//Buscar registro en el archivo maestro
			while (regm.codigo <> codigo_aux) do begin
				read(mae, regm);
			end;
			ImprimirMae(regm);
			regm.stockActual:= regm.stockActual - tot_ventas;
			seek(mae, filepos(mae)-1);
			write(mae, regm);
			ImprimirMae(regm);
			if not eof(mae) then
				read(mae, regm);
		end;
		
		//Informar la moto mas vendida
		writeln('LA MOTO MAS VENDIDA -- ');
		write(' Codigo: ', motomax_codigo,' / Ventas: ', motomax_ventas);
		
		//Cerrar archivos
		CerrarDetalles(detalles);
	end;

//Orden del archivo - código de moto
var
	archivo: maestro;
begin
	Assign(archivo, PREFIJO + 'maestro.dat');
	Reset(archivo);
	Actualizar(archivo);
	close(archivo);
end.
