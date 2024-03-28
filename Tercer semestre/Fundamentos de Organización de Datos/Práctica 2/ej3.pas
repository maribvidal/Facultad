program pr2ej3;

const
	VALOR_ALTO = 9999;
	PREFIJO = 'pr2ej3_';

type
	venta = record
		codigo: integer;
		cantV: integer;
		end;
	producto = record
		codigo: integer;
		nombre: string[20];
		stockA, stockM: integer;
		precio: real;
		end;
	detalle = file of venta;
	maestro = file of producto;
	
var
	user_input: string;
	
procedure Leer(var archDet: detalle; var ven: venta);
	begin
		if not eof(archDet) then
			read(archDet, ven)
		else
			ven.codigo:= VALOR_ALTO;
	end;

procedure Actualizar(var archMae: maestro);
	var
		archDet: detalle;
		prod: producto;
		codigo_aux, tot_ventas: integer;
		ven: venta;
	begin
		write('nombre del archivo detalle: '); readln(user_input);
		assign(archDet, PREFIJO + user_input);
		reset(archDet);
		Leer(archDet, ven);
		seek(archMae, 0);
		read(archMae, prod);
		writeln;
		while (ven.codigo <> VALOR_ALTO) do begin
			codigo_aux:= ven.codigo;
			writeln('producto codigo: ', codigo_aux);
			tot_ventas:= 0;
			while (ven.codigo = codigo_aux) do begin
				tot_ventas:= tot_ventas + ven.cantV;
				writeln('ventas realizadas: ', tot_ventas);
				Leer(archDet, ven);
			end;
			while (prod.codigo <> codigo_aux) do
				read(archMae, prod);
			writeln('stock viejo del producto: ', prod.stockA);
			prod.stockA:= prod.stockA - tot_ventas;
			writeln('stock actual del producto: ', prod.stockA);
			writeln('producto actualizado con exito');
			writeln;
			seek(archMae, filepos(archMae)-1);
			write(archMae, prod);
			if not eof(archMae) then
				read(archMae, prod);
		end;
		close(archDet);
	end;
	
procedure Exportar(var archMae: maestro);
	var
		texto: Text;
		prod: producto;
	begin
		assign(texto, PREFIJO + 'stock_minimo.txt');
		rewrite(texto);
		seek(archMae, 0);
		while not eof(archMae) do begin
			read(archMae, prod);
			writeln(' (print) CODIGO: ', prod.codigo, ' / Precio: ', prod.precio:2:2, ' / Stock actual: ', prod.stockA,' / Stock mínimo: ', prod.stockM, ' / Nombre: ', prod.nombre);
			if (prod.stockA < prod.stockM) then
				writeln(texto, 'CODIGO: ', prod.codigo, ' / Precio: ', prod.precio:2:2, ' / Stock actual: ', prod.stockA,' / Stock mínimo: ', prod.stockM, ' / Nombre: ', prod.nombre);
		end;
		close(texto);
	end;
	
var
	mae: maestro;
	opcion: integer;
begin
	write('nombre del archivo maestro: '); readln(user_input);
	assign(mae, PREFIJO + user_input);
	reset(mae);
	writeln;
	opcion:= -1;
	while (opcion <> 0) do begin
		writeln('MENU - 2: Actualizar - 1: Exportar - 0: Terminar');
		write('OPCION: '); readln(opcion);
		case opcion of
			2: Actualizar(mae);
			1: Exportar(mae);
		end;
	end;
	writeln('programa terminado');
	close(mae);
end.
