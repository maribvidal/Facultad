program ej2;
const
    dimF = 500; //"Vector de a lo sumo 500 elementos"
type
    vector = array [1..dimF] of string;
procedure cargarVector(var v: vector; var dimL: integer);
    var
        i: integer;
        n: string;
    begin
        i:= 0;
        write('Nombre del alumno: >'); readln(n);
        while (n <> 'ZZZ') do begin
            i:= i + 1;
            v[i]:= n; //Asignarle al espacio i del vector el nombre del alumno
            dimL:= dimL + 1; //Aumentar el tamaño de la dimensión lógica
            write('Nombre del alumno: >'); readln(n); //Leer otro alumno
        end;
    end;
procedure eliminarElemento(var v: vector; n: string; dimL: integer);
    var
        i: integer;
        aux: boolean;
    begin
        aux:= true;
        for i:= 1 to dimL do begin
            if (v[i] = n) and (aux) then begin
                v[i]:= '';
                aux:= false;
            end;
        end;
    end;
procedure insertarNombrePos4(var v: vector; n: string; var dimL: integer);
    var
        i: integer;
    begin
        i:= 0;
        dimL:= dimL + 1;
        for i:= dimL downto 5 do begin
            v[i]:= v[i-1];
        end;
        v[4]:= n;
    end;
procedure agregarNombre(var v: vector; n: string; var dimL: integer);
    begin
        v[dimL+1]:= n; //Asignarle el espacio dimL+1 al nombre
        dimL:= dimL + 1; //Aumentar el tamaño de la dimensión lógica, se asume que en el ejercicio nunca se va a llegar hasta el final
    end;
procedure leerVector(v: vector); //Para verificar
    var
        i: integer;
    begin
        for i:= 1 to dimF do begin
            writeln('En la posición ',i,' se lee: "',v[i],'"');
        end;
    end;
var
    v: vector;
    dimL: integer;
    n: string;
begin //Probar código
    cargarVector(v, dimL);
    eliminarElemento(v, 'Ariel', dimL);
    agregarNombre(v, 'Ricardo', dimL);
    write('Insertar nombre: >'); readln(n);
    insertarNombrePos4(v, n, dimL);
    leerVector(v);
end.
