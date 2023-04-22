program Ejercicio11;
type
    //Limitar el rango de los valores a ingresar
    rangoTxt = string[40]
    rangoNum = 0..99999;
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
const
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
    begin
        //Vacío
    end;
var
    seguir: boolean;
    maxmin: codMaxMin;
    avPaisesDif, cantEsp1, cantEsp2: integer;
begin
    //Vacío
end.
