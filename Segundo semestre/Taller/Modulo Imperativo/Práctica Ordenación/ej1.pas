program ordEj1;
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
	vectorCodigos = array [1..MAX_CONST] of integer;
function esPar(num: integer):boolean;
    begin
        esPar:= ((num mod 2) = 0); //Si el resultado da 0, es porque el número efectivamente es par
    end;
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
function encontrarElem(vec: vectorVentas; dimL, valor: integer):integer;
    var
        i: integer;
    begin
        i:= 1;
        while (i <= dimL) and (vec[i].codigo < valor) do begin
            i:= i + 1;
        end;
        if (i > dimL) then //Si no se encontró el elemento...
            encontrarElem:= 0
        else               //Si se encontró...
            encontrarElem:= i;
    end;
function encontrarElem2(vec: vectorVentas; pos, dimL, valor: integer):integer;
    begin
        while (pos <= dimL) and (vec[pos].codigo <= valor) do begin
            pos:= pos + 1;
        end;
        if (pos > dimL) then //Si no se encontró el elemento...
            encontrarElem2:= dimL
        else               //Si se encontró...
            encontrarElem2:= pos - 1; //Sustraer una unidad ya que se para de leer un espacio después
    end;
procedure eliminarElemVector(var vec: vectorVentas; var dimL: integer; valorMenor, valorMayor: integer);
	var
		i, posMin, posMax, rango: integer;
	begin
		i:= 0;
		if (dimL > 0) then begin //Primero fijarse si queda espacio
			posMin:= encontrarElem(vec, dimL, valorMenor);
			posMax:= encontrarElem2(vec, posMin, dimL, valorMayor);
			//ELIMINAR TODOS LOS ELEMENTOS DEL VECTOR QUE SE ENCUENTREN EN ESTE RANGO
			rango:= posMax - posMin;
			for i:= posMax to dimL do begin
			    vec[i - rango]:= vec[i]; //Reemplazar el elemento de tal posición por el nuevo
			end;
			dimL:= dimL - rango; //Sustraer, de la dimensión lógica, los espacios que ya no se utilizan
		end;
	end;
procedure moduloG(vec: vectorVentas; dimL: integer; var vec2: vectorCodigos; var dimL2, cantVentas: integer);
    var
        i, j: integer;
    begin
        j:= 0;
        for i:= 1 to dimL do begin
            if (esPar(vec[i].codigo)) and (dimL2 <= MAX_CONST) then begin
                j:= j + 1;
                vec2[j]:= vec[i].codigo;
                dimL2:= j;
            end;
            cantVentas:= cantVentas + 1;
        end;
    end;
procedure informarVector3(vec: vectorCodigos; dimL: integer);
	var
		i: integer;
	begin
		for i:= 1 to dimL do begin
			writeln('CÓDIGO DEL PRODUCTO: ', vec[i]);
		end;
	end;
var
	vector, vector2: vectorVentas;
	vector3: vectorCodigos;
	dimL, dimL2, dimL3, cantVentas: integer;
begin
	Randomize; //Generar numeros
	cantVentas:= 0;
	dimL:= 0;
	dimL2:= 0;
	dimL3:= 0;
	cargarVector(vector, dimL); //Inciso A
	informarVector(vector, dimL); //Inciso B
	ordenarVector(vector, dimL); //Inciso C
	vector2:= vector;
	dimL2:= dimL;
	informarVector(vector, dimL); //Inciso D
	eliminarElemVector(vector, dimL, 5, 8); //Inciso E
	informarVector(vector, dimL); //Inciso F
	moduloG(vector2, dimL2, vector3, dimL3, cantVentas); //Inciso G
	informarVector3(vector3, dimL3);
	write('Cantidad total de ventas realizadas: ', cantVentas);
end.
