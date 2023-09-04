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
        writeln(a^.dato.nro);
        imprimirOrden(a^.HD);
      end;
  end;
function maximo(a:arbol):integer;
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
procedure minimo(a: arbol; var socioMin: socio);
	begin
		if (a <> nil) then begin
			if (a^.HI <> nil) then begin
				minimo(a^.HI, socioMin);
			end else begin
				socioMin:= a^.dato;
			end;
		end;
	end;
procedure mayorEdad(a:arbol;edadMax:integer;var codigo:integer);//puede ser funcion ????
  begin
    if(a<>nil)then
      begin
        mayorEdad(a^.HI,edadMax,codigo);
        if(a^.dato.edad>edadMax)then begin
          codigo:=a^.dato.nro;
          edadmax:=a^.dato.edad;
          end;
        mayorEdad(a^.HD,edadMax,codigo);
      end;
  end;
var 
	a: arbol;
	socioMin: socio;
	edadm,codMax:integer;
BEGIN
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
END.
