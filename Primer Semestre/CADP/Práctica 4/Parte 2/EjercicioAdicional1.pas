program EjercicioAdicional1;
const
    codigo_corte = -1;
    dimF = 5; //A lo sumo 10.000 datos
type
    computadora = record
        codigo_computadora: longint;
        version_ubuntu: string[5];
        cantidad_paquetes: 1..9999;
        cantidad_cuentas: 1..9999;
    end;
    vector = array [1..dimF] of computadora;
procedure leerRegistro(var c: computadora);
    begin
        write('Ingrese el código de la computadora: >'); readln(c.codigo_computadora);
        if (c.codigo_computadora <> codigo_corte) then begin //De todas maneras no se procesa ¯\_(ツ)_/¯
            write('Ingrese la versión de Ubuntu: >'); readln(c.version_ubuntu);
            write('Ingrese la cantidad de paquetes instalados: >'); readln(c.cantidad_paquetes);
            write('Ingrese la cantidad de cuentas del usuario: >'); readln(c.cantidad_cuentas);
        end else begin
            writeln('ERROR - CÓDIGO NO PERMITIDO');
        end;
    end;
procedure cargarVector(var v: vector; var dimL: integer);
    var
        i, aux: integer;
    begin
        i:= 0;
        aux:= 0;
        while (i < dimF) and (aux <> codigo_corte) do begin //Leer vector mientras i sea menor a la dimensión física y no se haya leído el código de corte
            i:= i + 1;
            dimL:= dimL + 1;
            leerRegistro(v[i]);
            aux:= v[i].codigo_computadora;
            writeln; //Dejar un espacio
        end;
        if (aux = codigo_corte) then begin dimL:= dimL - 1; end;
    end;
procedure actualizarMaximo(ubuntu1: string; paquetes1: integer; var ubuntu2: string; var paquetes2: integer);
    begin
        if (paquetes1 > paquetes2) then begin
            ubuntu2:= ubuntu1;
            paquetes2:= paquetes1;
        end;
    end;
procedure eliminarCodigos(var v: vector; var dimL: integer);
    var
        i, j, espacio, codigo: integer;
    begin
        i:= 1;
        espacio:= 0;
        codigo:= v[i].codigo_computadora;
        while (codigo < 500) do begin
            espacio:= espacio + 1;
            i:= i + 1;
            codigo:= v[i].codigo_computadora;
        end;
        for j:= 1 to (dimL-espacio) do begin //Desplazar todos los elementos que están luego del rango de códigos que van del 1 al 499
            v[j]:= v[j + espacio];
        end;
        dimL:= dimL - espacio; //Sustraerle a la dimensión lógica los espacios contados anteriormente para finalizar
    end;
procedure procesarVector(var v: vector; var dimL: integer);
    var
        i, cuentasUsuario, cuentasTotal, paquetesComputadora, paquetesMax, cod, cod2, cantEsp: integer;
        ubuntuViejo, ubuntuMax: string;
    begin
        i:= 1;
        cantEsp:= 0;
        cuentasUsuario:= 0;
        paquetesComputadora:= 0;
        paquetesMax:= -1;
        cuentasTotal:= 0;
        ubuntuMax:= '';
        cod:= v[i].codigo_computadora;
        ubuntuViejo:= v[i].version_ubuntu;
        cod2:= cod;
        while (i <= dimL) do begin //Romper el ciclo cuando seguir sea FALSO
            while (cod = cod2) do begin //Procesar información en orden de código de computadora
                //Punto A
                if (v[i].version_ubuntu = '18.04') or (v[i].version_ubuntu = '16.04') then begin
                    cantEsp:= cantEsp + 1;
                end;
                
                //Punto B
                cuentasUsuario:= cuentasUsuario + v[i].cantidad_cuentas; //Contar las cuentas por código
                
                //Punto C
                paquetesComputadora:= paquetesComputadora + v[i].cantidad_paquetes; //Contar los paquetes instalados por código
                ubuntuViejo:= v[i].version_ubuntu; //Actualizar la versión de Ubuntu
                
                i:= i + 1; //Leer el próximo elemento
                cod:= v[i].codigo_computadora; //Actualizar el código
            end;
            cuentasTotal:= cuentasTotal + cuentasUsuario;
            actualizarMaximo(ubuntuViejo, paquetesComputadora, ubuntuMax, paquetesMax);
            cod2:= v[i].codigo_computadora; //Actualizar el valor del segundo código
            //writeln('CAMBIANDO DE CÓDIGO ',cod2);
            cuentasUsuario:= 0; //Reiniciar variable
            paquetesComputadora:= 0; //Reiniciar variable
        end;
        writeln('Promedio de cuentas por computadora: ',(cuentasTotal/dimL):2:1);
        writeln('Cantidad de computadoras con la versión Ubuntu 18.04 o 16.04: ',cantEsp);
        writeln('La versión de Ubuntu de la computadora con mayor cantidad de paquetes instalados: ',ubuntuMax);
        eliminarCodigos(v, dimL);
    end;
var
    v: vector;
    i, dimL: integer;
begin
    cargarVector(v, dimL);
    for i:=1 to dimL do begin
        writeln('Espacio [',i,'] - ',v[i].codigo_computadora,' - ',v[i].version_ubuntu,' - ',v[i].cantidad_paquetes,' - ',v[i].cantidad_cuentas);
    end;
    procesarVector(v, dimL);
    for i:=1 to dimL do begin
        writeln('Espacio [',i,'] - ',v[i].codigo_computadora,' - ',v[i].version_ubuntu,' - ',v[i].cantidad_paquetes,' - ',v[i].cantidad_cuentas);
    end;
end.
