program pr2ej18;

Uses sysutils;

const
	VALOR_ALTO = 9999;
	PREFIJO = 'pr2ej18_';
	N = 3;
	
type
	reg_nac = record
		nroPartida: integer;
		nombre: string[20];
		apellido: string[20];
		direccion: string[100];
		matMedico: integer;
		nomCompletoMadre: string[40];
		madreDNI: integer;
		nomCompletoPadre: string[40];
		padreDNI: integer;
		end;
		
	reg_fal = record
		nroPartida: integer;
		DNI: integer;
		nombreCompleto: string[20];
		matMedDeceso: integer;
		fechaHoraLugarDeceso: string[40];
		end;

	reg_mae = record
		nroPartida: integer;
		nombre: string[20];
		apellido: string[20];
		direccion: string[100];
		matMedico: integer;
		nomCompletoMadre: string[40];
		madreDNI: integer;
		nomCompletoPadre: string[40];
		padreDNI: integer;
		fallecio: boolean;
		//Estos registros solo se usan en el caso de que la persona haya fallecido
		matMedDeceso: integer;
		fechaHoraLugarDeceso: string[40];
		end;
		
	//Archivos
	det_nac = file of reg_nac;
	det_fal = file of reg_fal;
	maestro = file of reg_mae;
	
	//Vectores
	arr_nac = array [1..N] of det_nac;
	arr_reg_nac = array [1..N] of reg_nac;
	arr_fal = array [1..N]  of det_fal;
	arr_reg_fal = array [1..N] of reg_fal;
	
//Procedimientos de carga
procedure CargarNacimientos(var nacimientos: arr_nac; var registros_nac: arr_reg_nac);
	var
		i: integer;
	begin
		for i:= 1 to N do begin
			Assign(nacimientos[i], PREFIJO + 'nacimiento' + i.ToString() + '.dat';
			Reset(nacimientos[i]);
		end;
	end;
	
procedure CargarFallecimientos(var fallecimientos: arr_fal; var registros_fal: arr_reg_fal);
	var
		i: integer;
	begin
		for i:= 1 to N do begin
			Assign(fallecimientos[i], PREFIJO + 'fallecimiento' + i.ToString() + '.dat';
			Reset(fallecimientos[i]);
		end;
	end;
	
//Procedimientos de lectura
//Uno
procedure LeerNacimiento(var arch: det_nac; var reg: reg_nac);
	begin
		if not eof(arch) then
			read(arch, reg)
		else
			reg.nroPartida:= VALOR_ALTO;
	end;
	
//Varios
procedure LeerNacimientos(var nacimientos: arr_nac; var registros_nac: arr_reg_nac);
	var
		i: integer;
	begin
		for i:= 1 to N do
			LeerNacimiento(nacimientos[i], registros_nac[i]);
	end;
	
//Uno
procedure LeerFallecimiento(var arch: det_fal; var reg: reg_fal);
	begin
		if not eof(arch) then
			read(arch, reg)
		else
			reg.nroPartida:= VALOR_ALTO;
	end;

//Varios
procedure LeerFallecimientos(var fallecimientos: arr_fal; var registros_fal: arr_reg_fal);
	var
		i: integer;
	begin
		for i:= 1 to N do
			LeerFallecimiento(fallecimientos[i], registros_fal[i]);
	end;

//Orden del archivo - nro. partidas
var

begin
	//Inicializar variables
	casosTotal:= 0;

	//Se cuenta con un archivo con información
	Assign(archivo, PREFIJO + 'maestro.dat');
	Assign(archivoTexto, PREFIJO + 'exportado.txt');
	Reset(archivo);
	Rewrite(archivoTexto);
	Leer(archivo, reg);
	
	//Cerrar archivos
	close(archivo);
	close(archivoTexto);
end.
