program Ejercicio11;
type
    //Limitar el rango de los valores a ingresar
    rangoTxt = string[40]
    rangoNum = -1..99999;
    vuelo = record //Crear registro para el vuelo
        codigo: rangoNum;
        pais_salida: rangoTxt;
        pais_llegada: rangoTxt;
        cantidad_km: rangoNum;
        porcentaje: real;
    end;
    codMaxMin = record //Crear registro para los máximos y mínimos
        cantMax1: rangoNum; codMax1: rangoNum;
        cantMax2: rangoNum; codMax2: rangoNum;
        cantMin1: rangoNum; codMin1: rangoNum;
        cantMin2: rangoNum; codMin2: rangoNum;
    end;
const //Constante para cortar la cadena de lectura de códigos
    cortar = 44;
procedure leerInfoVuelo(var v: vuelo); //Se omite la información de "pais_salida" y de "codigo" por motivos de optimización de código
    begin
        //write('Ingrese el país de salida >:'); readln(v.pais_salida);
        //write('Ingrese el código del avión >:'); readln(v.codigo);
        write('Ingrese la cantidad de kilómetros recorridos >:'); readln(v.cantidad_km);
        write('Ingrese el porcentaje de ocupación del avión >:'); readln(v.porcentaje);
        write('Ingrese el país de llegada >:'); readln(v.pais_llegada);
    end;
procedure actualizarMaxMin(v: vuelo; var c: codMaxMin); //Actualizar los valores de las cantidades máximas y mínimas, y los códigos correspondientes
    begin
        if (v.cantidad_km > c.cantMax1) then begin
            c.cantMax2:= c.cantMax1;
            c.codMax2:= c.codMax1;
            c.cantMax1:= v.cantidad_km;
            c.codMax1:= v.codigo;
        end else begin //Si no es mayor que cantMax1...
            c.cantMax2:= v.cantidad_km;
            c.codMax2:= v.codigo;
        end;
    end;
procedure actualizarAvPaises(var avPaisesViejo, codAvPaisesViejo, avPaisesNuevo, codAvPaisesNuevo: integer); //Actualizar al avión que salió a mas paises diferentes
    begin
        if (avPaisesViejo > avPaisesNuevo) then begin
            avPaisesNuevo:= avPaisesViejo;
            codAvPaisesNuevo:= codAvPaisesViejo;
        end;
    end;
procedure procesarVuelos(var maxmin: codMaxMin; var avPaisesDif, cantEsp1, cantEsp2: integer; var seguir: boolean);
    var
        v: vuelo;
        codigoActual, avPaisesNuevo, avPaisesViejo, codAvPaisesNuevo, codAvPaisesViejo: integer;
        paisActual: string;
    begin
        //Inicializar variables
        avPaisesNuevo:= 0; codAvPaisesNuevo:= 0;
        avPaisesViejo:= 0; codAvPaisesViejo:= 0;
        //Ingresar los dos datos que deciden si se cortan las cadenas o no
        write('Ingrese el país de salida >:'); readln(v.pais_salida);
        write('Ingrese el código del avión >:'); readln(v.codigo);
        codigoActual:= v.codigo;
        paisActual:= v.pais_salida;
        //Comenzar la cadena
        while (v.codigo <> cortar) do begin //Romper la cadena cuando el código ingresado sea igual a 44
            //--
            while (v.pais_salida = paisActual) do begin //Romper la cadena si el pais ingresado es diferente al paisActual
                //--
                while (v.codigo = codigoActual) do begin //Romper la cadena si el codigo ingresado es diferente al codigoActual
                    //--
                end;
            end;
        end;
    end;
var
    seguir: boolean;
    maxmin: codMaxMin;
    avPaisesDif, cantEsp1, cantEsp2: integer;
begin
    //Inicializar variables
    maxmin.codMax1:= 0; maxmin.cantMax1:= -1;
    maxmin.codMax2:= 0; maxmin.cantMax2:= -1;
    maxmin.codMin1:= 0; maxmin.cantMin1:= 99999;
    maxmin.codMin2:= 0; maxmin.cantMin2:= 99999;
    avPaisesDif:= 0;
    cantEsp1:= 0; cantEsp2:= 0;
    seguir:= true;
    //Comenzar el proceso
    while (seguir) do begin
        procesarVuelos(maxmin, avPaisesDif, cantEsp1, cantEsp2, seguir);
        writeln(' ----- ');
    end;
    //Informar
    writeln('Los dos aviones que mas kilometros recorrieron son los ',maxmin.codMax1,' y ',maxmin.codMax2);
    writeln('Los dos aviones que menos kilometros recorrieron son los ',maxmin.codMin1,' y ',maxmin.codMin2);
    writeln('La cantidad de vuelos de más de 5.000 km que no alcanzaron el 60% de ocupación del avión: ',cantEsp1);
    write('La cantidad de vuelos de menos de 10.000 km que llegaron a Australia o a Nueva Zelanda: ',cantEsp2);
end.
