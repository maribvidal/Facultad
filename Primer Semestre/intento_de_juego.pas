program TEST_game;

//CONSTANTES Y TIPOS DE VARIABLE ESPECIALES
const
    //MAPA
    ancho_mapa = 10; //X
    largo_mapa = 5; //Y
    //DIRECCIONES
    dir_abajo = 0;
    dir_arriba = 1;
    dir_izquierda = 2;
    dir_derecha = 3;
    //REPRESENTACIONES DEL MAPA
    SIMBOLO_jugador = 'P';
    SIMBOLO_vacio = '_';
type
    player = record //REGISTRO DEL JUGADOR
        nombre: string[8];
        edad: 1..99;
        vida: 0..10;
        dinero: real;
        se_puede_mover: boolean;
        x: integer; //Coordenadas X del jugador
        y: integer; //Coordeandas Y del jugador
    end;
    parte_del_mapa = array [1..ancho_mapa] of char;
    mapa = array [1..largo_mapa] of parte_del_mapa;
    
//MÓDULOS
procedure lineas(); //SEPARAR EN LA CONSOLA
    begin
        writeln;
        writeln(' ------------------------------ ');
    end;
procedure mapa_cargar(var m: mapa); //CARGAR EL MAPA
    var
        i, j: integer;
    begin
        for i:=1 to largo_mapa do begin
            for j:=1 to ancho_mapa do begin
                m[i][j]:= SIMBOLO_vacio;
            end;
        end;
    end;
procedure mapa_leer(m: mapa); //GRAFICAR EL MAPA
    var
        i, j: integer;
        sector_actual: parte_del_mapa;
    begin
        writeln('-  -  -  - MAPA -  -  -  -');
        for i:=1 to largo_mapa do begin
            sector_actual:= m[i];
            write('[');
            for j:=1 to ancho_mapa do begin
                write(sector_actual[j]);
                if (j <> ancho_mapa) then begin 
                    write(', '); 
                end;
            end;
            write(']');
            writeln;
        end;
    end;
procedure jugador_inicializar(var j: player); //CREAR AL JUGADOR
    begin
        write(' NOMBRE DEL JUGADOR: '); readln(j.nombre);
        write(' EDAD DEL JUGADOR: '); readln(j.edad);
        j.vida:= 10; //El jugador inicia con 10 puntos de vida
        j.dinero:= 100; //El jugador inicia con 100 monedas
        j.se_puede_mover:= true; //Variable reservada para fines especiales
        j.x:= 3; //El jugador aparece en el centro del mapa (3, 1)
        j.y:= 1; //El jugador aparece en el centro del mapa (3, 1)
    end;
function coordenada_existe(x, y: integer):boolean; //VERIFICAR SI LA COORDENADA SE ENCUENTRA DENTRO DEL RANGO Y DEVOLVER
    var
        aux: boolean;
    begin
        aux:= false;
        if (x > 0) and (x < ancho_mapa+1) then begin //Si la Y se encuentra dentro del rango...
            if (y > 0) and (y < largo_mapa+1) then begin //Si la X se encuentra dentro del rango...
                aux:= true;
            end;
        end;
        coordenada_existe:= aux;
    end;
procedure jugador_borrar_posicion(var m: mapa; j: player); //COLOCAR AL JUGADOR EN TAL COORDENADA
    begin
        m[j.y][j.x]:= SIMBOLO_vacio;
    end;
procedure jugador_coordenada(var m: mapa; var j: player; x, y: integer); //COLOCAR AL JUGADOR EN TAL COORDENADA
    var
        aux: boolean;
    begin
        aux:= coordenada_existe(x, y);
        if (aux) then begin
            jugador_borrar_posicion(m, j); //Borrar el 1 de la posición anterior
            m[y][x]:= SIMBOLO_jugador;
            j.y:= y; //Actualizar coordenada X del jugador
            j.x:= x; //Actualizar coordenada Y del jugador
        end else begin
            writeln(' ERROR: ESA COORDENANDA ESTÁ FUERA DEL MUNDO');
        end;
    end;
procedure jugador_mover(var m: mapa; var j: player; pasos, direccion: integer); //MOVIMIENTO DEL JUGADOR
    begin
        if (direccion = dir_abajo) then begin
            jugador_coordenada(m, j, j.x, j.y + pasos); end
        else if (direccion = dir_arriba) then begin
            jugador_coordenada(m, j, j.x, j.y - pasos); end
        else if (direccion = dir_izquierda) then begin
            jugador_coordenada(m, j, j.x - pasos, j.y); end
        else if (direccion = dir_derecha) then begin
            jugador_coordenada(m, j, j.x + pasos, j.y); end
        else begin //Si no es ninguna de las anteriores...
            writeln(' ERROR: MOVIMIENTO DESCONOCIDO');
        end;
    end;
procedure jugador_stats(j: player); //ESTADÍSTICAS DEL JUGADOR
    begin
        writeln(' NOMBRE: ',j.nombre);
        writeln(' EDAD: ',j.edad);
        writeln(' VIDA: ',j.vida,'/10');
        writeln(' DINERO: ',j.dinero:2:2,'$');
        writeln(' POSICIÓN EN EL MAPA: (',j.x,', ',j.y,')');
    end;
procedure jugador_hacerse_dano(var m: mapa; var j: player);
    begin
        j.vida:= j.vida - 1;
        if (j.vida > 0) then begin //SI EL JUGADOR TIENE 1 CORAZON O MAS DE VIDA
            writeln(' EL JUGADOR SE HA HECHO DAÑO (1 CORAZÓN PERDIDO)'); end
        else begin //SI YA NO TIENE CORAZONES
            j.se_puede_mover:= false;
            writeln(' EL JUGADOR HA MUERTO');
            jugador_borrar_posicion(m, j);
        end;
    end;
procedure consola(var m: mapa; var j: player); //CONSOLA
    var
        tipo_accion: string[10];
    begin
        write(' ¿QUÉ TIPO DE ACCIÓN DESEA HACER EL JUGADOR?: '); readln(tipo_accion);
        if (tipo_accion = 'LEER STATS') then begin //LEER ESTADÍSTICAS
            jugador_stats(j); end
        else if (tipo_accion = 'AUTODAÑO') then begin //AUTO-INFLINGIRSE DAÑO
            jugador_hacerse_dano(m, j); end
        else if (tipo_accion = 'MOVER') then begin //MOVIMIENTO
            if (j.se_puede_mover) then begin
                write(' ¿HACIA DONDE?: '); readln(tipo_accion);
                if (tipo_accion = 'ABAJO') then begin
                    jugador_mover(m, j, 1, dir_abajo); end
                else if (tipo_accion = 'ARRIBA') then begin
                    jugador_mover(m, j, 1, dir_arriba); end
                else if (tipo_accion = 'IZQUIERDA') then begin
                    jugador_mover(m, j, 1, dir_izquierda); end
                else if (tipo_accion = 'DERECHA') then begin
                    jugador_mover(m, j, 1, dir_derecha); end
                else begin
                    writeln(' ERROR: MOVIMIENTO DESCONOCIDO');
                end; 
            end
            else begin
                writeln(' EL JUGADOR NO SE PUEDE MOVER');
            end;
        end
        else begin //SI LA ACCIÓN INTRODUCIDA NO EXISTE
            writeln(' ERROR: ACCIÓN DESCONOCIDA');
        end;
    end;
var
    m: mapa;
    j: player;
    runtime: boolean;
begin
    //INICIALIZAR JUEGO
    runtime:= true; //EL JUEGO SE ESTÁ EJECUTANDO
    jugador_inicializar(j);
    mapa_cargar(m);
    jugador_coordenada(m, j, j.x, j.y);
    lineas();
    mapa_leer(m);
    
    //MIENTRAS EL JUEGO SE EJECUTE
    while (runtime) and (j.vida > 0) do begin
        consola(m, j);
        lineas();
        mapa_leer(m);
    end;
    
    //TERMINA EL JUEGO
    writeln(' JUEGO TERMINADO');
end.
