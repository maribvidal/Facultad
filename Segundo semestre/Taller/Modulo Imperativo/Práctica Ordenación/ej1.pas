program ordenacion;
type
	//SUBRANGOS
	t_dias = 0..30;
	t_codigo = 1..15;
	t_cantidad = 1..99;
	
	venta = record
		dia: t_dias;
		codigo: t_codigo;
		cantidad: t_cantidad;
	end;
procedure generarVenta(var ven: venta)
	begin
		Random(ven.dias);
		if (ven.dia <> 0) then begin //Si el día es diferente de 0...
			Random(ven.codigo);
			Random(ven.cantidad);
		end
	end;
var
	ven: venta;
begin
	Randomize; //Generar numeros
	generarVenta(ven);
	while (ven.dia <> 0) do begin //Mientras el día sea diferente de 0...
		writeln('DÍA DE LA VENTA: ', ven.dia);
		writeln('CÓDIGO DEL PRODUCTO: ', ven.codigo);
		writeln('CANTIDAD VENDIDA: ', ven.cantidad);
		writeln;
		generarVenta(ven);
	end;
end.
