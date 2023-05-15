program Ejercicio5;
const
    dimF = 11; //Se dispone de la información de 500 clientes.
type
    date = record
        dia: 1..30;
        mes: 1..12;
        ano: 2006..2023;
    end;
    client = record
        fecha: date;
        categoria: 'A'..'F';
        codigo: 1..2400;
        monto: real;
    end;
    vector = array [1..dimF] of client;
    vContMes = array [1..12] of integer; //Para el punto A
    vContAno = array [2006..2023] of integer; //Para el punto A
    vCat = array ['A'..'F'] of integer; //Para el punto B
    vCod = array [1..2400] of real; //Para el punto C, guarda montos
function cuantosSuperanMonto(v: vector; monto: real):integer;
    var
        i, aux: integer;
    begin
        aux:= 0;
        for i:= 1 to dimF do begin //Revisar todos los elementos del vector para ver cuantos superan el monto
            if (v[i].monto > monto) then begin
                aux:= aux + 1;
            end;
        end;
        cuantosSuperanMonto:= aux;
    end;
procedure leerFecha(var f: date);
    begin
        write('Día: >'); readln(f.dia);
        write('Mes: >'); read(f.mes);
        write('Año: >'); read(f.ano);
    end;
procedure leerCliente(var c: client);
    begin
        leerFecha(c.fecha);
        write('Categoría: >'); readln(c.categoria);
        write('Código (1 al 2400): >'); readln(c.codigo);
        write('Monto: >'); readln(c.monto);
    end;
//"La información se ingresa ordenada por fecha de firma de contrato (los más antiguos primero, los más recientes últimos)."
//Entonces, eso significa que los espacios del vector están colocados de manera ascendente.
procedure cargarVector(var v: vector); 
    var
        i: integer;
    begin
        for i:= 1 to dimF do begin
            leerCliente(v[i]); //Asignarle al espacio del vector actual un registro
            writeln;
        end;
    end;
procedure actualizarMaximo(contratos1: integer; ano1: integer; var contratos2: integer; var ano2: integer);
    begin
        if (contratos1 > contratos2) then begin
            contratos2:= contratos1;
            ano2:= ano1;
        end;
    end;
procedure leerContratosMesAno(contMeses: vContMes; contAnos: vContAno); //Punto A
    var
        i: integer;
    begin
        for i:= 1 to 12 do begin //Meses
            writeln('En el mes ',i,' se firmaron un total de ',contMeses[i],' contratos.');
        end;
        for i:= 2006 to 2023 do begin //Años
            writeln('En el año ',i,' se firmaron un total de ',contAnos[i],' contratos.');
        end;
    end;
procedure leerCategorias(categorias: vCat); //Punto B
    var
        i: char;
    begin
        for i:='A' to 'F' do begin
            writeln('La categoría ',i,' tuvo un total de ',categorias[i],' clientes.');
        end;
    end;
procedure leerCiudades(ciudades: vCod); //Punto C
    var
        i, j, codMax: integer;
        montoMax: real;
    begin
        montoMax:= -1;
        codMax:= 0;
        for i:= 1 to 10 do begin //Ir sacando el monto mayor por la fuerza bruta XD
            for j:= 1 to 2400 do begin //Codigos de las ciudades
                if (ciudades[j] > montoMax) then begin
                    montoMax:= ciudades[j];
                    codMax:= j;
                end;
            end;
            writeln('El código de la ',i,'° ciudad con el mayor monto es ',codMax);
            ciudades[codMax]:= -1; //Asignarle un valor menor al mayor monto del vector así se encuentra otro monto máximo
            montoMax:= -1;
        end;
    end;
procedure procesarVector(var v: vector; var vContMes: vContMes; var vContAno: vContAno; var vCat: vCat; var vCod: vCod; var anoMax: integer; var cantEsp: integer);
    var
        i: integer;
        contratosMax: integer; //Punto A
        promedio: real; //Punto D
    begin
        contratosMax:= -1;
        promedio:= 0;
        for i:= 1 to dimF do begin
            //Punto A
            vContMes[v[i].fecha.mes]:= vContMes[v[i].fecha.mes] + 1;
            vContAno[v[i].fecha.ano]:= vContAno[v[i].fecha.ano] + 1;
            actualizarMaximo(vContAno[v[i].fecha.ano], v[i].fecha.ano, contratosMax, anoMax); //Actualizar año en que se firmó la mayor cantidad de contratos
            //Punto B 
            vCat[v[i].categoria]:= vCat[v[i].categoria] + 1; //Aumentar la cantidad de dicha categoría
            //Punto C
            vCod[v[i].codigo]:= vCod[v[i].codigo] + 1; //Asignarle gente al código de la ciudad
            //Punto D
            promedio:= promedio + v[i].monto; //Sumarle a promedio el monto de cada cliente de AWS
        end;
        promedio:= (promedio / dimF); //Obtener el monto promedio entre todos los clientes
        cantEsp:= cuantosSuperanMonto(v, promedio); //Asignarle el número de personas que superan el monto
    end;
var
    v: vector;
    anoMax, cantEsp: integer;
    v2: vContMes;
    v3: vContAno;
    v4: vCat;
    v5: vCod;
begin
    anoMax:= 0;
    cantEsp:= 0;
    cargarVector(v);
    procesarVector(v, v2, v3, v4, v5, anoMax, cantEsp);
    leerContratosMesAno(v2, v3);
    writeln('El año en que se firmó la mayor cantidad de contratos fue el ',anoMax,'.');
    leerCategorias(v4);
    writeln;
    leerCiudades(v5);
    writeln;
    writeln('La cantidad de clientes que superan mensualmente el monto promedio entre todos los clientes es de ',cantEsp);
end.
