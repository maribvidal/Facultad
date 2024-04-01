program ejercicioKete;

const
	charCorte = 'z';

function IngresarChar():char;
	var
		c: char;
	begin
		write('Ingrese un caracter: ');
		readln(c);
		IngresarChar:= c;
	end;

procedure ModuloA(var cantPalabras: integer);
	var
		contador: integer;
		caracter: char;
	begin
		//Por lo menos siempre va a haber una palabra, ya que se procesa la 'z'
		cantPalabras:= 1;
		contador:= 0;
		repeat
			caracter:= IngresarChar();
			contador:= contador + 1;
			//Contar las palabras por espacio
			if (caracter = ' ') then
				cantPalabras:= cantPalabras + 1;
			writeln('CARACTER: ', caracter);
		until ((caracter = charCorte) or (contador > 499)) //Hay que procesar el último carácter
	end;
	
procedure ModuloB(var cantPalabras: integer);
	var
		contador: integer;
		caracter: char;
		inicioPalabra: boolean;
	begin
		cantPalabras:= 0;
		contador:= 0;
		inicioPalabra:= true;
		repeat
			caracter:= IngresarChar();
			contador:= contador + 1;
			//Revisar inicio de palabra
			if inicioPalabra then begin
				if (caracter = 'R') then
					cantPalabras:= cantPalabras + 1;
				inicioPalabra:= false;
			end;
			//Contar las palabras por espacio
			if (caracter = ' ') then
				inicioPalabra:= true;
			writeln('CARACTER: ', caracter);
		until ((caracter = charCorte) or (contador > 499)) //Hay que procesar el último carácter
	end;
	
procedure ModuloC(var cantPalabras: integer);
	var
		contador: integer;
		caracter, carviejo: char;
	begin
		cantPalabras:= 0;
		contador:= 0;
		caracter:= '9'; //Valor auxiliar
		repeat
			carviejo:= caracter; //Guardar el caracter anterior
			caracter:= IngresarChar();
			contador:= contador + 1;
			//Contar las palabras por espacio y controlar la palabra anterior
			if (caracter = ' ') then begin
				if (carviejo = 'T') then
					cantPalabras:= cantPalabras + 1;
			end;
			writeln('CARACTER: ', caracter);
		until ((caracter = charCorte) or (contador > 499)) //Hay que procesar el último carácter
	end;
	
procedure ModuloD(var cantPalabras: integer);
	var
		contador: integer;
		caracter, carviejo, carnuevo: char;
		inicioPalabra: boolean;
	begin
		cantPalabras:= 0;
		contador:= 0;
		caracter:= '9'; //Valor auxiliar
		inicioPalabra:= true;
		repeat
			carviejo:= caracter; //Guardar el caracter anterior
			caracter:= IngresarChar();
			contador:= contador + 1;
			//Revisar inicio de palabra
			if inicioPalabra then begin
				carnuevo:= caracter; //Guardar la primera letra de la palabra
				inicioPalabra:= false;
			end;
			//Contar las palabras por espacio y controlar la palabra anterior
			if (caracter = ' ') then begin
				if (carviejo = 'N') then begin //Si la última letra es una N
					if (carnuevo = 'R') then //Si la primera letra fue una R
						cantPalabras:= cantPalabras + 1;
				end;
				inicioPalabra:= true;
			end;
			writeln('CARACTER: ', caracter);
		until ((caracter = charCorte) or (contador > 499)) //Hay que procesar el último carácter
	end;
	
procedure ModuloE(var cantPalabras: integer);
	var
		contador, contadorL, contadorP: integer;
		caracter: char;
	begin
		cantPalabras:= 0;
		contador:= 0; //Contador de letras general
		contadorL:= 0; //Contador de letras por palabra
		contadorP:= 0; //Contador de Ps
		repeat
			caracter:= IngresarChar();
			contador:= contador + 1;
			//Contar si hay una 'p'
			if (caracter = 'p') then
				contadorP:= contadorP + 1;
			//Contar las palabras por espacio
			if (caracter = ' ') then begin
				//Comprobar si la palabra cumple con la condicion
				if ((contadorL < 6) and (contadorP = 2)) then
					cantPalabras:= cantPalabras + 1;
				//Reiniciar contadores auxiliares
				contadorL:= 0;
				contadorP:= 0;
			end;
			writeln('CARACTER: ', caracter);
		until ((caracter = charCorte) or (contador > 499)) //Hay que procesar el último carácter
	end;

var
	cantPalabras: integer; //Lleva la cuenta de las palabras
begin
	ModuloA(cantPalabras);
	writeln('Cantidad de palabras: ', cantPalabras);
	ModuloB(cantPalabras);
	writeln('Cantidad de palabras que comienzan con R: ', cantPalabras);
	ModuloC(cantPalabras);
	writeln('Cantidad de palabras que terminan con T: ', cantPalabras);
	ModuloD(cantPalabras);
	writeln('Cantidad de palabras que comienzan con R y terminan con N: ', cantPalabras);
	ModuloE(cantPalabras);
	writeln('Cantidad de palabras con menos de 6 letras que contienen 2 p: ', cantPalabras);
end.
