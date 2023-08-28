program ordenacion;
const MAX_CONST = 50;
type t_dias = 0..30;
	t_codigo = 1..15;
	t_cantidad = 1..99;
	
	venta = record
		dia: t_dias;
		codigo: t_codigo;
		cantidad: t_cantidad;
	end;
	vectorVentas = array [1..MAX_CONST] of venta;
procedure generarVenta(var ven: venta);
	begin
		ven.dia:= Random(30);
		if (ven.dia <> 0) then begin //Si el día es diferente de 0...
			ven.codigo:= Random(15); 
			ven.cantidad:= Random(99);
		end;
	end;
procedure cargarVector(var vec: vectorVentas; var dimL: integer);
	var
		i: integer;
		ven: venta;
	begin
		i:= 1;
		ven.dia:= 1; //Inicializar
		while (i < MAX_CONST) and (ven.dia <> 0) do begin
			dimL:= dimL + 1; //Dimensión lógica
			generarVenta(vec[i]);
			i:= i + 1;
		end;
	end;
procedure informarVector(vec: vectorVentas; dimL: integer);
	var
		i: integer;
	begin
		for i:= 1 to dimL do begin
			writeln('<<VENTA NO.',i,'>>');
			writeln('DÍA DE LA VENTA: ', vec[i].dia);
			writeln('CÓDIGO DEL PRODUCTO: ', vec[i].codigo);
			writeln('CANTIDAD VENDIDA: ', vec[i].cantidad);
			writeln;
		end;
	end;
procedure ordenarVector(var vec: vectorVentas; dimL: integer);
	var
		i, j: integer;
		temp: venta;
	begin
		for i:= 1 to dimL do begin
			for j:= 1 to (dimL - i) do begin
				if (vec[j].codigo > vec[j+1].codigo) then begin //SWAP
					temp:= vec[j];
					vec[j]:= vec[j+1];
					vec[j+1]:= temp;
				end;
			end;
		end;
	end;
procedure eliminarElemVector(var vec: vectorVentas; var dimL: integer; valorMenor, valorMayor: integer);
	var
		i, j, posMin, posMax: integer;
	begin
		i:= 0;
		if (dimL > 0) then begin //Primero fijarse si queda espacio
			while (i <= dimL) and (vec[i].codigo < valorMenor) do begin //Recorrer lista hasta que encuentre tal posición
				i:= i + 1;
			end;
			if (i > dimL) then //Guardar posición min
				posMin:= i;
			while (i <= dimL) and (vec[i].codigo <= valorMayor) do begin
				i:= i + 1;
			end;
			if (i > dimL) then
				posMax:= i;
			//ELIMINAR TODOS LOS ELEMENTOS DEL VECTOR QU ESTÉN EN ESTE RANGO
			
			
		while (i <= dimL) and (dimL > 0) and (vec[i].codigo <= valorMayor) do begin
			i:= i + 1;
			if (vec[i].codigo >= valorMenor) and (vec[i].codigo <= valorMayor) then begin
				for j:= i to (dimL-1) do begin
					vec[j]:= vec[j+1];
				end;
				dimL:= dimL - 1;
			end;
		end;
	end;
var
	vector: vectorVentas;
	dimL: integer;
begin
	Randomize; //Generar numeros
	cargarVector(vector, dimL); //Inciso A
	informarVector(vector, dimL); //Inciso B
	ordenarVector(vector, dimL); //Inciso C
	informarVector(vector, dimL); //Inciso D
	eliminarElemVector(vector, dimL, 5, 8); //Inciso E
	informarVector(vector, dimL); //Inciso F
end.
