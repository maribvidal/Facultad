program parcialNoa;

const 
	CORTE = -1;
	N = 5;

type
	t_pais = 1..N;
	v_pais = array [t_pais] of string[20];
	v_cont = array [t_pais] of integer;
	
	repuesto = record
		codigo_rep: integer;
		precio: real;
		codigo_pais: t_pais;
	end;
	
	v_max = array [t_pais] of repuesto;
	
	lis_repuesto = ^lis_nodo;
	lis_nodo = record
		dato: repuesto;
		sig: lis_repuesto;
	end;

//	FUNCIONES
function poseeTresCeros(codigo: integer):boolean;
    var
        ceros: integer;
    begin
        ceros:= 0;
        while (codigo <> 0) do begin
            if ((codigo mod 10) = 0) then
                ceros:= ceros + 1;
            codigo:= codigo div 10;
        end;
        poseeTresCeros:= (ceros = 3);
    end;

//	PROCEDIMIENTOS
procedure AgregarAdelante(var lis: lis_repuesto; nodo: repuesto);
	var
		nue: lis_repuesto;
	begin
		new(nue);
		nue^.dato:= nodo;
		nue^.sig:= lis;
		lis:= nue;
	end;

procedure CargarRepuesto(var rep: repuesto);
	begin
		write(' - Codigo del repuesto: '); readln(rep.codigo_rep);
		if (rep.codigo_rep <> -1) then begin
			write(' - Precio: '); readln(rep.precio);
			write(' - Codigo del pais: '); readln(rep.codigo_pais);
		end;
		writeln;
	end;
	
procedure CargarVectorNombres(var vec: v_pais);
	var
		i: integer;
	begin
		for i:= 1 to N do begin
			write(' - Nombre[', i, '] = '); readln(vec[i]);
		end;
	end;
	
procedure InicializarVector(var vec: v_cont);
	var
		i: integer;
	begin
		for i:= 1 to N do
			vec[i]:= 0;
	end;
	
procedure InicializarVectorMax(var vec: v_max);
	var
		rep: repuesto;
		i: integer;
	begin
		rep.codigo_rep:= 0;
		rep.precio:= 0;
		rep.codigo_pais:= 0;
		
		for i:= 1 to N do begin
			vec[i]:= rep;
		end;
	end;

procedure IncisoA(var lis: lis_repuesto);
	var
		rep: repuesto;
	begin
		writeln(' -- INCISO A: Cargar los datos -- ');
		CargarRepuesto(rep);
		while (rep.codigo_rep <> -1) do begin
			AgregarAdelante(lis, rep);
			CargarRepuesto(rep);
		end;
		writeln;
	end;
	
procedure ActualizarMaximo(repActual: repuesto; var repMax: repuesto);
	begin
		if (repActual.precio > repMax.precio) then
			repMax:= repActual;
	end;	
	
//1. Cantidad de países para los que la cantidad de repuestos comprados es menor que el promedio de repuestos comprados a todos los paises 
//2. Para cada país, el nombre del país y el precio del repuesto más caro 
//3. COMPLETO: La cantidad de repuestos que poseen al menos 3 ceros en su código
procedure IncisoB(lis: lis_repuesto; vec_nom: v_pais; var cant_esp: integer);
	var
		cont_aux: integer;
		prom_paises: real;
		vector: v_cont;
		vector_max: v_max;
		i: integer;
	begin
		cont_aux:= 0;
		prom_paises:= 0;
		
		InicializarVector(vector);
		InicializarVectorMax(vector_max);
	
		while (lis <> nil) do begin
			//APARTADO 1
			vector[lis^.dato.codigo_pais]:= vector[lis^.dato.codigo_pais] + 1;
			prom_paises:= prom_paises + 1;
			
			//APARTADO 2
			ActualizarMaximo(lis^.dato, vector_max[lis^.dato.codigo_pais]);
			
			//APARTADO 3
			if (poseeTresCeros(lis^.dato.codigo_rep)) then
				cant_esp:= cant_esp + 1;
		
			//Avanzar
			lis:= lis^.sig;
		end;
		
		//APARTADO 1
		prom_paises:= prom_paises / N;
		
		for i:= 1 to N do begin
			if (vector[i] < prom_paises) then
				cont_aux:= cont_aux + 1;
		end;
		
		writeln(' -- Cantidad de países para los que la cantidad de repuestos comprados es menor que el promedio de repuestos comprados a todos los paises: ', cont_aux);
		writeln;
		
		//APARTADO 2
		for i:= 1 to N do begin
			writeln(' -- REPUESTO MAXIMO PAIS ', vec_nom[i]);
			writeln(' -- Precio: ', vector_max[i].precio);
		end;
	end;

var
	cantidad_esp: integer;
	lista: lis_repuesto;
	vector_nombres: v_pais;
begin
	//Inicializar variables
	cantidad_esp:= 0;
	CargarVectorNombres(vector_nombres); //Se dispone

	//Inciso A
	lista:= nil;
	IncisoA(lista);
	
	//Inciso B
	IncisoB(lista, vector_nombres, cantidad_esp);
	writeln('Inciso B punto 3: ', cantidad_esp);
end.
