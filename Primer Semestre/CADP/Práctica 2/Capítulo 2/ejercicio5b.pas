program ejercicio5b;
procedure verifSiNumDoble(numeroA, numeroB: integer; var verificacion: boolean);
    begin
        verificacion:= (numeroB = (numeroA * 2)); {La variable "verificación" es un booleano que comprueba si "numeroB" es igual al doble de "numeroA"}
    end;
var
    numA, numB, paresLeidos, paresEsp: integer;
    verif: boolean;
begin
    paresLeidos:= 0; {Inicializar variables}
    paresEsp:= 0;
    write('Ingrese un número: '); read(numA); {Leer variables}
    write('Ingrese otro número: '); read(numB);
    while (numA <> 0) and (numB <> 0) do begin {Si ambos números del par son diferentes a 0...}
        paresLeidos:= paresLeidos + 1;
        verifSiNumDoble(numA, numB, verif);
        if (verif) then {Si el número B es el doble del número A...}
            paresEsp:= paresEsp + 1;
        writeln(' ----------- ');
        write('Ingrese un número: '); read(numA);
        write('Ingrese otro número: '); read(numB);
    end;
    writeln(' ----------- ');
    writeln('Se han leido un total de ',paresLeidos,' pares de números.');
    write('De los cuales ',paresEsp,' han compartido la característica de que el segundo sea el doble del primero.');
end.
