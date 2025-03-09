program parcial2015;

uses sysutils;

const
	CORTE = 9999;
	PREFIJO = 'parcial2015_';
	N = 3;

type
	reg_mae = record
		codigo_prod: integer;
		nombre: string[20];
		descripcion: string[100];
		codigo_barras: longint;
		categoria_prod: integer;
		stock_actual: integer;
		stock_minimo: integer;
	end;
	
	reg_det = record
		codigo_prod: integer;
		cant_pedida: integer;
		descripcion: string[100];
	end;
	
	arch_mae = file of reg_mae;
	arch_det = file of reg_det;
	
	arr_det = array [1..N] of arch_det;
	arr_reg = array [1..N] of reg_det;

procedure LeerMae(var mae:arch_mae; var reg:reg_mae);
	begin
		if not eof(mae) then
			read(mae, reg)
		else
			reg.codigo_prod:= CORTE;
	end;

procedure LeerDet(var det:arch_det; var reg:reg_det);
	begin
		if not eof(det) then
			read(det, reg)
		else
			reg.codigo_prod:= CORTE;
	end;
	
procedure InformarRegMae(reg: reg_mae);
	begin
		writeln(' - Codigo producto: ', reg.codigo_prod);
		writeln(' - Codigo nombre: ', reg.nombre);
		writeln(' - Codigo stock actual: ', reg.stock_actual);
		writeln(' - Codigo stock minimo: ', reg.stock_minimo);
		writeln;
	end;
	
procedure InformarMae(var mae: arch_mae);
	var
		regMae: reg_mae;
	begin
		Reset(mae);
		read(mae, regMae);
		while (regMae.codigo_prod <> CORTE) do begin
			InformarRegMae(regMae);
			LeerMae(mae, regMae);
		end;
		Close(mae);
	end;
	
procedure InformarBajoStock(reg: reg_mae);
	begin
		writeln('#Producto codigo ', reg.codigo_prod, ' de categoria ', reg.categoria_prod, ' se encuentra por debajo del stock minimo');
	end;

procedure InformarFaltaStock(reg: reg_mae; dif: integer);
	begin
		writeln('El producto codigo ', reg.codigo_prod, ' tiene ', dif, ' de diferencia');
	end;
	
procedure CargarDetalles(var arrDet: arr_det; var arrReg: arr_reg);
	var
		i: integer;
	begin
		for i:=1 to N do begin
			Assign(arrDet[i], PREFIJO + 'detalle' + i.ToString());
			Reset(arrDet[i]);
			Read(arrDet[i], arrReg[i]);
		end;
	end;
	
procedure CerrarDetalles(var arrDet: arr_det);
	var
		i: integer;
	begin
		for i:=1 to N do
			Close(arrDet[i]);
	end;
	
procedure Minimo(var arrDet: arr_det; var arrReg: arr_reg; var min: reg_det);
	var
		codigoMin, i, indiceMin: integer;
	begin
		codigoMin:= 9990;
		for i:=1 to N do begin
			if (arrReg[i].codigo_prod < codigoMin) then begin
				codigoMin:= arrReg[i].codigo_prod;
				indiceMin:= i;
			end;
		end;
		min:= arrReg[indiceMin];
		LeerDet(arrDet[indiceMin], arrReg[indiceMin]);
	end;

procedure ActualizarMaestro(var mae:arch_mae);
	var
		regMae: reg_mae; min: reg_det;
		codigoActual, stockPedido, dif: integer;
		arrReg: arr_reg; arrDet: arr_det;
	begin
		Reset(mae);
		CargarDetalles(arrDet, arrReg);
		read(mae, regMae);
		Minimo(arrDet, arrReg, min);
		
		while (min.codigo_prod <> CORTE) do begin
			stockPedido:= 0;
			codigoActual:= min.codigo_prod;
			dif:= 0;
			
			while (min.codigo_prod <> CORTE) and (min.codigo_prod = codigoActual) do begin
				stockPedido:= stockPedido + min.cant_pedida;
				Minimo(arrDet, arrReg, min);
			end;
			
			//Encontrar registro en el archivo maestro
			while (regMae.codigo_prod <> codigoActual) do
				LeerMae(mae, regMae);
			dif:= regMae.stock_actual - stockPedido;
			
			if (regMae.stock_minimo > (regMae.stock_actual - stockPedido)) then begin
				InformarBajoStock(regMae);
				if (regMae.stock_actual - stockPedido >= 0) then begin
					regMae.stock_actual:= regMae.stock_actual - stockPedido;
				end else begin
					regMae.stock_actual:= 0;
					dif:= dif + regMae.stock_actual;
					dif:= dif * -1;
					InformarFaltaStock(regMae, dif);
				end;
			end else begin
				regMae.stock_actual:= regMae.stock_actual - stockPedido;
			end;
			
			seek(mae, filepos(mae) - 1);
			write(mae, regMae);
			if (regMae.codigo_prod <> CORTE) then
				LeerMae(mae, regMae);
		end;
		
		CerrarDetalles(arrDet);
		Close(mae);
	end;

var
	archMae: arch_mae;
begin
	Assign(archMae, PREFIJO + 'maestro');
	InformarMae(archMae);
	ActualizarMaestro(archMae);
	InformarMae(archMae);
end.
