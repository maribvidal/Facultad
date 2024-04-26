program pr3par2ej1;

//	PRE-CONDICIONES
//	1. Los archivos no están ordenados por ningún criterio
//	2. Cada registro del maestro puede ser actualizado por
//	   0, 1 ó más registros del archivo detalle.

const
	CORTE = 9999;
	PREFIJO = 'pr3par2ej1_';

type
	producto = record
		codigo: integer;
		nombre: string[20];
		precio: real;
		stock_act: integer;
		stock_min: integer;
		end;
	
	venta = record
		codigo: integer;
		cantVendida: integer;
		end;
		
	maestro = file of producto;
	detalle = file of venta;
	
//	MÓDULOS GENERALES

procedure LeerMaestro(var arch: maestro; var reg: producto);
	begin
		if not eof(arch) then
			read(arch, reg)
		else
			reg.codigo:= CORTE;
	end;
	
procedure LeerDetalle(var arch: detalle; var reg: venta);
	begin
		if not eof(arch) then
			read(arch, reg)
		else
			reg.codigo:= CORTE;
	end;
	
procedure ImprimirProducto(reg: producto);
	begin
		writeln('   ------   ');
		writeln(' * Codigo: ', reg.codigo);
		writeln(' * Nombre: ', reg.nombre);
		writeln(' * Precio: ', reg.precio:2:2);
		writeln(' * Stock actual:  ', reg.stock_act);
		writeln(' * Stock minimo: ', reg.stock_min);
	end;
	
procedure ImprimirArchivo(var mae: maestro);
	var
		reg: producto;
	begin
		Reset(mae);
		LeerMaestro(mae, reg);
		while (reg.codigo <> CORTE) do begin
			ImprimirProducto(reg);
			LeerMaestro(mae, reg);
		end;
		Close(mae);
	end;
	
procedure ResetearPuntero(var mae: maestro);
	begin
		if (filepos(mae) <> 0) then
			seek(mae, 0);
	end;
	
procedure ActualizarMaestro(var mae: maestro; var det: detalle);
	var
		regmae: producto;
		regdet: venta;
	begin
		Reset(mae);
		Reset(det);
		LeerMaestro(mae, regmae);
		LeerDetalle(det, regdet);
		
		//Por primera y segunda pre-condicion, sabemos que el archivo no está
		//ordenado Y que pueden haber multiples instancias de un producto
		//con igual código, por lo que no nos queda otra que recorrer el
		//archivo maestro entero por cada registro en el detalle
		while (regdet.codigo <> CORTE) do begin
			ResetearPuntero(mae);
			while (regmae.codigo <> CORTE) do begin
				if (regmae.codigo = regdet.codigo) then begin
					regmae.stock_act:= regmae.stock_act - regdet.cantVendida;
					seek(mae, filepos(mae) - 1);
					write(mae, regmae);
				end;
				LeerMaestro(mae, regmae);
			end;
			LeerDetalle(det, regdet);
		end;
		Close(mae);
		Close(det);
	end;

//	PROGRAMA PRINCIPAL
var
	mae: maestro;
	det: detalle;
	entradaUsuario: string;
begin
	//Cargar archivo
	writeln('Ingrese el nombre del archivo maestro: '); readln(entradaUsuario);
	Assign(mae, PREFIJO + entradaUsuario);
	ImprimirArchivo(mae);
	writeln;
	
	entradaUsuario:= 'si';
	while (entradaUsuario = 'si') do begin
		write('Ingrese el nombre de un archivo detalle: '); readln(entradaUsuario);
		Assign(det, PREFIJO + entradaUsuario);
		ActualizarMaestro(mae, det);
		write('Si desea usar otro archivo detalle diga si: '); readln(entradaUsuario);
	end;
	
	ImprimirArchivo(mae);
end.
