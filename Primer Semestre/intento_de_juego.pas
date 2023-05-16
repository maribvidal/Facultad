program TEST_game;

//CONSTANTES Y TIPOS DE VARIABLE ESPECIALES
const
    ancho_mapa = 10; //X
    largo_mapa = 5; //Y
type
    player = record //REGISTRO DEL JUGADOR
        nombre: string[8];
        edad: 1..99;
        vida: 1..10;
        dinero: real;
        se_puede_mover: boolean;
        x: integer; //Coordenadas X del jugador
        y: integer; //Coordeandas Y del jugador
    end;
    parte_del_mapa = array [1..ancho_mapa] of integer;
    mapa = array [1..largo_mapa] of parte_del_mapa;
    
//MÓDULOS
procedure lineas(var r: boolean); //SEPARAR EN LA CONSOLA
    begin
        if (r) then begin //SI EL JUEGO SIGUE EN EJECUCIÓN
            writeln(' ------------------------------ ');
            writeln;
            writeln;
            writeln;
            writeln(' ------------------------------ ');
        end;
    end;
procedure juego_detener(var r: boolean); //DETENER LA EJECUCIÓN DEL JUEGO
    begin
        r:= false;
        writeln('DETENIENDO LA EJECUCIÓN DEL JUEGO');
    end;
procedure mapa_cargar(var m: mapa); //CARGAR EL MAPA
    var
        i, j: integer;
        sector_actual: parte_del_mapa;
    begin
        for i:=1 to largo_mapa do begin
            sector_actual:= m[i];
            for j:=1 to ancho_mapa do begin
                sector_actual[j]:= 0;
            end;
        end;
    end;
procedure mapa_leer(m: mapa; var r: boolean); //GRAFICAR EL MAPA
    var
        i, j: integer;
        sector_actual: parte_del_mapa;
    begin
        if (r) then begin
            for i:=1 to largo_mapa do begin
                sector_actual:= m[i];
                write('[');
                for j:=1 to ancho_mapa do begin
                    write(sector_actual[j]);
                    if (j <> ancho_mapa) then begin write(', '); end;
                end;
                write(']');
                writeln;
            end;
        end;
    end;
procedure jugador_inicializar(var j: player); //CREAR AL JUGADOR
    begin
        write(' NOMBRE DEL JUGADOR: '); readln(j.nombre);
        write(' EDAD DEL JUGADOR: '); readln(j.edad);
        j.vida:= 10; //El jugador inicia con 10 puntos de vida
        j.dinero:= 100; //El jugador inicia con 100 monedas
        j.se_puede_mover:= true; //Variable reservada para fines especiales
        j.x:= 3; //El jugador aparece en el centro del mapa (3, 5)
        j.y:= 5; //El jugador aparece en el centro del mapa (3, 5)
    end;
function coordenada_existe(x, y: integer):boolean; //VERIFICAR SI LA COORDENADA SE ENCUENTRA DENTRO DEL RANGO Y DEVOLVER
    var
        aux: boolean;
    begin
        aux:= false;
        if (x > 0) and (x < ancho_mapa+1) then begin //Si la X se encuentra dentro del rango...
            if (y > 0) and (x < largo_mapa+1) then begin //Si la Y se encuentra dentro del rango...
                aux:= true;
            end;
        end;
        coordenada_existe:= aux;
    end;
procedure jugador_coordenada(var m: mapa; x, y: integer; var runtime: boolean); //COLOCAR AL JUGADOR EN TAL COORDENADA
    var
        aux: boolean;
    begin
        if (runtime) then begin //REVISAR SI EL JUEGO SIGUE CORRIENDO
            aux:= coordenada_existe(x, y);
            if (aux) then begin
                m[x][y]:= 1;
            end else begin
                writeln('ERROR: ESA COORDENANDA ESTÁ FUERA DEL MUNDO');
                juego_detener(runtime);
            end;
        end;
    end;
//procedure jugador_mover(var m: mapa; var j: player; var runtime: boolean); //MOVIMIENTO DEL JUGADOR
    //begin
        //if (runtime) then begin //REVISAR SI EL JUEGO SIGUE CORRIENDO
        //end;
    //end;
var
    m: mapa;
    j: player;
    runtime: boolean;
begin
    runtime:= true; //EL RUNTIME DECIDE SI EL JUEGO SE PARA O NO
    lineas(runtime);
    jugador_inicializar(j);
    lineas(runtime);
    mapa_cargar(m);
    mapa_leer(m, runtime);
    jugador_coordenada(m, 10, 5, runtime);
    lineas(runtime);
    mapa_leer(m, runtime);
end.
