program pr2ej8;

const
	VALOR_ALTO = 9999;
	PREFIJO = 'pr2ej8_';
	
type
	registro = record
		codigo: integer;
		nombre: string[20];
		apellido: string[20];
		anio: integer;
		mes: integer;
		dia: integer;
		monto: real;
		end;
	
	maestro = file of registro;
	
procedure Leer(var arch: maestro; var reg: registro);
	begin
		if not eof(arch) then
			read(arch, reg)
		else
			reg.codigo:= VALOR_ALTO;
	end;
	
//Orden del archivo (cod. cliente > año > mes)
var
	archivo: maestro;
	reg: registro;
	tot_mensual: real;
	tot_comprado: real;
	tot_empresa: integer;
	codigo_viejo: integer;
	anio_viejo: integer;
	mes_viejo: integer;
begin
	//Cargar archivo
	Assign(archivo, PREFIJO + 'maestro.dat'); //Asignación lógica
	Reset(archivo);
	tot_empresa:= 0;
	read(archivo, reg);
	while (reg.codigo <> VALOR_ALTO) do begin
		codigo_viejo:= reg.codigo;
		//Imprimir la información del cliente
		writeln(' -- CLIENTE ', reg.codigo, ' -- ');
		writeln(' -- nombre: ', reg.nombre, ', apellido: ', reg.apellido, ' -- ');
		//Mientras sea el mismo cliente
		while (reg.codigo = codigo_viejo) and (reg.codigo <> VALOR_ALTO) do begin
			//Imprimir la información del cliente
			anio_viejo:= reg.anio;
			writeln(' -- ANIO ', anio_viejo,' -- ');
			tot_comprado:= 0; //monto total comprado en el año por el cliente
			//Mientras las compras se hayan efectuado en el mismo año
			while (reg.anio = anio_viejo) and (reg.codigo <> VALOR_ALTO) do begin
				tot_mensual:= 0; //el total mensual (mes por mes cuánto compró) 
				mes_viejo:= reg.mes;
				writeln(' -- MES ', mes_viejo,' -- ');
				//Mientras las compras se hayan efectuado en el mismo mes
				while (reg.mes = mes_viejo) and (reg.codigo <> VALOR_ALTO) do begin
					tot_mensual:= tot_mensual + reg.monto;
					writeln(' -- COMPRA POR ', reg.monto:2:2,' -- ');
					tot_empresa:= tot_empresa + 1; //Contar las ventas totales de la empresa
					Leer(archivo, reg); //Avanzar en el archivo maestro
				end;
				writeln(' -- total del mes: ', tot_mensual:2:2,' -- ');
				tot_comprado:= tot_comprado + tot_mensual;
			end;
			writeln(' -- total del anio: ', tot_comprado:2:2,' -- ');
			writeln;
		end;
	end;
	
	writeln('TOTAL DE VENTAS DE LA EMPRESA: ', tot_empresa);
	close(archivo);
end.
