program Ejercicio11;
type
    //Limitar el rango de los valores a ingresar
    rangoTxt = string[40];
    rangoNum = -1..99999;
    vuelo = record //Crear registro para el vuelo
        codigo: rangoNum;
        pais_salida: rangoTxt;
        pais_llegada: rangoTxt;
        cantidad_km: rangoNum;
        porcentaje: real;
    end;
    cantCod = record //Crear registro para dos cantidades y sus códigos respectivos
        cant1: rangoNum; cod1: rangoNum;
        cant2: rangoNum; cod2: rangoNum;
    end;
const //Constante para cortar la cadena de lectura de códigos
    cortar = 44;
procedure leerCodPais(var v: vuelo); //Leer solo el código del avión y el país de salida
    begin
        write('Ingrese el código del avión >'); readln(v.codigo);
        write('Ingrese el país de salida >'); readln(v.pais_salida);
    end;
procedure leerInfoVuelo(var v: vuelo); //Se omite la información de "pais_salida" y de "codigo" por motivos de optimización de código
    begin
        write('Ingrese la cantidad de kilómetros recorridos >'); readln(v.cantidad_km);
        write('Ingrese el porcentaje de ocupación del avión >'); readln(v.porcentaje);
        write('Ingrese el país de llegada >'); readln(v.pais_llegada);
    end;
procedure actualizarMaxMin(v: vuelo; var max, min: cantCod); //Actualizar los valores de las cantidades máximas y mínimas, y los códigos correspondientes
    begin
        if (v.cantidad_km > max.cant1) then begin
            max.cant2:= max.cant1;
            max.cod2:= max.cod1;
            max.cant1:= v.cantidad_km;
            max.cod1:= v.codigo;
        end else begin //Si no es mayor que cantMax1...
            max.cant2:= v.cantidad_km;
            max.cod2:= v.codigo;
        end;
        if (v.cantidad_km < min.cant1) then begin
            min.cant2:= min.cant1;
            min.cod2:= min.cod1;
            min.cant1:= v.cantidad_km;
            min.cod1:= v.codigo;
        end else begin //Si no es mayor que cantMax1...
            min.cant2:= v.cantidad_km;
            min.cod2:= v.codigo;
        end;
    end;
procedure actualizarAvPaises(var avp: cantCod); //Actualizar al avión que salió a mas paises diferentes
    begin
        if (avp.cant2 > avp.cant1) then begin 
            avp.cant1:= avp.cant2;
            avp.cod1:= avp.cod2;
        end;
    end;
procedure procesarVuelos(var max, min: cantCod; var avPaisesDif, cantEsp1, cantEsp2: integer);
    var
        v: vuelo;
        avPaises: cantCod;
        codigoActual: integer;
        paisActual: string;
    begin
        //Inicializar variables
        avPaises.cod1:= 0; avPaises.cant1:= 0;
        avPaises.cod2:= 0; avPaises.cant2:= 0;
        //Ingresar los dos datos que deciden si se cortan las cadenas o no
        leerCodPais(v);
        codigoActual:= v.codigo;
        paisActual:= v.pais_salida;
        //Comenzar la cadena
        while (v.codigo <> cortar) do begin //Romper la cadena cuando el código ingresado sea igual a 44
            //--
            while ((v.codigo = codigoActual) and (v.codigo <> cortar)) do begin //Romper la cadena si el codigo ingresado es diferente al codigoActual
                //--
                while ((v.pais_salida = paisActual) and (v.codigo <> cortar)) do begin //Romper la cadena si el pais ingresado es diferente al paisActual
                    leerInfoVuelo(v);
                    if (v.cantidad_km > 5000) and (v.porcentaje < 60) then begin cantEsp1:= cantEsp1 + 1; end;
                    if (v.cantidad_km < 10000) and ((v.pais_llegada = 'Australia') or (v.pais_llegada = 'Nueva Zelanda')) then begin cantEsp2:= cantEsp2 + 1; end;
                    actualizarMaxMin(v, max, min);
                    writeln;
                    leerCodPais(v);
                end;
                if (v.codigo <> cortar) then begin
                    avPaises.cant2:= avPaises.cant2 + 1;
                    writeln;
                    writeln('-- CAMBIANDO DE PAÍS --');
                    leerCodPais(v);
                    paisActual:= v.pais_salida;
                end;
            end;
            if (v.codigo <> cortar) then begin
                avPaises.cod2:= codigoActual;
                actualizarAvPaises(avPaises); //Actualizar el vuelo con la mayor cantidad de paises diferentes recorridos
                writeln;
                writeln('-- CAMBIANDO DE CÓDIGO Y PAÍS --');
                leerCodPais(v);
                codigoActual:= v.codigo;
                paisActual:= vpais_salida;
            end;
        end;
        avPaisesDif:= avPaises.cod1;
    end;
var
    max: cantCod;
    min: cantCod;
    avPaisesDif, cantEsp1, cantEsp2: integer;
begin
    //Inicializar variables
    max.cod1:= 0; max.cant1:= -1;
    max.cod2:= 0; max.cant2:= -1;
    min.cod1:= 0; min.cant1:= 99999;
    min.cod2:= 0; min.cant2:= 99999;
    avPaisesDif:= 0;
    cantEsp1:= 0; cantEsp2:= 0;
    //Comenzar el proceso
    procesarVuelos(max, min, avPaisesDif, cantEsp1, cantEsp2);
    writeln;
    //Informar
    writeln('Los dos aviones que mas kilometros recorrieron son los ',max.cod1,' y ',max.cod2);
    writeln('Los dos aviones que menos kilometros recorrieron son los ',min.cod1,' y ',min.cod2);
    writeln('El vuelo que recorrió la mayor cantidad de paises diferentes fue: ',avPaisesDif);
    writeln('La cantidad de vuelos de más de 5.000 km que no alcanzaron el 60% de ocupación del avión: ',cantEsp1);
    write('La cantidad de vuelos de menos de 10.000 km que llegaron a Australia o a Nueva Zelanda: ',cantEsp2);
end.
