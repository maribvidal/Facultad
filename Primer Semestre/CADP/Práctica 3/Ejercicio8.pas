program Ejercicio8;
type
    doc = record
        dni: integer;
        nombreCompleto, email: string;
    end;
    proyecto = record
        titulo, escuela, localidad: string; 
        docente: doc; 
        codigo, alumnos: integer;
    end;
function esPar(numero: integer):boolean; {Retornar TRUE si el número es par}
    begin
        esPar:= (numero mod 2) = 0;
    end;
function condicionEspecial(codigo: integer):boolean; {Retornar TRUE si el código posee igual cantidad de dígitos pares e impares}
    var
        aux, pares, impares: integer;
    begin
        aux:= 0;
        pares:= 0;
        impares:= 0;
        while (codigo <> 0) do
        begin
            aux:= codigo mod 10;
            if (esPar(aux)) then begin pares:= pares + 1; end
            else begin impares:= impares + 1; end;
            codigo:= codigo div 10;
        end;
        condicionEspecial:= (pares = impares);
    end;
procedure leerProyectoLocalidad(var p: proyecto);
    begin
        write('Localidad: >'); readln(p.localidad);
    end;
procedure leerProyectoEscuela(var p: proyecto);
    begin
        write('Escuela: >'); readln(p.escuela);
    end;
procedure leerProyecto(var p: proyecto);
    begin
        write('Código del proyecto: >'); readln(p.codigo);
        write('Titulo del proyecto: >'); readln(p.titulo);
        write('Cantidad de alumnos que participan: >'); readln(p.alumnos);
        //write('Nombre del coordinador: >'); readln(p.docente.nombreCompleto);
        //write('E-mail del coordinador: >'); readln(p.docente.email);
        //write('DNI del coordinador: >'); readln(p.docente.dni);
    end;
procedure actualizarMaximos(p: proyecto; var cantMax1, cantMax2: integer; var nombreMax1, nombreMax2: string);
    begin
        if (p.alumnos > cantMax1) then begin
            cantMax2:= cantMax1;
            nombreMax2:= nombreMax1;
            cantMax1:= p.alumnos;
            nombreMax1:= p.escuela;
        end
        else if (p.alumnos > cantMax2) then begin
            cantMax2:= p.alumnos;
            nombreMax2:= p.escuela;
        end;
    end;
procedure procesarLocalidad(var cantMax1, cantMax2, totalEscuelas: integer; var nombreMax1, nombreMax2: string; var terminar: boolean);
    var
        p: proyecto;
        localidadActual, escuelaActual: string;
        localidadEscuelas: integer;
    begin
        localidadEscuelas:= 0;
        leerProyectoLocalidad(p);
        leerProyectoEscuela(p);
        localidadActual:= p.localidad;
        escuelaActual:= p.escuela;
        p.codigo:= 0; {Medida provisoria para comenzar el WHILE}
        while (p.localidad = localidadActual) and (p.codigo <> -1) do {Mientras la localidad siga siendo la misma Y EL CODIGO SEA DIFERENTE A -1...}
        begin
            while (p.escuela = escuelaActual) and (p.codigo <> -1) do {Mientras la escuela siga siendo la misma Y EL CODIGO SEA DIFERENTE A -1...}
            begin
                leerProyecto(p);
                if (p.codigo <> -1) then begin
                    totalEscuelas:= totalEscuelas + 1;
                    localidadEscuelas:= localidadEscuelas + 1;
                    actualizarMaximos(p, cantMax1, cantMax2, nombreMax1, nombreMax2);
                    if (p.localidad = 'Daireaux') and (condicionEspecial(p.codigo)) then
                    begin
                        writeln('¡El código del proyecto ',p.titulo,' posee igual cantidad de digitos pares que impares!');
                    end;
                    {Una vez terminado de hacer y chequear todo lo demás, verificar si la localidad y la escuela siguen siendo las mismas}
                    leerProyectoLocalidad(p);
                    leerProyectoEscuela(p);
                end;
            end;
            writeln('Cambiando de escuela...');
            escuelaActual:= p.escuela;
        end;
        writeln('En la localidad de ',localidadActual,', se registraron un total de ',localidadEscuelas,' escuelas');
        if (p.codigo = -1) then begin terminar:= false; end;
    end;
var
    terminar: boolean;
    cantMax1, cantMax2, totalEscuelas: integer;
    nombreMax1, nombreMax2: string;
begin
    cantMax1:= 0;
    cantMax2:= 0;
    totalEscuelas:= 0;
    nombreMax1:= '';
    nombreMax2:= '';
    terminar:= true;
    while (terminar) do
    begin
        procesarLocalidad(cantMax1, cantMax2, totalEscuelas, nombreMax1, nombreMax2, terminar);
        writeln(' --- ');
    end;
    writeln('En la convocatoria del 2020, participaron un total de ',totalEscuelas,' escuelas');
    write('Las dos escuelas con mayor cantidad de alumnos participantes fueron ',nombreMax1,' y ',nombreMax2);
end.
