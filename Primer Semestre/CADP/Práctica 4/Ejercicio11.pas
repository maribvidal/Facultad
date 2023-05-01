program Ejercicio11;
const
    dimF = 200; //Hay 200 fotos publicadas
type
    rangoTxt = string[20]; //Limitar rangos
    rangoNum = 0..9999;
    foto = record
        titulo: rangoTxt;
        autor: rangoTxt;
        likes: rangoNum; 
        clicks: rangoNum;
        comentarios: rangoNum;
    end;
    vector = array [1..dimF] of foto;
procedure cargarVector(var v: vector);
    var
        i: integer;
    begin
        for i:= 1 to dimF do begin
            write('Título de la foto: '); readln(v[i].titulo);
            write('Autor de la foto: '); readln(v[i].autor);
            write('La cantidad de me gustas que haya recibido: '); readln(v[i].likes);
            write('La cantidad de clics que haya recibido: '); readln(v[i].clicks);
            write('La cantidad de comentarios que haya recibido: '); readln(v[i].comentarios);
            writeln;
        end;
    end;
procedure actualizarMaximo(tFotoActual: string; cFotoActual: integer; var tFotoMax: string; var cFotoMax: integer);
    begin
        if (cFotoActual > cFotoMax) then begin
            tFotoMax:= tFotoActual;
            cFotoMax:= cFotoActual;
        end;
    end;
procedure procesarVector(v: vector; var tFotoMax: string; var cantArtVand: integer);
    var
        i, clicsMax: integer;
    begin
        for i:= 1 to dimF do begin
            actualizarMaximo(v[i].titulo, v[i].clicks, tFotoMax, clicsMax);
            if (v[i].autor = 'Art Vandelay') then begin cantArtVand:= cantArtVand + v[i].likes; end;
            writeln('La foto [',v[i].titulo,'] del autor [',v[i].autor,'] recibió ',v[i].comentarios,' comentarios');
        end;
    end;
var
    v: vector;
    tFotoMax: string;
    cantArtVandalay: integer;
begin
    writeln('--- ARGENPICS ---');
    cargarVector(v);
    procesarVector(v, tFotoMax, cantArtVandalay);
    writeln;
    writeln('El título de la foto mas vista en la página es ',tFotoMax);
    write('El autor Art Vandelay ha recibido un total de ',cantArtVandalay,' Me Gusta');
end.
