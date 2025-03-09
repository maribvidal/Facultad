program pr2ej10;

const
	VALOR_ALTO = 9999;
	PREFIJO = 'pr2ej10_';
	
type
	t_categoria = 1..15;
	empleado = record
		depto: integer;
		division: integer;
		nro: integer;
		categoria: integer;
		horasExtra: integer;
		end;
		
	valorHora = record
		categoria: integer;
		valor: real;
		end;
		
	arregloValor = array [t_categoria] of double;
	maestro = file of empleado;
	
procedure Leer(var arch: maestro; var reg: empleado);
	begin
		if not eof(arch) then
			read(arch, reg)
		else
			reg.depto:= VALOR_ALTO;
	end;
	
procedure CargarArreglo(var valores_arr: arregloValor);
	var
		texto: Text;
		reg: valorHora;
		i: integer;
	begin
		Assign(texto, PREFIJO + 'valores.txt');
		reset(texto);
		for i:=1 to 15 do begin
			readln(texto, reg.categoria, reg.valor);
			valores_arr[i]:= reg.valor;
		end;
		close(texto);
	end;
	
//Orden del archivo (depto. > div. > nro. empleado)
var
	archivo: maestro;
	depto_viejo: integer;
	div_vieja: integer;
	monto: real;
	reg: empleado;
	tot_horas_div: integer;
	tot_monto_div: real;
	tot_horas_depto: integer;
	tot_monto_depto: real;
	valores_arr: arregloValor;
begin
	//Cargar archivo
	Assign(archivo, PREFIJO + 'maestro.dat'); //Asignación lógica
	Reset(archivo);
	CargarArreglo(valores_arr);
	read(archivo, reg);
	
	//Recorrer archivo maestro
	while (reg.depto <> VALOR_ALTO) do begin
		depto_viejo:= reg.depto;
		writeln(' DEPARTAMENTO ', depto_viejo);
		tot_horas_depto:= 0;
		tot_monto_depto:= 0;
		while (reg.depto <> VALOR_ALTO) and (reg.depto = depto_viejo) do begin
			div_vieja:= reg.division;
			writeln('  DIVISION ', div_vieja);
			writeln('  Numero de Empleado / Total de Hs. / Importe a cobrar');
			tot_horas_div:= 0;
			tot_monto_div:= 0;
			while (reg.depto <> VALOR_ALTO) and (reg.division = div_vieja) do begin
				monto:= reg.horasExtra * valores_arr[reg.categoria];
				write('      ', reg.nro);
				write('                  ', reg.horasExtra);
				writeln('                ', monto:2:2);
				tot_horas_div:= tot_horas_div + reg.horasExtra;
				tot_monto_div:= tot_monto_div + monto;
				Leer(archivo, reg);
			end;
			writeln('  Total de horas division: ', tot_horas_div);
			writeln('  Monto total por division: ', tot_monto_div:2:2);
			tot_horas_depto:= tot_horas_depto + tot_horas_div;
			tot_monto_depto:= tot_monto_depto + tot_monto_div;
			writeln(' ------------------------ ');
		end;
		writeln(' Total de horas departamento: ', tot_horas_depto);
		writeln(' Monto total departamento: ', tot_monto_depto:2:2);
		writeln;
	end;
	
	//Cerrar archivo
	close(archivo);
end.
