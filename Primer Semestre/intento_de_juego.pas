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
    SIMBOLO_flor = '8';
    SIMBOLO_vacio = '_';
    SIMBOLO_pared = 'I';
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
    coordenada = record //REGISTRO DE LAS COORDENADAS
        x: integer;
        y: integer;
    end;
    parte_del_mapa = array [1..ancho_mapa] of char;
    mapa = array [1..largo_mapa] of parte_del_mapa;
    coordenadas_usadas = array [1..50] of coordenada; //HAY 50 COORDENADAS POSIBLES EN EL MAPA
    
//MÓDULOS
procedure lineas(); //SEPARAR EN LA CONSOLA
    begin
        writeln;
        writeln(' ------------------------------ ');
    end;
    
//MÓDULOS DEL MAPA
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
function coordenada_bloqueada(m: mapa; x, y: integer):boolean; //VERIFICAR SI LA COORDENADA ESTÁ OCUPADA CON UN OBJETO SÓLIDO O CON EL JUGADOR
    var
        aux: boolean;
    begin
        aux:= false;
        if (m[y][x] = SIMBOLO_pared) or (m[y][x] = SIMBOLO_jugador) then begin
            aux:= true;
        end;
        coordenada_bloqueada:= aux;
    end;
procedure coordenada_usada_agregar(var c: coordenadas_usadas; var CU_dimL: integer; x, y: integer);
    begin
        if (coordenada_existe(x, y)) then begin
            if (CU_dimL <= 50) then begin
                CU_dimL:= CU_dimL + 1;
                c[CU_dimL].x:= x;
                c[CU_dimL].y:= y;
                //writeln(' COORDENADA AGREGADA ',x,' ',y);
            end else begin
                writeln(' ERROR: SE AGOTARON LAS COORDENADAS');
            end;
        end else begin
            writeln(' ERROR: ESA COORDENADA ESTÁ FUERA DEL MUNDO');
        end;
    end;
function coordenada_usada_adentro(c: coordenadas_usadas; CU_dimL: integer; x, y: integer):integer;
    var
        i, aux: integer;
    begin
        aux:= -1;
        for i:=1 to CU_dimL do begin //BUSCAR LA POSICIÓN DE LA COORDENADA AGREGADA
            if (c[i].x = x) and (c[i].y = y) then begin //SI SE ENCUENTRA LA COORDENADA EN EL VECTOR
                aux:= i;
            end;
        end;
        coordenada_usada_adentro:= aux;
    end;
procedure coordenada_usada_eliminar(var c: coordenadas_usadas; var CU_dimL: integer; x, y: integer);
    var
        i, c_pos: integer;
    begin
        if (coordenada_existe(x, y)) then begin
            if (CU_dimL >= 0) then begin
                c_pos:= coordenada_usada_adentro(c, CU_dimL, x, y);
                if (c_pos <> -1) then begin //SI LA COORDENADA ESTÁ DENTRO DEL VECTOR
                    for i:=c_pos to CU_dimL do begin //PROCEDER A ELIMINARLA
                        c[i]:= c[i+1]; //DESPLAZAR ELEMENTOS DEL VECTOR
                    end;
                    CU_dimL:= CU_dimL - 1; //SUSTRAERLE UNA UNIDAD A LA DIMENSIÓN LÓGICA
                    //writeln(' COORDENADA ELIMINADA ',x,' ',y);
                end else begin
                    writeln(' ERROR: NO SE ENCUENTRA LA COORDENADA DENTRO DEL VECTOR');
                end;
                CU_dimL:= CU_dimL - 1;
            end else begin
                writeln(' ERROR: NO PUEDEN HABER MENOS COORDENADAS');
            end;
        end else begin
            writeln(' ERROR: ESA COORDENADA ESTÁ FUERA DEL MUNDO');
        end;
    end;
procedure mapa_crear_pared(var m: mapa; var c: coordenadas_usadas; var CU_dimL: integer; x, y: integer); //APARECER FLORES EN EL MAPA
    begin
        if (CU_dimL+1 <= 49) then begin
            if (coordenada_usada_adentro(c, CU_dimL, x, y) <> -1) then begin
                m[y][x]:= SIMBOLO_pared;
                coordenada_usada_agregar(c, CU_dimL, x, y);
            end else begin
                writeln(' ERROR: ESA COORDENADA YA ESTÁ SIENDO USADA');
            end;
        end else begin
            writeln(' ERROR: NO QUEDA ESPACIO');
        end;
    end;    

//MÓDULOS DEL JUGADOR
procedure jugador_inicializar(var j: player; var c: coordenadas_usadas; var CU_dimL: integer); //CREAR AL JUGADOR
    begin
        write(' NOMBRE DEL JUGADOR: '); readln(j.nombre);
        write(' EDAD DEL JUGADOR: '); readln(j.edad);
        j.vida:= 10; //El jugador inicia con 10 puntos de vida
        j.dinero:= 100; //El jugador inicia con 100 monedas
        j.se_puede_mover:= true; //Variable reservada para fines especiales
        j.x:= 3; //El jugador aparece en el centro del mapa (3, 1)
        j.y:= 1; //El jugador aparece en el centro del mapa (3, 1)
        CU_dimL:= CU_dimL + 1;
        c[CU_dimL].x:= j.x;
        c[CU_dimL].y:= j.y;
    end;
procedure jugador_borrar_posicion(var m: mapa; j: player); //COLOCAR AL JUGADOR EN TAL COORDENADA
    begin
        m[j.y][j.x]:= SIMBOLO_vacio;
    end;
procedure jugador_coordenada(var m: mapa; var j: player; x, y: integer; var c: coordenadas_usadas; var CU_dimL: integer); //COLOCAR AL JUGADOR EN TAL COORDENADA
    var
        aux: boolean;
    begin
        aux:= coordenada_existe(x, y);
        if (aux) then begin
            if (coordenada_usada_adentro(c, CU_dimL, j.x, j.y) <> -1) then begin
                coordenada_usada_eliminar(c, CU_dimL, j.x, j.y); //ELIMINAR COORDENADA USADA
            end;
            jugador_borrar_posicion(m, j); //Borrar el 1 de la posición anterior
            m[y][x]:= SIMBOLO_jugador;
            coordenada_usada_agregar(c, CU_dimL, x, y); //AGREGAR NUEVA COORDENADA USADA
            j.y:= y; //Actualizar coordenada X del jugador
            j.x:= x; //Actualizar coordenada Y del jugador
        end else begin
            writeln(' ERROR: ESA COORDENANDA ESTÁ FUERA DEL MUNDO');
        end;
    end;
procedure jugador_mover(var m: mapa; var j: player; pasos, direccion: integer; var c: coordenadas_usadas; var CU_dimL: integer); //MOVIMIENTO DEL JUGADOR
    begin
        if (direccion = dir_abajo) then begin
            jugador_coordenada(m, j, j.x, j.y + pasos, c, CU_dimL); end
        else if (direccion = dir_arriba) then begin
            jugador_coordenada(m, j, j.x, j.y - pasos, c, CU_dimL); end
        else if (direccion = dir_izquierda) then begin
            jugador_coordenada(m, j, j.x - pasos, j.y, c, CU_dimL); end
        else if (direccion = dir_derecha) then begin
            jugador_coordenada(m, j, j.x + pasos, j.y, c, CU_dimL); end
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
    
//CONSOLA
procedure consola(var m: mapa; var j: player; var c: coordenadas_usadas; var CU_dimL: integer; var runtime: boolean);
    var
        tipo_accion: string[10];
    begin
        write(' ¿QUÉ TIPO DE ACCIÓN DESEA HACER EL JUGADOR?: '); readln(tipo_accion);
        if (tipo_accion = 'LEER STATS') then begin //LEER ESTADÍSTICAS
            jugador_stats(j); end
        else if (tipo_accion = 'AUTODAÑO') then begin //AUTO-INFLINGIRSE DAÑO
            jugador_hacerse_dano(m, j); end
        else if (tipo_accion = 'TERMINAR') then begin //TERMINAR JUEGO
            runtime:= false; end
        else if (tipo_accion = 'MOVER') then begin //MOVIMIENTO
            if (j.se_puede_mover) then begin
                write(' ¿HACIA DONDE?: '); readln(tipo_accion);
                if (tipo_accion = 'ABAJO') then begin
                    jugador_mover(m, j, 1, dir_abajo, c, CU_dimL); end
                else if (tipo_accion = 'ARRIBA') then begin
                    jugador_mover(m, j, 1, dir_arriba, c, CU_dimL); end
                else if (tipo_accion = 'IZQUIERDA') then begin
                    jugador_mover(m, j, 1, dir_izquierda, c, CU_dimL); end
                else if (tipo_accion = 'DERECHA') then begin
                    jugador_mover(m, j, 1, dir_derecha, c, CU_dimL); end
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
    c: coordenadas_usadas;
    
    CU_dimL: integer;
    runtime: boolean;
begin
    //INICIALIZAR JUEGO
    runtime:= true;
    CU_dimL:= 0;
    jugador_inicializar(j, c, CU_dimL);
    mapa_cargar(m);
    jugador_coordenada(m, j, j.x, j.y, c, CU_dimL);
    lineas();
    mapa_crear_pared(m, c, CU_dimL, 3, 2);
    mapa_leer(m);
    
    //MIENTRAS EL JUEGO SE EJECUTE
    while (runtime) and (j.vida > 0) do begin
        consola(m, j, c, CU_dimL, runtime);
        lineas();
        mapa_leer(m);
    end;
    
    //TERMINA EL JUEGO
    writeln(' JUEGO TERMINADO');
end.
