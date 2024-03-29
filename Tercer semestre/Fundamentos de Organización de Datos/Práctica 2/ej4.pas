program pr2ej4;

const
	VALOR_ALTO = 'ZZZZ';
	PREFIJO = 'pr2ej4_';

type
	regMae = record
		nomProv: string[20];
		cantA: integer; //alfabetizados
		totalE: integer; //total de encuestados
		end;
	regDet = record
		nomProv: string[20];
		codLoc: integer; //codigo de localidad
		cantA: integer;
		cantE: integer; //cuantos fueron encuestados
		end;
	maestro = file of regMae;
	detalle = file of regDet;
	
var
	userInput: string[20];

procedure Leer(var arch: detalle; var reg: regDet);
	begin
		if not eof(arch) then
			read(arch, reg)
		else
			reg.nomProv:= VALOR_ALTO;
	end;

procedure Minimo(var arch1, arch2: detalle; var det1, det2, min: regDet);
	begin
		if (det1.nomProv < det2.nomProv) then begin
			min:= det1;
			Leer(arch1, det1);
		end else begin
			min:= det2;
			Leer(arch2, det2);
		end;
	end;

procedure ImprimirRegMae(reg: regMae);
	begin
		with reg do
			writeln(nomProv, ' / Cantidad de Alfabetos: ', cantA, ' / Encuestados en total: ', totalE);
	end;

var
	mae: maestro;
	det1, det2: detalle;
	auxNom: string[20];
	regmaes: regMae;
	regdet1, regdet2, min: regDet;
	contAlfa, contEncu: integer;
begin
	write('ingrese nombre del archivo a actualizar: '); readln(userInput);
	assign(mae, PREFIJO + userInput);
	write('ingrese nombre del detalle 1: '); readln(userInput);
	assign(det1, PREFIJO + userInput);
	write('ingrese nombre del detalle 2: '); readln(userInput);
	assign(det2, PREFIJO + userInput);
	
	reset(mae);
	reset(det1);
	reset(det2);
	
	read(mae, regmaes);
	read(det1, regdet1);
	read(det2, regdet2);
	
	Minimo(det1, det2, regdet1, regdet2, min);
	while (min.nomProv <> VALOR_ALTO) do begin
		auxNom:= min.nomProv;
		contAlfa:= 0; contEncu:= 0;
		ImprimirRegMae(regmaes);
		while (auxNom = min.nomProv) do begin
			contAlfa:= contAlfa + min.cantA;
			contEncu:= contEncu + min.cantE;
			writeln('alfabetos: ', contAlfa, ' encuestados: ', contEncu);
			Minimo(det1, det2, regdet1, regdet2, min);
		end;
		//Actualizar el registro maestro y sobreescribirlo
		regmaes.cantA:= regmaes.cantA + contAlfa;
		regmaes.totalE:= regmaes.totalE + contEncu;
		seek(mae, filepos(mae)-1);
		write(mae, regmaes);
		ImprimirRegMae(regmaes);
		//Seguir leyendo archivo maestro
		if not eof(mae) then
			read(mae, regmaes);
	end;
	
	close(det2);
	close(det1);
	close(mae);
end.
