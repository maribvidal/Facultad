program pr2ej17;

Uses sysutils;

const
	VALOR_ALTO = 9999;
	PREFIJO = 'pr2ej17_';
	
type
	registro = record
		codigoLoc: integer;
		nombreLoc: string[20];
		codigoMun: integer;
		nombreMun: string[20];
		codigoHosp: integer;
		nombreHosp: string[20];
		fecha: string[10];
		cantP: integer;
		end;
		
	maestro = file of registro;
	
procedure Leer(var arch: maestro; var reg: registro);
	begin
		if not eof(arch) then
			read(arch, reg)
		else
			reg.codigoLoc:= VALOR_ALTO;
	end;

procedure Imprimir(reg: registro);
	begin
		with reg do begin
			writeln(' LOCALIDAD ', nombreLoc, ' ', codigoLoc);
			writeln(' MUNICIPIO ', nombreMun, ' ', codigoMun);
			writeln(' HOSPITAL ', nombreHosp, ' ', codigoHosp);
			writeln(' Fecha: ', fecha, ' / Cantidad: ', cantP);
			writeln;
		end;
	end;
	
procedure ExportarRegistro(var arch: Text; casosMun: integer; reg: registro);
	begin
		writeln(arch, casosMun, ' ', reg.nombreMun, ' ', reg.nombreLoc);
	end;

//Orden del archivo - código localidad > código municipio > código hospital
var
	archivo: maestro;
	archivoTexto: Text;
	casosHosp, casosMun, casosLoc, casosTotal: integer;
	codLocViejo, codHospViejo, codMunViejo: integer;
	nomMunViejo, nomLocViejo: string[20];
	reg: registro;
begin
	//Inicializar variables
	casosTotal:= 0;

	//Se cuenta con un archivo con información
	Assign(archivo, PREFIJO + 'maestro.dat');
	Assign(archivoTexto, PREFIJO + 'exportado.txt');
	Reset(archivo);
	Rewrite(archivoTexto);
	Leer(archivo, reg);
	
	//Recorrer todo el archivo e ir imprimiendo cada corte de control
	while (reg.codigoLoc <> VALOR_ALTO) do begin
		codLocViejo:= reg.codigoLoc;
		nomLocViejo:= reg.nombreLoc;
		casosLoc:= 0;
		writeln('Nombre: ', reg.nombreLoc);
		//Recorrer campo localidad
		while (reg.codigoLoc <> VALOR_ALTO) and (reg.codigoLoc = codLocViejo) do begin
			codMunViejo:= reg.codigoMun;
			nomMunViejo:= reg.nombreMun;
			casosMun:= 0;
			writeln('   Nombre: ', reg.nombreMun);
			//Recorrer campo municipio
			while (reg.codigoLoc <> VALOR_ALTO) and (reg.codigoLoc = codLocViejo) and (reg.codigoMun = codMunViejo) do begin
				codHospViejo:= reg.codigoHosp;
				casosHosp:= 0;
				writeln('         Nombre: ', reg.nombreHosp, '...........Cantidad de casos ',reg.nombreHosp);
				//Recorrer campo hospital
				while (reg.codigoLoc <> VALOR_ALTO) and (reg.codigoLoc = codLocViejo) and (reg.codigoMun = codMunViejo) and (reg.codigoHosp = codHospViejo) do begin
					//Acumular los casos positivos detectados
					casosHosp:= casosHosp + reg.cantP;
					Leer(archivo, reg);
				end;
				writeln('         ', casosHosp);
				casosMun:= casosMun + casosHosp;
			end;
			writeln('   Cantidad de casos ', nomMunViejo);
			writeln('   ', casosMun);
			casosLoc:= casosLoc + casosMun;
			
			//Si los casos del municipio superan los 1500, entonces exportar registro
			if (casosMun > 1500) then
				ExportarRegistro(archivoTexto, casosMun, reg);
		end;
		writeln('Cantidad de casos ', nomLocViejo);
		writeln(casosLoc);
		casosTotal:= casosTotal + casosLoc;
		writeln('----------------------');
	end;
	writeln;
	writeln('Cantidad de casos Totales en la Provincia = ', casosTotal);
	
	//Cerrar archivos
	close(archivo);
	close(archivoTexto);
end.
