program pr2ej18;

Uses sysutils;

const
	VALOR_ALTO = 9999;
	PREFIJO = 'pr2ej18_';
	N = 50;
	
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
		nombre: string[20];
		apellido: string[20];
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
procedure CargarNacimientos(var nacimientos: arr_nac);
	var
		i: integer;
	begin
		for i:= 1 to N do begin
			Assign(nacimientos[i], PREFIJO + 'nacimiento' + i.ToString() + '.dat');
			Reset(nacimientos[i]);
		end;
	end;
	
procedure CargarFallecimientos(var fallecimientos: arr_fal);
	var
		i: integer;
	begin
		for i:= 1 to N do begin
			Assign(fallecimientos[i], PREFIJO + 'fallecimiento' + i.ToString() + '.dat');
			Reset(fallecimientos[i]);
		end;
	end;
	
//Procedimientos de lectura
procedure LeerNacimiento(var arch: det_nac; var reg: reg_nac);
	begin
		if not eof(arch) then
			read(arch, reg)
		else
			reg.nroPartida:= VALOR_ALTO;
	end;
	
procedure LeerNacimientos(var nacimientos: arr_nac; var registros_nac: arr_reg_nac); //Varios
	var
		i: integer;
	begin
		for i:= 1 to N do
			LeerNacimiento(nacimientos[i], registros_nac[i]);
	end;
	
procedure LeerFallecimiento(var arch: det_fal; var reg: reg_fal);
	begin
		if not eof(arch) then
			read(arch, reg)
		else
			reg.nroPartida:= VALOR_ALTO;
	end;

procedure LeerFallecimientos(var fallecimientos: arr_fal; var registros_fal: arr_reg_fal); //Varios
	var
		i: integer;
	begin
		for i:= 1 to N do
			LeerFallecimiento(fallecimientos[i], registros_fal[i]);
	end;

procedure MinimoNacimiento(var nacimientos: arr_nac; var registros_nac: arr_reg_nac; var min: reg_nac);
	var
		i: integer;
		partidaMin: integer;
		indiceMin: integer;
	begin
		partidaMin:= 30000;
		for i:= 1 to N do begin
			if (registros_nac[i].nroPartida < partidaMin) then begin
				partidaMin:= registros_nac[i].nroPartida;
				indiceMin:= i;
			end;
		end;
		min:= registros_nac[indiceMin];
		LeerNacimiento(nacimientos[indiceMin], registros_nac[indiceMin]);
	end;

procedure MinimoFallecimiento(var fallecimientos: arr_fal; var registros_fal: arr_reg_fal; var min: reg_fal);
	var
		i: integer;
		partidaMin: integer;
		indiceMin: integer;
	begin
		partidaMin:= 30000;
		for i:= 1 to N do begin
			if (registros_fal[i].nroPartida < partidaMin) then begin
				partidaMin:= registros_fal[i].nroPartida;
				indiceMin:= i;
			end;
		end;
		min:= registros_fal[indiceMin];
		LeerFallecimiento(fallecimientos[indiceMin], registros_fal[indiceMin]);
	end;
	
procedure LimpiarRegMae(var reg: reg_mae);
	begin
		reg.nombre:= '';
		reg.apellido:= '';
		reg.direccion:= '';
		reg.matMedico:= 0;
		reg.nomCompletoMadre:= '';
		reg.madreDNI:= 0;
		reg.nomCompletoPadre:= '';
		reg.padreDNI:= 0;
		reg.fallecio:= false;
		reg.matMedDeceso:= 0;
		reg.fechaHoraLugarDeceso:= '';
	end;
	
procedure RellenarCampos(var reg: reg_mae; regnac: reg_nac; regfal: reg_fal);
	begin
		//El archivo se encuentra ordenado por número de partida
		if (regnac.nroPartida < regfal.nroPartida) then begin //Si la partida de nacimiento es menor que la de fallecimiento
			reg.nombre:= regnac.nombre;
			reg.apellido:= regnac.apellido;
			reg.direccion:= regnac.direccion;
			reg.matMedico:= regnac.matMedico;
			reg.nomCompletoMadre:= regnac.nomCompletoMadre;
			reg.madreDNI:= regnac.madreDNI;
			reg.nomCompletoPadre:= regnac.nomCompletoPadre;
			reg.padreDNI:= regnac.padreDNI;
			reg.fallecio:= false;
		end else if (regnac.nroPartida > regfal.nroPartida) then begin //Si la partida de fallecimiento es menor que la de nacimiento
			reg.nombre:= regfal.nombre;
			reg.apellido:= regfal.apellido;
			reg.fallecio:= true;
			reg.matMedDeceso:= regfal.matMedDeceso;
			reg.fechaHoraLugarDeceso:= regfal.fechaHoraLugarDeceso;
		end else begin //En el caso de que sean iguales, rellenar el registro con ambos registros
			reg.nombre:= regnac.nombre;
			reg.apellido:= regnac.apellido;
			reg.direccion:= regnac.direccion;
			reg.matMedico:= regnac.matMedico;
			reg.nomCompletoMadre:= regnac.nomCompletoMadre;
			reg.madreDNI:= regnac.madreDNI;
			reg.nomCompletoPadre:= regnac.nomCompletoPadre;
			reg.padreDNI:= regnac.padreDNI;
			reg.fallecio:= true;
			reg.matMedDeceso:= regfal.matMedDeceso;
			reg.fechaHoraLugarDeceso:= regfal.fechaHoraLugarDeceso;
		end;		
	end;
	
//Procedimientos de cierre de archivo
procedure CerrarDetalles(var arrNac: arr_nac; var arrFal: arr_fal);
	var
		i: integer;
	begin
		for i:=1 to N do begin
			close(arrNac[i]);
			close(arrFal[i]);
		end;
	end;
	
//Procedimientos de escritura de archivo
procedure ExportarMaestro(var arch: maestro);
	var
		archivoTexto: Text;
		reg: reg_mae;
	begin
		Assign(archivoTexto, PREFIJO + 'exportado.txt');
		Rewrite(archivoTexto);
		seek(arch, 0);
		while not eof(arch) do begin
			read(arch, reg);
			writeln(archivoTexto, 'Nro. Partida: ', reg.nroPartida, ' / Matrícula del médico: ', reg.matMedico ,' / Nombre: ', reg.nombre, ' / Apellido: ', reg.apellido, ' / Direccion: ', reg.direccion);
			writeln(archivoTexto, 'Nombre completo de la madre: ', reg.nomCompletoMadre, ' / DNI: ', reg.madreDNI, ' / Nombre completo del padre: ', reg.nomCompletoPadre, ' / DNI: ', reg.padreDNI);
			if (reg.fallecio) then
				writeln(archivoTexto, 'Ha fallecido el ', reg.fechaHoraLugarDeceso,' / Matricula del médico de deceso: ', reg.matMedDeceso);
		end;
		close(archivoTexto);
	end;
	
//Algunas funciones
function NroPartidaMenor(partida_nac: integer; partida_fal: integer):integer;
	var
		menor: integer;
	begin
		if (partida_nac <= partida_fal) then
			menor:= partida_nac //Contamos el caso en el que (partida_nac < partida_fal) y (partida_nac = partida_fal)
		else
			menor:= partida_fal; //Solo nos queda el caso en el que (partida_nac > partida_fal)
		NroPartidaMenor:= menor;
	end;

function SePuedeAvanzar(partida_nac: integer; partida_fal: integer):boolean;
	begin
		SePuedeAvanzar:= (partida_nac <> 9999) or (partida_fal <> 9999);
	end;
	
//Orden del archivo - nro. partidas
//En el siguiente código se asumen las siguientes cosas:
// - Hay igual cantidad de archivos de nacimiento que de fallecimiento

var
	archivoMaestro: maestro;
	minNac: reg_nac;
	minFal: reg_fal;
	nroPartidaActual: integer;
	regmae: reg_mae;
	userInput: string[20];
	
	arrNac: arr_nac;
	arrFal: arr_fal;
	arrRegNac: arr_reg_nac;
	arrRegFal: arr_reg_fal;
begin
	//Inicializar archivos
	write('Nombre del archivo que desea crear: '); readln(userInput);
	Assign(archivoMaestro, PREFIJO + userInput);
	Rewrite(archivoMaestro);
	CargarNacimientos(arrNac);
	LeerNacimientos(arrNac, arrRegNac);
	CargarFallecimientos(arrFal);
	LeerFallecimientos(arrFal, arrRegFal);
	MinimoNacimiento(arrNac, arrRegNac, minNac);
	MinimoFallecimiento(arrFal, arrRegFal, minFal);
	
	//Proceso de merge
	while (SePuedeAvanzar(minNac.nroPartida, minFal.nroPartida)) do begin
		nroPartidaActual:= NroPartidaMenor(minNac.nroPartida, minFal.nroPartida);
		//Ir creando el registro del maestro
		LimpiarRegMae(regmae);
		regmae.nroPartida:= nroPartidaActual;
		RellenarCampos(regmae, minNac, minFal);
		write(archivoMaestro, regmae);
		//Controlar el avance de los detalles
		if (minNac.nroPartida < minFal.nroPartida) then begin
			MinimoNacimiento(arrNac, arrRegNac, minNac);
		end else if (minFal.nroPartida < minNac.nroPartida) then begin
			MinimoFallecimiento(arrFal, arrRegFal, minFal);
		end else begin
			MinimoFallecimiento(arrFal, arrRegFal, minFal);
			MinimoNacimiento(arrNac, arrRegNac, minNac);
		end;
	end;
	
	//Exportar a archivo de texto
	ExportarMaestro(archivoMaestro);
	
	//Cerrar archivos
	close(archivoMaestro);
	CerrarDetalles(arrNac, arrFal);
end.
