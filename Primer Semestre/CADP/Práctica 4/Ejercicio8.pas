program Ejercicio8;
const
    sizeLimit = 400; //Límite físico del vector
    ano_actual = 2023; //Porque puede cambiar XD
type
    rangoTxt = string[20]; //Limitar rangos
    rangoNum = 0..9999;
    alumno = record //Crear registro para los alumnos
        nroInscr: rangoNum;
        DNI: integer;
        apellido: rangoTxt;
        nombre: rangoTxt;
        ano: rangoNum;
    end;
    vector = array [1..sizeLimit] of alumno; //Crear vector para los alumnos
procedure leerAlumno(var a: alumno); //Leer el registro de alumnos
    begin
        write('Número de inscripción: '); readln(a.nroInscr);
        write('DNI: '); readln(a.DNI);
        write('Apellido: '); readln(a.apellido);
        write('Nombre: '); readln(a.nombre);
        write('Año: '); readln(a.ano);
    end;
function esDNIPar(d: integer):boolean;
    var
        aux, pares, impares: integer;
    begin
        pares:= 0;
        impares:= 0;
        repeat
            aux:= d mod 10; //Obtener el resto del MOD por 10 de DNI para obtener el dígito
            if (aux mod 2) = 0 then begin
                pares:= pares + 1;
            end else begin
                impares:= impares + 1;
            end;
            d:= d div 10; //Dividir DNI por 10 para seguir con el próximo dígito
        until (d = 0); //Repetir hasta que el número se haya dividido hasta 0
        esDNIPar:= (impares = 0); //La función retornará verdadera solo en el caso de que el DNI solo tenga números pares
    end;
procedure actualizarMaximos(a: alumno; var edad1, edad2: integer; var nombre1, nombre2, apellido1, apellido2: string);
    begin
        if ((ano_actual - (a.ano)) > (edad1)) then begin //2023 - año_de_nacimiento = edad
            edad2:= edad1;
            nombre2:= nombre1;
            apellido2:= apellido1;
            edad1:= ano_actual - (a.ano);
            nombre1:= a.nombre;
            apellido1:= a.apellido;
        end
        else if ((ano_actual - (a.ano)) > (edad2)) then begin //Si no es mayor que la primera edad, si no la segunda...
            edad2:= ano_actual - (a.ano);
            nombre2:= a.nombre;
            apellido2:= a.apellido;
        end;
    end;
procedure cargarVector(var v: vector; var c, e1, e2: integer; var n1, n2, a1, a2: string); //Cargar el vector de alumnos
    var
        i: integer;
    begin
        for i:= 1 to sizeLimit do begin
            leerAlumno(v[i]);
            if (esDNIPar(v[i].DNI)) then begin c:= c + 1; end;
            actualizarMaximos(v[i], e1, e2, n1, n2, a1, a2);
            writeln;
            writeln('SIGUIENTE ALUMNO');
        end;
    end;
var
    v: vector;
    cantDNIPares, edadMax, edadMax2: integer;
    porcentajeDNIPares: real;
    nombreMax, apellidoMax, nombre2Max, apellido2Max: string;
begin 
    //Inicializar variables
    cantDNIPares:= 0; porcentajeDNIPares:= 0;
    edadMax:= -1; edadMax2:= -1;
    nombreMax:= ''; apellidoMax:= '';
    nombre2Max:= ''; apellido2Max:= '';
    //Programa principal
    cargarVector(v, cantDNIPares, edadMax, edadMax2, nombreMax, nombre2Max, apellidoMax, apellido2Max);
    porcentajeDNIPares:= (cantDNIPares / sizeLimit)*100;
    writeln('El porcentaje de alumnos con DNI compuesto sólo por dígitos pares: ',porcentajeDNIPares:2:2,'%');
    writeln('Nombre y apellido del alumno de mayor edad: ',nombreMax,' ',apellidoMax);
    write('Nombre y apellido del segundo alumno de mayor edad: ',nombre2Max,' ',apellido2Max);
end.
