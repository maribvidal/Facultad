program Ejercicio4;
const
    dimF = 10; //Tamaño total del vector
type
    vector = array [1..dimF] of integer; //Declarar vector de 100 enteros
procedure leerVector(var v: vector); //Leer vector
    var
        i: integer;
    begin
        for i:= 1 to dimF do begin
            write('Ingresa el valor de la posición [',i,']: >'); read(v[i]);
        end;
    end;
procedure posicion(x: integer; v: vector; var pos: integer); //Retornar la posición del número x, si se encuentra
    var
        i: integer;
    begin
        pos:= -1; //Dejarla en -1 por defecto
        for i:= 1 to dimF do begin
            if (v[i] = x) then begin pos:= i; end;
        end;
    end;
procedure intercambio(x, y: integer; var v: vector); //Intercambiar los valores de las posiciones ingresadas
    var
        i, pos1, pos2: integer;
    begin
        pos1:= 0; pos2:= 0;
        for i:= 1 to dimF do begin
            if (v[i] = x) then begin pos1:= i; end; //Guardar la posición de X
            if (v[i] = y) then begin pos2:= i; end; //Guardar la posición de Y
        end;
        v[pos1]:= y;
        v[pos2]:= x;
        writeln(v[pos1]);
        writeln(v[pos2]);
    end;
procedure sumaVector(var suma: integer; v: vector); //Sumar todos los elementos del vector
    var
        i: integer;
    begin
        suma:= 0; //Inicializar la suma en 0
        for i:= 1 to dimF do begin
            suma:= suma + v[i]; //Sumar valor de posición i
        end;
    end;
procedure promedio(var prom: integer; v: vector); //Promediar todos los elementos del vector
    var
        i: integer;
    begin
        prom:= 0; //Inicializar el promedio en 0
        for i:= 1 to dimF do begin
            prom:= prom + v[i]; //Sumar valor de posición i
        end;
        prom:= (prom div dimF);
    end;
procedure elementoMaximo(var max: integer; v: vector); //Retornar la posición del elemento máximo del vector
    var
        i, aux: integer;
    begin
        aux:= -1; //Inicializar la variable que va a tener el número máximo en -1
        for i:= 1 to dimF do begin
            if (v[i] > aux) then begin aux:= v[i]; max:= i; end; //Si el valor del elemento presente es mayor al máximo...
        end;
    end;
procedure elementoMinimo(var min: integer; v: vector); //Retornar la posición del elemento mínimo del vector
    var
        i, aux: integer;
    begin
        aux:= 9999; //Inicializar la variable que va a tener el número mínimo en 9999
        for i:= 1 to dimF do begin
            if (v[i] < aux) then begin aux:= v[i]; min:= i; end; //Si el valor del elemento presente es mayor al mínimo...
        end;
    end;
var
    v: vector;
    x, y, pos, suma, prom, max, min: integer;
begin //Probar si funciona
    pos:= 0;
    prom:= 0;
    max:= 0;
    min:= 0;
    leerVector(v);
    write('Ingrese un valor cual desée conocer su posición: '); readln(x);
    posicion(x, v, pos);
    writeln(pos);
    write('Ingrese X: '); readln(x);
    write('Ingrese Y: '); readln(y);
    intercambio(x, y, v);
    sumaVector(suma, v);
    writeln(suma);
    promedio(prom, v);
    writeln(prom);
    elementoMaximo(max, v);
    elementoMinimo(min, v);
    writeln(max);
    writeln(min);
end.
