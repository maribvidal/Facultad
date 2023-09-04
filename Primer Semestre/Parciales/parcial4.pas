program Final_practica;
const
    dimF = 5000;
type
    t_categoria = 1..5;
    inscripto = record
        DNI: longint;
        nombre_completo: string[40];
        categoria: t_categoria;
        fecha_inscr: string[20]; //El enunciado no especifica como hacerla
    end;
    participantes = array [1..dimF] of inscripto; //A lo sumo 5000
    categorias = array [1..5] of integer; //Vector para sacar el número de inscriptos por categoría
    lista = ^nodo;
    nodo = record
        data: inscripto;
        sig: lista;
    end;
procedure leerInscripto(var ins: inscripto);
    begin
        write('DNI: '); readln(ins.DNI);
        write('Nombre y apellido: '); readln(ins.nombre_completo);
        write('Categoría: '); readln(ins.categoria);
        write('Fecha de inscripción: '); readln(ins.fecha_inscr);
    end;
procedure cargarVector(var v1: participantes; var dimL: integer);
    var
        i: integer;
        seguir: string;
    begin
        i:= 0;
        dimL:= 0;
        seguir:= '';
        while (i <= dimF) and (seguir <> 'no') do begin
            leerInscripto(v1[i]);
            writeln;
            write('¿Seguir?: (si/no) '); readln(seguir);
            i:= i + 1;
            dimL:= dimL + 1;
        end;
    end;
procedure inicializarVector2(var v2: categorias);
    var
        i: integer;
    begin
        for i:= 1 to 5 do begin
            v2[i]:= 0;
        end;
    end;
procedure calcularGentePorCategoria(v1: participantes; dimL: integer; var v2: categorias);
    var
        i: integer;
    begin
        for i:= 1 to dimL do begin
            v2[v1[i].categoria]:= v2[v1[i].categoria] + 1;
        end;
    end;
procedure agregarNodo(var l: lista; contenido: inscripto);
    var
        aux: lista;
    begin
        new(aux);
        aux^.data:= contenido;
        aux^.sig:= nil;
        if (l <> nil) then
            aux^.sig:= l;
        l:= aux;
    end;
procedure procesarLista(var l: lista; dimL: integer; v1: participantes; v2: categorias);
    var
        i: integer;
    begin
        for i:= 1 to dimL do begin //Leer vector1
            if (v2[v1[i].categoria] > 500) then begin //Si la categoría del inscripto posee, a lo sumo, 500 inscriptos mas, entonces...
                agregarNodo(l, v1[i]);
            end;
        end;
    end;
var
    vector: participantes;
    vector2: categorias;
    l: lista;
    dimL: integer;
begin
    l:= nil;
    cargarVector(vector, dimL); //Esta información ya se dispone
    inicializarVector2(vector2);
    calcularGentePorCategoria(vector, dimL, vector2);
    procesarLista(l, dimL, vector, vector2);
    
    //Leer lista
    while (l <> nil) do begin
        writeln(l^.data.DNI);
        l:= l^.sig;
    end;
end.
