program Ejercicio5;
const
    dimF = 4; //Se dispone de la información de 500 clientes.
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
    vContratosMes = array [1..12] of integer; //Para el punto A
    vContratosAno = array [2006..2023] of integer; //Para el punto A
    vCategorias = array ['A'..'F'] of integer; //Para el punto B
    vCodigos = array [1..2400] of integer; //Para el punto C
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
procedure procesarVector(var v: vector; var contratosMax, anoMax: integer; var cantEsp: integer);
    var
        i: integer;
        contratosMax, anoMax: integer; //Punto A
        promedio: real; //Punto D
    begin
        promedio:= 0;
        for i:= 1 to dimF do begin
            //Punto A
            vContratosMes[v[i].fecha.mes]:= vContratosMes[v[i].fecha.mes] + 1;
            vContratosAno[v[i].fecha.ano]:= vContratosAno[v[i].fecha.ano] + 1;
            actualizarMaximo(vContratosAno[v[i].fecha.ano], v[i].fecha.ano, contratosMax, anoMax); //Actualizar año en que se firmó la mayor cantidad de contratos
            //Punto B 
            vCategorias[v[i].categoria]:= vCategorias[v[i].categoria] + 1; //Aumentar la cantidad de dicha categoría
            //Punto C
            vCodigos[v[i].codigo]:= vCodigos[v[i].codigo] + 1; //Asignarle gente al código de la ciudad
            //Punto D
            promedio:= promedio + v[i].monto; //Sumarle a promedio el monto de cada cliente de AWS
        end;
        promedio:= (promedio / dimF); //Obtener el monto promedio entre todos los clientes
        cantEsp:= cuantosSuperanMonto(v, promedio); //Asignarle el número de personas que superan el monto
    end;
var
    v: vector;
    contratosMax, anoMax, cantEsp: integer;
begin
    contratosMax:= -1;
    anoMax:= 0;
    cantEsp:= 0;
    cargarVector(v);
    procesarVector(v, contratosMax, anoMax, cantEsp);
end.
