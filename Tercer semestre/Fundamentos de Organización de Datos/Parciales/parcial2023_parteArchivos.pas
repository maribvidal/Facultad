program parcial2023;

const PREFIJO = 'parcial2023_';

type
	reg_empleado = record 
		dni: integer;
		nombre: string[20];
		apellido: string[20];
		edad: integer;
		domicilio: string[30];
		fecha_nac: string[10];
	end;
	
	arch = file of reg_empleado;
	
procedure ImprimirRegistro(reg: reg_empleado);
	begin
		writeln(' --- ', reg.dni, ' --- ');
		writeln(' NOMBRE: ', reg.nombre, ' / Apellido: ', reg.apellido, ' / Edad: ', reg.edad);
		writeln(' DOMICILIO: ', reg.domicilio, ' / Fecha nacimiento: ', reg.fecha_nac);
		writeln(' -------------- ');
		writeln;
	end;

procedure ImprimirArchivo(var a: arch);
	var
		reg: reg_empleado;
	begin
		Reset(a);
		while not eof(a) do begin
			read(a, reg);
			ImprimirRegistro(reg);
		end;
		Close(a);
	end;

function existeEmpleado(var a: arch; dni: integer):boolean;
	var
		reg: reg_empleado;
	begin
		Reset(a);
		read(a, reg);
		while not eof(a) and (reg.dni <> dni) do begin
			read(a, reg);
		end;
		Close(a);
		existeEmpleado:= reg.dni = dni;
	end;

procedure CargarEmpleado(var e: reg_empleado);
	begin
		write(' - DNI: '); readln(e.dni);
		write(' - NOMBRE: '); readln(e.nombre);
		e.apellido:= 'prueba';
		e.edad:= 0;
		e.domicilio:= 'dom';
		e.fecha_nac:= '01/01/2000';
	end;

procedure AgregarEmpleado(var a: arch);
	var
		cabecera: reg_empleado;
		reg: reg_empleado;
		insertar: reg_empleado;
	begin
		CargarEmpleado(insertar);
		if (existeEmpleado(a, insertar.dni)) then begin
			writeln(' * El empleado con DNI ', insertar.dni, ' ya se encuentra registrado');
		end else begin
			Reset(a);
			read(a, cabecera);
			if (cabecera.edad = 0) then begin
				seek(a, filesize(a));
				write(a, insertar);
			end else begin
				seek(a, cabecera.edad * -1);
				read(a, reg);
				seek(a, filepos(a) - 1);
				write(a, insertar);
				seek(a, 0);
				cabecera.edad:= reg.edad;
				write(a, cabecera);
			end;
			Close(a);
		end;
	end;
	
procedure QuitarEmpleado(var a: arch);
	var
		cabecera: reg_empleado;
		reg: reg_empleado;
		dni: integer;
	begin
		write(' * Ingrese un DNI: '); readln(dni);
		if (existeEmpleado(a, DNI)) then begin
			Reset(a);
			read(a, cabecera);
			read(a, reg);
			while not eof(a) and (reg.dni <> dni) do begin
				read(a, reg);
			end;
			seek(a, filepos(a) - 1);
			reg.edad:= cabecera.edad;
			cabecera.edad:= filepos(a) * -1;
			write(a, reg);
			seek(a, 0);
			write(a, cabecera);
			Close(a);
		end else begin
			writeln(' * El empleado con DNI ', dni, ' no existe');
		end;
	end;

var
	archivo: arch;
	userInput: string;
begin
    write(' * Ingrese nombre del archivo: '); readln(userInput);
    Assign(archivo, PREFIJO + userInput);
    ImprimirArchivo(archivo);
    
    QuitarEmpleado(archivo);
    AgregarEmpleado(archivo);
    
    ImprimirArchivo(archivo);
end.
