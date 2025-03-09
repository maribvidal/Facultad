program parcial2018;

const PREFIJO = 'parcial2018_';

type
	registro = record 
		anio: integer;
		mes: integer;
		dia: integer;
		idUsuario: integer;
		tiempo_acceso: integer;
	end;
	
	arch = file of registro;
	
procedure ImprimirRegistro(reg: registro);
	begin
		writeln(' --- ', reg.anio, ' --- ');
		writeln(' MES: ', reg.mes, ' / Dia: ', reg.dia);
		writeln(' ID Usuario: ', reg.idUsuario, ' / Tiempo de acceso: ', reg.tiempo_acceso);
		writeln(' -------------- ');
		writeln;
	end;

procedure ImprimirArchivo(var a: arch);
	var
		reg: registro;
	begin
		Reset(a);
		while not eof(a) do begin
			read(a, reg);
			ImprimirRegistro(reg);
		end;
		Close(a);
	end;

//Si no incluyo esto no se lee el último registro
procedure Leer(var a: arch; var reg: registro);
	begin
		if not eof(a) then
			read(a, reg)
		else
			reg.anio:= 9999;
	end;

procedure RealizarInforme(var a: arch);
	var
		reg: registro;
		tot_acceso: integer;
		tot_acceso_mes: integer;
		tot_acceso_dia: integer;
		input: integer;
		mes_act: integer;
		dia_act: integer;
	begin
		Reset(a);
		tot_acceso:= 0;
		write('Ingrese un anio: '); readln(input);
		
		//Comprobar si existe el año
		read(a, reg);
		while (not eof(a)) and (reg.anio <> input) do
			read(a, reg);
		
		if (reg.anio <> input) then begin
			write('Anio no encontrado');
		end else begin
			//Realizar informe
			writeln('Anio:--');
			while (reg.anio <> 9999) and (reg.anio = input) do begin
				tot_acceso_mes:= 0;
				mes_act:= reg.mes;
				writeln('	Mes:-- ', mes_act);
				while (reg.anio <> 9999) and (reg.anio = input) and (reg.mes = mes_act) do begin
					tot_acceso_dia:= 0;
					dia_act:= reg.dia;
					writeln('		Dia:-- ', dia_act);
					writeln('			idUsuario Tiempo total de acceso en el día ',dia_act,' mes ',mes_act);
					while (reg.anio <> 9999) and (reg.anio = input) and (reg.mes = mes_act) and (reg.dia = dia_act) do begin
						writeln('			', reg.idUsuario,' / ',reg.tiempo_acceso);
						tot_acceso_dia:= tot_acceso_dia + reg.tiempo_acceso;
						Leer(a, reg);
					end;
					writeln('		Tiempo total de acceso dia ', dia_act, ' mes ', mes_act);
					writeln('		', tot_acceso_dia);
					tot_acceso_mes:= tot_acceso_mes + tot_acceso_dia;
				end;
				writeln('	Tiempo total de acceso mes ', mes_act);
				writeln('	', tot_acceso_mes);
				tot_acceso:= tot_acceso + tot_acceso_mes;
			end;
			writeln('Total tiempo de acceso anio');
			writeln(tot_acceso);
		end;
		Close(a);
	end;

var
	archivo: arch;
	userInput: string;
begin
    write(' * Ingrese nombre del archivo: '); readln(userInput);
    Assign(archivo, PREFIJO + userInput);
    ImprimirArchivo(archivo);
    writeln;
    RealizarInforme(archivo);
end.
