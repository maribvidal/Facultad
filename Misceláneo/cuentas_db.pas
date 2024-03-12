program prueba;

Uses sysutils;

const
	vec_dimF = 50;

type
	cuenta = record
		nombre: string[10];
		contra: string[10];
	end;
	database = file of cuenta;
	vec_cuentas = array [1..vec_dimF] of cuenta;

procedure leerArchivo(var archivo: database; var v: vec_cuentas; var dimL: integer);
	begin
		{Leer el archivo hasta que se alcance EOF}
		while not eof(archivo) do
			begin
				read(archivo, v[dimL]);
				dimL:= dimL + 1;
			end;
	end;

procedure leerCuenta(var cu: cuenta);
	begin
		write('NOMBRE DE USUARIO: '); readln(cu.nombre);
		write('CONTRASEÑA: '); readln(cu.contra);
	end;
	
function existeCuenta(v: vec_cuentas; dimL: integer; nombre: string):boolean;
	var
		siExiste: boolean;
		i: integer;
	begin
		i:= 0;
		siExiste:= false;
		while (i < dimL) and not (siExiste) do begin
			siExiste:= (v[i].nombre = nombre);
			i:= i + 1;
		end;
		existeCuenta:= siExiste;
	end;

var
	archivo_db: database;
	cuenta_nueva: cuenta;
	vector: vec_cuentas;
	vec_dimL, i: integer;
	opcion: integer;
	cu_nombre: string[10];

begin
	{Inicialización}
	vec_dimL:= 0;
	opcion:= -1;
	{Asignar nombre lógico a un archivo físico}
	assign(archivo_db, 'database.dat');
	{Comprobar si el archivo existe o hay que crearlo}
	if FileExists('database.dat') then begin
		reset(archivo_db);
	end else begin
		rewrite(archivo_db);
	end;
	{Llenar el vector con toda la información que posea el archivo}
	leerArchivo(archivo_db, vector, vec_dimL);
	{Elegir una de las dos opciones}
	writeln('¿Desea registrar una cuenta, o buscarla si es que ya existe, o leer nuestra base de datos? (0/1/2): '); readln(opcion);
	if (opcion = 0) then begin
		{El límite de cuentas es de 50}
		if (vec_dimL < 50) then begin
			leerCuenta(cuenta_nueva);
			if (existeCuenta(vector, vec_dimL, cuenta_nueva.nombre)) then begin
				writeln('Una cuenta con el mismo nombre ya se encuentra registrada en nuestra base de datos');
			end else begin
				write(archivo_db, cuenta_nueva);
				writeln('Una nueva cuenta ha sido registrada con exito');
			end;
		end else begin
			writeln('Lo sentimos, ya se alcanzo el máximo de espacio');
		end;
	end else if (opcion = 1) then begin {Opción 1}
		writeln('INGRESE EL NOMBRE DE LA CUENTA QUE BUSCA: '); readln(cu_nombre);
		if (existeCuenta(vector, vec_dimL, cu_nombre)) then begin
			writeln('Esa cuenta se encuentra registrada en nuestra base de datos');
		end else begin
			writeln('Esa cuenta no se encuentra registrada en nuestra base de datos');
		end;
	end else begin
		for i:= 1 to vec_dimL do begin
			writeln('NOMBRE DE LA CUENTA: ', vector[i].nombre, ' / CONTRASENA: ', vector[i].contra, ' / POSICION: ', i);
		end;
	end;
	{Cerrar archivo}
	close(archivo_db);
end.
