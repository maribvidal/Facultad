program parcial2017;

uses sysutils;

const
	CORTE = 99999999;
	PREFIJO = 'parcial2017_';
	N = 3;

type
	reg_mae = record 
		dni_alumno: longint;
		codigo_carrera: integer;
		monto_total_pagado: real;
	end;
	
	reg_det = record 
		dni_alumno: longint;
		codigo_carrera: integer;
		monto_cuota: real;
	end;
	
	arch_mae = file of reg_mae;
	arch_det = file of reg_det;
	
	arr_det = array [1..N] of arch_det;
	arr_reg = array [1..N] of reg_det;
	
procedure ImprimirRegistro(reg: reg_mae);
	begin
		writeln(' --- ', reg.dni_alumno, ' --- ');
		writeln(' Codigo Carrera: ', reg.codigo_carrera, ' / Monto total pagado: ', reg.monto_total_pagado:2:2);
		writeln(' -------------- ');
		writeln;
	end;

procedure ImprimirArchivo(var a: arch_mae);
	var
		reg: reg_mae;
	begin
		Reset(a);
		while not eof(a) do begin
			read(a, reg);
			ImprimirRegistro(reg);
		end;
		Close(a);
	end;
	
procedure LeerMae(var a: arch_mae; var reg: reg_mae);
	begin
		if not eof(a) then
			read(a, reg)
		else
			reg.dni_alumno:= CORTE;
	end;
	
procedure LeerDet(var a: arch_det; var reg: reg_det);
	begin
		if not eof(a) then
			read(a, reg)
		else
			reg.dni_alumno:= CORTE;
	end;

procedure Minimo(var arrDet: arr_det; var arrReg: arr_reg; var min: reg_det);
	var
		i: integer;
		indiceMin: integer;
		dniMin: longint;
	begin
		dniMin:= 99999990;
		for i:=1 to N do begin
			if (arrReg[i].dni_alumno < dniMin) then begin
				dniMin:= arrReg[i].dni_alumno;
				indiceMin:= i;
			end;
		end;
		min:= arrReg[indiceMin];
		LeerDet(arrDet[indiceMin], min);
	end;

procedure CargarDetalles(var arrDet: arr_det; var arrReg: arr_reg);
	var
		i: integer;
	begin
		for i:=1 to N do begin
			Assign(arrDet[i], PREFIJO + 'detalle' + i.ToString());
			Reset(arrDet[i]);
			read(arrDet[i], arrReg[i]);
		end;
	end;
	
procedure CerrarDetalles(var arrDet: arr_det);
	var
		i: integer;
	begin
		for i:=1 to N do
			Close(arrDet[i]);
	end;

procedure IncisoA(var mae: arch_mae);
	var
		regMae: reg_mae;
		min: reg_det;
		arrDet: arr_det;
		arrReg: arr_reg;
		montoActual: real;
		dniActual: longint;
		carreraActual: integer;
	begin
		Reset(mae);
		CargarDetalles(arrDet, arrReg);
		read(mae, regMae);
		Minimo(arrDet, arrReg, min);
		while (min.dni_alumno <> CORTE) do begin
			dniActual:= min.dni_alumno;
			while (min.dni_alumno <> CORTE) and (min.dni_alumno = dniActual) do begin
				carreraActual:= min.codigo_carrera;
				montoActual:= 0;
				while (min.dni_alumno <> CORTE) and (min.dni_alumno = dniActual) and (min.codigo_carrera = carreraActual) do begin
					montoActual:= montoActual + min.monto_cuota;
					Minimo(arrDet, arrReg, min);
				end;
				while (regMae.dni_alumno <> dniActual) do
					LeerMae(mae, regMae);
				regMae.monto_total_pagado:= regMae.monto_total_pagado + montoActual;
				seek(mae, filepos(mae) - 1);
				write(mae, regMae);
				if not eof(mae) then
					LeerMae(mae, regMae);
			end;
		end;
		CerrarDetalles(arrDet);
		Close(mae);
	end;
	
procedure IncisoB(var mae: arch_mae);
	var
		montoPagado: real;
		reg: reg_mae;
		dniActual: longint;
		carreraActual: integer;
		archText: Text;
	begin
		Reset(mae);
		Assign(archText, PREFIJO + 'exportado.txt');
		Rewrite(archText);
		read(mae, reg);
		while (reg.dni_alumno <> CORTE) do begin
			dniActual:= reg.dni_alumno;
			while (reg.dni_alumno <> CORTE) and (reg.dni_alumno = dniActual) do begin
				carreraActual:= reg.codigo_carrera;
				montoPagado:= 0;
				while (reg.dni_alumno <> CORTE) and (reg.dni_alumno = dniActual) and (reg.codigo_carrera = carreraActual) do begin
					montoPagado:= montoPagado + reg.monto_total_pagado;
					LeerMae(mae, reg);
				end;
				if (montoPagado = 0) then
					writeln(archText, dniActual, ' ', carreraActual, ' alumno moroso');
			end;
		end;
		close(archText);
		close(mae);
	end;

var
	archivo: arch_mae;
	userInput: string;
begin
    write(' * Ingrese nombre del archivo: '); readln(userInput);
    Assign(archivo, PREFIJO + userInput);
    IncisoA(archivo);
    IncisoB(archivo);
    ImprimirArchivo(archivo);
end.
