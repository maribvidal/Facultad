program Ej1P2;
const
  DIMF=10;
  FIN='.';
type
	vector=array[1..DIMF]of char;
	lista = ^nodo;
	nodo = record
		letra: char;
		sig: lista;
	end;
procedure moduloA(var v: vector; var dimL: integer);
	var
		c: char;
	begin
		if(dimL<DIMF)then 
		  begin
		    write('ingrese caracter: '); 
		    readln(c);
		  end;
		if (c<>FIN)and(dimL < dimF)then
			begin
			  dimL:= dimL + 1;
		      v[dimL]:= c;
		      moduloA(v, dimL);
			end;
		{else begin NO HACE FALTA CORTA CON PUNTO
			dimL:= dimL + 1;
			v[dimL]:= '.';
		end;}
	end;
procedure moduloB(v: vector; dimL: integer);
	var
		i: integer;
	begin
		for i:= 1 to dimL do begin
			writeln('Letra: ', v[i]);
		end;
	end;
procedure moduloC(v: vector; dimL: integer; var index: integer);
	begin
		if (index < dimL) then begin
			index:= index + 1;
			writeln('Letra: ', v[index]);
			moduloC(v, dimL, index);
		end;
	end;
procedure moduloD(var leidos:integer);
  var
    c:char;
  begin
    write('ingrese caracter: '); 
    readln(c);
    if(c<>FIN)then
      begin
        leidos:=leidos+1;
        moduloD(leidos);
      end;
  end;
function moduloD2(leidos: integer):integer;
	var
		c: char;
	begin
		write('ingrese caracter: '); 
		readln(c);
		if(c<>FIN)then
		begin
			leidos:=moduloD2(leidos)+1;
		end;
		moduloD2:=leidos;
	end;

procedure agregarElem(var l: lista; letra: char);
	var
		aux: lista;
	begin
		new(aux);
		aux^.letra:= letra;
		aux^.sig:= l;
		l:= aux;
	end;
procedure moduloE(var l: lista);
	var
		c: char;
	begin
		write('ingrese caracter: '); readln(c);
		if (c <> FIN) then begin
			agregarElem(l, c);
			moduloE(l);
		end;
	end;
procedure moduloG(l:lista);
  begin
    if(l<>nil)then begin
      writeln('caracter: ',l^.letra);
      l:=l^.sig;
      moduloG(l);
    end;    
  end;
procedure moduloF(l:lista);
  begin
    if(l<>nil)then begin
      //l:=l^.sig;
      moduloF(l^.sig);
      writeln('caracter: ',l^.letra);
    end;    
  end;
var
	v: vector;
	dimL, indice,cantl: integer;
	l: lista;
begin
	l:= nil;
	dimL:= 0;
	indice:= 0;
	cantl:=0;
	moduloA(v, dimL);
	writeln;
	//moduloB(v, dimL);
	moduloC(v, dimL, indice);
	writeln('cant de caracteres leidos: ', moduloD2(cantl));
	moduloE(l);
	moduloF(l);
	moduloG(l);
end.
