program pr3ej6;

//	PRE-CONDICIONES
//	El maestro no está ordenado
//	Si existe un registro en el detalle, también existe en el maestro

const
	CORTE = 9999;
	PREFIJO = 'pr3ej6_';

type
	prenda = record
		cod_prenda: integer;
		descripcion: string[100];
		colores: string[50];
		tipo_prenda: string[20];
		stock: integer;
		precio_unitario: real;
		end;
		
	maestro = file of prenda;
	detalle = file of integer; //Solo va a almacenar los códigos
	
//	MÓDULOS GENERALES
procedure LeerMaestro(var mae: maestro; var regMae: prenda);
	begin
		if not eof(mae) then
			read(mae, regMae)
		else
			regMae.cod_prenda:= CORTE;
	end;
	
procedure LeerDetalle(var det: detalle; var cod: integer);
	begin
		if not eof(det) then
			read(det, cod)
		else
			cod:= CORTE;
	end;

//Debug
procedure ImprimirPrenda(pren: prenda);
	begin
		writeln(' --- ');
		writeln(' CODIGO: ', pren.cod_prenda, ' / Stock: ', pren.stock ,' / Descripcion: ', pren.descripcion);
	end;
	
procedure ImprimirMaestro(var mae: maestro);
	var
		regMae: prenda;
	begin
		Reset(mae);
		LeerMaestro(mae, regMae);
		while (regMae.cod_prenda <> CORTE) do begin
			ImprimirPrenda(regMae);
			LeerMaestro(mae, regMae);
		end;
		Close(mae);
	end;

//	PROCEDIMIENTO BAJA LÓGICA
procedure BajaLogica(var mae: maestro; var regMae: prenda);
	begin
		regMae.stock:= regMae.stock * -1;
		seek(mae, filepos(mae) - 1);
		write(mae, regMae);
	end;

procedure ActualizarCatalogo(var mae: maestro; var det: detalle);
	var
		regMae: prenda;
		det_cod_prenda: integer;
	begin
		//Abrir archivos para lectura/escritura
		Reset(mae);
		Reset(det);
		
		//Leer sus primeros registros
		LeerMaestro(mae, regMae);
		LeerDetalle(det, det_cod_prenda);
		
		//El archivo no está ordenado, por lo que no podemos utilizar ningún criterio de búsqueda
		while (det_cod_prenda <> CORTE) do begin
			//Revisar si el puntero del archivo maestro está en la posición inicial
			if (filepos(mae) <> 0) then
				seek(mae, 0);
			
			//Por la segunda pre-condición, el registro debe encontrarse
			while (regMae.cod_prenda <> CORTE) and (regMae.cod_prenda <> det_cod_prenda) do
				LeerMaestro(mae, regMae);
			
			//Realizar la baja lógica correspondiente y avanzar en el archivo detalle
			BajaLogica(mae, regMae);
			LeerDetalle(det, det_cod_prenda);
		end;
		
		//Cerrar archivos
		Close(mae);
		Close(det);
	end;
	
//	PROCEDIMIENTO BAJA FÍSICA
procedure BajaFisica(var mae: maestro; nombreMae: string);
	var
		archivoNuevo: maestro;
		regMae: prenda;
	begin
		//Creamos un nuevo archivo
		Assign(archivoNuevo, PREFIJO + 'temp.dat');
		Rewrite(archivoNuevo);
		
		Reset(mae);
		LeerMaestro(mae, regMae);
		
		//Recorrer archivo maestro
		while (regMae.cod_prenda <> CORTE) do begin
			//Si el stock del registro es inferior a 0, es porque ese registro se encuentra borrado
			if (regMae.stock >= 0) then
				write(archivoNuevo, regMae);
			
			LeerMaestro(mae, regMae);
		end;
		
		//Reemplazar nuevo archivo por el maestro
		Close(mae);
		Erase(mae);
		Close(archivoNuevo);
		Rename(archivoNuevo, PREFIJO + nombreMae);
	end;

//	PROGRAMA PRINCIPAL
var
	entradaUsuario: string;
	det: detalle;
	mae: maestro;
begin
	//Cargar archivo detalle
	writeln('Ingrese el nombre del archivo detalle: '); readln(entradaUsuario);
	Assign(det, PREFIJO + entradaUsuario);
	writeln;

	//Cargar archivo maestro
	writeln('Ingrese el nombre del archivo maestro: '); readln(entradaUsuario);
	Assign(mae, PREFIJO + entradaUsuario);
	writeln;
	
	//Realizar la baja lógica de las prendas obsoletas
	ActualizarCatalogo(mae, det);
	
	//Realizar la baja física de los registros borrados, generando un nuevo archivo
	BajaFisica(mae, entradaUsuario);
end.
