program pr2ej5;

Uses sysutils; //Para poder usar el i.ToString()

const
	VALOR_ALTO = 9999;
	PREFIJO = 'pr2ej5_';
	SUFIJO = '.dat';
	TOPE = 3;
	
type
	t_det = 1..TOPE;
	regMae = record
		codigo: integer;
		stockDisp: integer;
		stockMin: integer;
		precio: real;
		nombre: string[20];
		desc: string[100];
		end;
	regDet = record
		codigo: integer;
		cantVendida: integer;
		end;
	maestro = file of regMae;
	detalle = file of regDet;
	detArr = array [t_det] of detalle;
	regArr = array [t_det] of regDet;

//VARIABLES GLOBALES - se usan en todo el programa -
var
	userInput: string[20];
	i: integer;

procedure Leer(var arch: detalle; var reg: regDet);
	begin
		if not eof(arch) then
			read(arch, reg)
		else
			reg.codigo:= VALOR_ALTO;
	end;

procedure Minimo(var arregloArch: detArr; var arregloReg: regArr; var min: regDet);
	var
		codigoMin, i, indiceMin: integer;
	begin
		codigoMin:= VALOR_ALTO;
		for i:=1 to TOPE do begin
			writeln('log 6 ', arregloReg[i].codigo, ' ', i, ' ', codigoMin);
			if (arregloReg[i].codigo < codigoMin) then begin
				codigoMin:= arregloReg[i].codigo;
				writeln('log 5');
				min:= arregloReg[i];
				indiceMin:= i;
				writeln('posicion detalle ', i, ' es igual a ', filepos(arregloArch[i]));
			end;
		end;
		Leer(arregloArch[indiceMin], arregloReg[indiceMin]);
	end;

procedure AbriryCargarDetalles(var arrDet: detArr; var arrReg: regArr);
	begin
		write('ingrese nombre de los archivos detalle: '); readln(userInput);
		for i:=1 to TOPE do begin
			assign(arrDet[i], PREFIJO + userInput + i.ToString() + SUFIJO);
			reset(arrDet[i]);
			writeln(filepos(arrDet[i]), ' ', filesize(arrDet[i]), ' ', i);
			Leer(arrDet[i], arrReg[i]);
		end;
	end;

procedure CerrarDetalles(var arrDet: detArr);
	begin
		for i:=1 to TOPE do
			close(arrDet[i]);
	end;

var
	archTexto: Text;
	archMae: maestro;
	arrDet: detArr;
	arrReg: regArr;
	codigoAux, totalVentas: integer;
	min: regDet;
	rMae: regMae;
begin
	//Inicializar archivos
	write('ingrese nombre del archivo maestro: '); readln(userInput);
	assign(archMae, PREFIJO + userInput + SUFIJO);
	reset(archMae);
	read(archMae, rMae);
	AbriryCargarDetalles(arrDet, arrReg);
	write('ingrese nombre del archivo texto: '); readln(userInput);
	assign(archTexto, PREFIJO + userInput + '.txt');
	rewrite(archTexto);
	Minimo(arrDet, arrReg, min);
	
	//Recorrer detalles
	while (min.codigo <> VALOR_ALTO) do begin
		//Conseguir la totalidad de las ventas de determinado producto
		codigoAux:= min.codigo;
		totalVentas:= 0;
		writeln('log 3');
		while (min.codigo = codigoAux) do begin
			totalVentas:= totalVentas + min.cantVendida;
			writeln(totalVentas);
			Minimo(arrDet, arrReg, min);
		end;
		writeln('log 1 ', codigoAux, ' ', filepos(archMae));
		//Actualizar registro del archivo maestro
		rMae.stockDisp:= rMae.stockDisp - totalVentas;
		seek(archMae, filepos(archMae)-1);
		write(archMae, rMae);
		writeln('log 4');
		//Escribir en el archivo de texto
		writeln(archTexto, 'CODIGO: ', rMae.codigo, ' / Stock disponible: ', rMae.stockDisp, ' / Stock minimo: ', rMae.stockMin);
		writeln(archTexto, 'NOMBRE: ', rMae.nombre, ' / Descripcion: ', rMae.desc);
		if (rMae.stockDisp < rMae.stockMin) then
			writeln(archTexto, 'PRECIO: ', rMae.precio:2:2);
		writeln('log 2');
		//Avanzar en el archivo maestro
		if not eof(archMae) then
			read(archMae, rMae);
	end;
	
	//Cerrar archivos
	close(archTexto);
	CerrarDetalles(arrDet);
	close(archMae);
end.
