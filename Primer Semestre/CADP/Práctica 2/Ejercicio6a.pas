{Realice un módulo que lea del teclado números enteros hasta que llegue un valor negativo. 
Al finalizar la lectura, el módulo debe imprimir en pantalla cuál fue el número par más alto.}
function lecturaNumeros: integer;
    var
        numIngresado, numPar: integer;
    begin
        {Inicializar}
        numPar:= 0;
        repeat
            write('Ingrese un número: ');
            read(numIngresado);
            if (numIngresado mod 2) = 0 then {Si el número ingresado, si es divido 2, da resto 0...}
                begin
                if (numIngresado > numPar) then {Si el número ingresado es mayor al numPar actual...}
                    begin
                        numPar:= numIngresado; {Actualizar la variable numPar}
                    end;
                end;
        until (numIngresado < 0); {Repetir por última vez cuando el número ingresado sea negativo}
        write('El número par mas alto fue: ',numPar);
        lecturaNumeros:= numPar; {Se obtiene el mayor número par al llamar la función}
    end;
