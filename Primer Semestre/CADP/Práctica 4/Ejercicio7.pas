program Ejercicio7;
const
    sizeLimit = 9; //El 9 es el dígito máximo
type
    vector = array[0..sizeLimit] of integer;
procedure procesarNumero(var v: vector; n: integer);
    begin
        repeat
            v[n mod 10]:= v[n mod 10] + 1; //Buscar el elemento en el vector que sea igual al dígito (resultante del resto del número divido por 10) y sumarle 1
            n:= n div 10;
        until (n = 0); //Repetir hasta que el número sea igual a 0
    end;
procedure buscarDigitoMaximo(v: vector; var digitoMax: integer);
    var
        i, aux: integer;
    begin
        aux:= -1;
        for i:= 0 to sizeLimit do begin
            if (v[i] > aux) then begin
                digitoMax:= i; //Guardar dígito
                aux:= v[i]; //Guardar cantidad
            end;
        end;
    end;
procedure leerDigitosSinOcurrencias(v: vector);
    var
        i: integer;
    begin
        for i:= 0 to sizeLimit do begin
            if (v[i] < 1) then begin
                write(i,', '); //Escribir los dígitos que no tuvieron ocurrencias
            end;
        end;
    end;
var
    v: vector;
    numIngresado, digitoMax: integer;
begin
    //Escribir numeros y usar los procesos
    digitoMax:= -1;
    write('Ingrese un número: >'); readln(numIngresado);
    while (numIngresado <> -1) do begin
        procesarNumero(v, numIngresado);
        write('Ingrese un número: >'); readln(numIngresado);
    end;
    if (digitoMax <> -1) then begin //Si hubo un digitoMax...
        buscarDigitoMaximo(v, digitoMax);
        writeln('El dígito mas leído fue el ',digitoMax); 
    end;
    write('Los dígitos que no tuvieron ocurrencias son: ');
    leerDigitosSinOcurrencias(v);
end.
