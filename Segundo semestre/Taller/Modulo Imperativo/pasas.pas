{1. Escribir un programa que:
a. Implemente un módulo que lea información de socios de un club y las almacene en un árbol
binario de búsqueda. De cada socio se lee número de socio, nombre y edad. La lectura finaliza
con el número de socio 0 y el árbol debe quedar ordenado por número de socio.
b. Una vez generado el árbol, realice módulos independientes que reciban el árbol como
parámetro y que :
i. Informe el número de socio más grande. Debe invocar a un módulo recursivo que
retorne dicho valor.
ii. Informe los datos del socio con el número de socio más chico. Debe invocar a un módulo
recursivo que retorne dicho socio.
iii. Informe el número de socio con mayor edad. Debe invocar a un módulo recursivo que
retorne dicho valor.
iv. Aumente en 1 la edad de todos los socios.
v. Lea un valor entero e informe si existe o no existe un socio con ese valor. Debe invocar a
un módulo recursivo que reciba el valor leído y retorne verdadero o falso.
vi. Lea un nombre e informe si existe o no existe un socio con ese nombre. Debe invocar a
un módulo recursivo que reciba el nombre leído y retorne verdadero o falso.
vii. Informe la cantidad de socios. Debe invocar a un módulo recursivo que retorne dicha
cantidad.
viii. Informe el promedio de edad de los socios. Debe invocar al módulo recursivo del inciso
vii e invocar a un módulo recursivo que retorne la suma de las edades de los socios.
xi. Informe los números de socio en orden creciente.
x. Informe los números de socio pares en orden decreciente.
}
program Ej1P3;
const 
  FIN = 0;
type
	socio = record
		nro: integer;
		nombre: string[20];
		edad: integer;
	end;
	arbol = ^nodo;
	nodo = record
		dato: socio;
		HI: arbol;
		HD: arbol;
	end;
procedure leerSocio(var s: socio);
	begin
		writeln('INGRESE NUM: '); readln(s.nro);
		if (s.nro <> FIN) then begin
			writeln('INGRESE NOMBRE: '); readln(s.nombre);
			writeln('INGRESE EDAD: '); readln(s.edad);
		end;
	end;
procedure agregarArbol(var a: arbol; dato: socio);
	begin
		if (a = nil) then begin
			new(a); a^.dato:= dato;
			a^.HI:= nil; a^.HD:= nil;
		end else begin
			if (dato.nro <= a^.dato.nro) then
				agregarArbol(a^.HI, dato)
			else
				agregarArbol(a^.HD, dato);
		end;
	end;
procedure cargarArbol(var a: arbol);
	var
		s: socio;
	begin
		leerSocio(s);
		while (s.nro <> FIN) do begin
			agregarArbol(a, s);
			writeln;
			leerSocio(s);
		end;
	end;
procedure imprimirOrden(a:arbol);
  begin
    if(a<>nil)then
      begin
        imprimirOrden(a^.HI);
        writeln(a^.dato.nro, ' / nombre: ',a^.dato.nombre,' / edad: ',a^.dato.edad);
        imprimirOrden(a^.HD);
      end;
  end;
function maximo(a:arbol):integer; //Punto B - Inciso I
  begin
    if(a<>nil)then begin//llego al final del lado derecho del arbol
     if (a^.HD <> nil) then begin
      maximo:= maximo(a^.HD);//llamo recursivamente para avanzar
     end else begin
        maximo:= a^.dato.nro;//cuando llego al final actualizo maximo
     end;
    end else begin
      maximo:= -1;//en caso de que el arbol este vacio
    end;
  end;
procedure minimo(a: arbol; var socioMin: socio); //Punto B - Inciso II
	begin
		if (a <> nil) then begin
			if (a^.HI <> nil) then begin
				minimo(a^.HI, socioMin);
			end else begin
				socioMin:= a^.dato;
			end;
		end;
	end;
procedure mayorEdad(a:arbol;var edadMax:integer;var codigo:integer); //Punto B - Inciso III
  begin
    if(a<>nil)then
      begin
        mayorEdad(a^.HI,edadMax,codigo);
        if(a^.dato.edad > edadMax)then begin
          codigo:=a^.dato.nro;
          edadmax:=a^.dato.edad;
          end;
        mayorEdad(a^.HD,edadMax,codigo);
      end;
  end;
procedure aumentarEdad(a: arbol); //Punto B - Inciso IV / Se puede hacer función perfectamente
    begin
        if (a <> nil) then begin //Si la rama no está vacio...
            aumentarEdad(a^.HI); //Invocar el módulo con el hijo izquierdo del nodo
            a^.dato.edad:= a^.dato.edad + 1; //Incrementar la edad en una unidad (ahre formal era Xd)
            aumentarEdad(a^.HD); //Invocar el módulo con el hijo derecho del nodo
        end;
    end;
function encontrarValor(a: arbol; valor: integer):boolean; //Punto B - Inciso V
    begin
        if (a = nil) then begin
            encontrarValor:= false;
        end else if (a^.dato.nro = valor) then begin
            encontrarValor:= true;
        end else begin
            if (valor < a^.dato.nro) then begin encontrarValor:= encontrarValor(a^.HI, valor); end //Si el número de socio es menor al valor, entonces buscar en el hijo izquierdo del nodo
            else if (valor > a^.dato.nro) then begin encontrarValor:= encontrarValor(a^.HD, valor); end; //Si el número de socio es mayor al valor, entonces buscar en el hijo derecho del nodo
        end;
    end;
function encontrarNombre(a: arbol; nombre: string):boolean; //Punto B - Inciso VI
    begin
        if (a = nil) then begin //Si la rama no está vacía...
            encontrarNombre:= false;
        end else if (a^.dato.nombre = nombre) then begin //Si el nodo actual tiene el nombre coincidente...
            encontrarNombre:= true;
        end else begin //Si no, a seguir buscando papi
            encontrarNombre:= encontrarNombre(a^.HI, nombre);
            encontrarNombre:= encontrarNombre(a^.HD, nombre);
        end;
    end;
function cantidadMiembros(a: arbol; cantidad: integer):integer; 
    begin
        if (a <> nil) then begin //Si la rama no está vacía...
            cantidad:= cantidad + 1; //Incrementar la cantidad en una unidad
            cantidad:= cantidadMiembros(a^.HI, cantidad); //Asignarle a la variable cantidad la función para que devuelva el número que haya obtenido
            cantidad:= cantidadMiembros(a^.HD, cantidad); //buscando por las otras ramas
        end;
        cantidadMiembros:= cantidad;
    end;
function sumarEdades(a: arbol; sumatoria: real):real; 
    begin
        if (a <> nil) then begin //Si la rama no está vacía...
            sumatoria:= sumatoria + a^.dato.edad;
            sumatoria:= sumarEdades(a^.HI, sumatoria);
            sumatoria:= sumarEdades(a^.HD, sumatoria);
        end;
        sumarEdades:= sumatoria;
    end;
function promedioEdades(a: arbol):real;
    begin
        promedioEdades:= (sumarEdades(a, 0) / cantidadMiembros(a, 0));
    end;
procedure imprimirOrdenAscendente(a: arbol); //Es el mismo código que el de un módulo pasado 
    begin
        if (a<>nil)then begin
            imprimirOrdenAscendente(a^.HI);
            writeln(a^.dato.nro, ' / nombre: ',a^.dato.nombre,' / edad: ',a^.dato.edad);
            imprimirOrdenAscendente(a^.HD);
        end;
    end;
var 
	a: arbol;
	socioMin: socio;
	edadm,codMax:integer;
begin
    a:=nil;edadm:=-1;codMax:=0;
    socioMin.nro:= 0;
    socioMin.nombre:= 'INICIALIZAR';
    socioMin.edad:=0;
	cargarArbol(a);
	imprimirOrden(a);
	writeln('El valor mas grande es: ', maximo(a));
	minimo(a, socioMin);
	writeln(socioMin.nombre,' ',socioMin.nro);
	mayorEdad(a,edadm,codMax);
	writeln('EL CODIGO DE LA PERSONA DE MAYOR EDAD ES: ',codMax,' y su edad es: ',edadm);
	aumentarEdad(a);
	imprimirOrden(a);
	writeln('¿Se encuenta el número de socio 3 en el arbol? ', encontrarValor(a, 3));
	writeln('¿Se encuenta manolo en el arbol? ', encontrarNombre(a, 'manolo'));
	writeln('En el arbol hay ', cantidadMiembros(a, 0), ' miembros');
	writeln('El promedio de la edad de los miembros es de ', promedioEdades(a):2:2);
	imprimirOrdenAscendente(a);
end.
