program parcial;

uses sysutils;

const 
	CORTE = 9000;
	N = 5;
	PREFIJO = 'parcial_';

type
	registro = record
		cod_farmaco: integer;
		nombre: string[20];
		fecha: string[10];
		cantidad_vendida: integer;
		forma_pago: string[40];
	end;
	
	detalle = file of registro;
	
	arr_reg = array [1..N] of registro;
	arr_det = array [1..N] of detalle;
	
procedure Leer(var arch: detalle; var reg: registro);
	begin
		if not eof(arch) then
			read(arch, reg)
		else
			reg.cod_farmaco:= CORTE;
	end;
	
procedure Minimo(var archivos: arr_det; var registros: arr_reg; var minimo: registro);
	var
		codigoMin: integer;
		i: integer;
		indiceMin: integer;
	begin
		codigoMin:= 9999;
		
		for i:=1 to N do begin
			if (registros[i].cod_farmaco < codigoMin) then begin
				codigoMin:= registros[i].cod_farmaco;
				indiceMin:= i;
				minimo:= registros[i];
			end;
		end;
		
		Leer(archivos[indiceMin], registros[indiceMin]);
	end;
	
procedure AbrirDetalles(var archivos: arr_det; var registros: arr_reg);
	var
		i: integer;
	begin
		for i:=1 to N do begin
			Assign(archivos[i], PREFIJO + 'detalle' + i.ToString());
			Reset(archivos[i]);
			read(archivos[i], registros[i]);
		end;
	end;
	
procedure CerrarDetalles(var archivos: arr_det);
	var
		i: integer;
	begin
		for i:=1 to N do
			close(archivos[i]);
	end;
	
procedure IncisoA();
	var
		arregloDet: arr_det;
		arregloReg: arr_reg;
		min: registro;

		cantidadMax: integer;
		cantidadActual: integer;
		codigoActual: integer;
		nombreMax: string[20];
		nombreActual: string[20];
	begin
		cantidadMax:= -1;
		AbrirDetalles(arregloDet, arregloReg);
		Minimo(arregloDet, arregloReg, min);
		
		while (min.cod_farmaco <> CORTE) do begin
			cantidadActual:= 0;
			codigoActual:= min.cod_farmaco;
			nombreActual:= min.nombre;
			
			while (min.cod_farmaco <> CORTE) and (min.cod_farmaco = codigoActual) do begin
				cantidadActual:= cantidadActual + min.cantidad_vendida;
				Minimo(arregloDet, arregloReg, min);
			end;
			
			if (cantidadActual > cantidadMax) then begin
				cantidadMax:= cantidadActual;
				nombreMax:= nombreActual;
			end;
		end;
		
		writeln('El farmaco con mas ventas es: ', nombreMax);
		CerrarDetalles(arregloDet);
	end;
	
procedure IncisoB();
	var
		archTxt: Text;
		arregloDet: arr_det;
		arregloReg: arr_reg;
		min: registro;
		
		codigoActual: integer;
		cantidadVentas: integer;
		fechaActual: string;
		nombreActual: string;
	begin
		AbrirDetalles(arregloDet, arregloReg);
		
		Assign(archTxt, PREFIJO + 'exportado.txt');
		Rewrite(archTxt);
		
		Minimo(arregloDet, arregloReg, min);
		
		while (min.cod_farmaco <> CORTE) do begin
			codigoActual:= min.cod_farmaco;
			nombreActual:= min.nombre;
			
			while (min.cod_farmaco <> CORTE) and (min.cod_farmaco = codigoActual) do begin
				cantidadVentas:= 0;
				fechaActual:= min.fecha;
				
				while (min.cod_farmaco <> CORTE) and (min.cod_farmaco = codigoActual) and (min.fecha = fechaActual) do begin
					cantidadVentas:= cantidadVentas + min.cantidad_vendida;
					Minimo(arregloDet, arregloReg, min);
				end;
				
				writeln(archTxt, codigoActual, ' ', nombreActual);
				writeln(archTxt, cantidadVentas, ' ', fechaActual);
			end;
		end;
		
		Close(archTxt);
		
		CerrarDetalles(arregloDet);
	end;
begin
	IncisoA();
	IncisoB();
end.
