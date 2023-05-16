program test;
const
    dimF = 10; //Se dispone de la información de 10 ciudades.
type
    ciudad = record
        personas: 0..9999;
    end;
    vector = array [1..dimF] of ciudad; //Su peso en memoria es igual a 2 (int) * 10 (dimF) = (20 bytes)
procedure cargarVector(var v: vector; var dimL: integer);
    var
        i: integer;
        seguir_cargando: char;
    begin
        i:= 0;
        seguir_cargando:= 'S';
        while (i <= dimF) and (seguir_cargando = 'S') do begin
            i:= i + 1;
            dimL:= dimL + 1;
            write('Ingrese la cantidad de personas en la ciudad [',i,']: >'); readln(v[i].personas);
            if (i < dimF) then begin 
                write('¿Seguir leyendo?: >'); 
                readln(seguir_cargando); 
            end;
            writeln;
        end;
    end;
procedure swap(var a, b: integer);
	var
		temp: integer;
	begin
		temp:= a;
		a:= b;
		b:= temp;
	end;
procedure agregarElemento(var v: vector; var dimL: integer; elemento: integer);
    begin
        if (dimL+1 <= dimF) then begin //Si la dimensión lógica sumado 1 es menor o igual que la dimensión física, es porque sigue quedando espacio dentro del vector
            v[dimL].personas:= elemento;
            dimL:= dimL + 1;
        end else begin
            writeln('NO SE PUDO AGREGAR OTRO ELEMENTO - FALTA DE ESPACIO');
        end;
    end;
procedure insertarElemento(var v: vector; var dimL: integer; elemento, pos: integer);
    var
        i: integer;
    begin
        //Desplazar todos los elementos del de la posición deseada hasta el último de la dimensión lógica, solo si hay espacio para otro elemento en el vector
        if (dimL+1 <= dimF) and (pos > 0) and (pos <= dimL) then begin
            for i:= dimL downto pos do begin
                v[i+1]:= v[i];
            end;
            v[pos].personas:= elemento;
            dimL:= dimL + 1;
        end else begin
            writeln('NO SE PUDO AGREGAR OTRO ELEMENTO - FALTA DE ESPACIO');
        end;
    end;
procedure eliminarElemento(var v: vector; var dimL: integer; pos: integer);
    var
        i: integer;
    begin
        //Desplazar todos los elementos un lugar atrás, solo si el espacio del vector es mayor a 1, y la posición ingresada es válida
        if (dimL-1 > 0) and (pos > 0) and (pos <= dimL) then begin
            for i:= pos to (dimL-1) do begin
                v[i]:= v[i+1];
            end;
            dimL:= dimL - 1;
        end else begin
            writeln('NO SE PUDO QUITAR OTRO ELEMENTO - VECTOR MUY CHICO');
        end;
    end;
procedure bubbleSort(v: vector; dimL: integer);
    var
        i,j: integer;
    begin
        for i:=1 to dimL do begin
            for j:=1 to (dimL-i) do begin
                if (v[j].personas > v[j+1].personas) then begin
                    swap(v[j].personas, v[j+1].personas);
                end;
            end;
        end;
        for i:=1 to dimL do begin
            writeln(v[i].personas);
        end;
    end;
var
    v: vector;
    i, dimL: integer;
begin
    writeln(sizeof(v), ' bytes');
    cargarVector(v, dimL);
    bubbleSort(v, dimL); //Solo para leer las ciudades mas pobladas   
    writeln;
    insertarElemento(v, dimL, 5, 5);
    eliminarElemento(v, dimL, 4);
    for i:= 1 to dimL do begin
        writeln(v[i].personas);
    end;
end.
