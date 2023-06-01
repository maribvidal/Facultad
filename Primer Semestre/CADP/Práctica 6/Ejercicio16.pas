program Ejercicio16; //Ejercicio adicional
const
    corte = -1;
type
    lista = ^nodo;
    corredor = record 
        nombre: string[10];
        apellido: string[10];
        distancia: 0..9999; 
        tiempo: 0..9999; 
        pais: string[10];
        ciudad_inicio: string[10];
        ciudad_final: string[10];
    end;
    nodo = record
        data: corredor;
        sig: lista;
    end;
function sacarPaso(min, km: integer):real;
    begin
        sacarPaso:= (min / km);
    end;
procedure crearNodo(var l: lista);
    begin
        l:= nil;
    end;
procedure leerCorredor(var c: corredor);
    begin
        write('Distancia recorrida: '); readln(c.distancia);
        if (c.distancia <> corte) then begin
            write('Nombre: '); readln(c.nombre);
            write('Apellido: '); readln(c.apellido);
            write('Tiempo: '); readln(c.tiempo);
            write('Pais: '); readln(c.pais);
            write('Ciudad del inicio: '); readln(c.ciudad_inicio);
            write('Ciudad del final: '); readln(c.ciudad_final);
        end;
    end;
procedure agregarNodo(var l: lista; c: corredor); //De adelante
    var
        aux: lista;
    begin
        new(aux);
        aux^.data:= c;
        aux^.sig:= l;
        if (l = nil) then begin
            l:= aux;
        end else begin
            aux^.sig:= l;
            l:= aux;
        end;
    end;
procedure cargarLista(var l: lista);
    var
        c: corredor;
    begin
        leerCorredor(c);
        while (c.distancia <> corte) do begin //Mientras la distancia ingresada sea diferente de -1...
            agregarNodo(l, c);
            leerCorredor(c);
            writeln;
        end;
    end;
procedure actualizarMaximo(nombreActual: string; corActual, distActual: integer; var nombreNuevo: string; var corNuevo, distNuevo);
    begin
        if (corActual > corNuevo) then begin
            nombreNuevo:= nombreActual;
            corNuevo:= corActual;
            distNuevo:= distActual;
        end;
    end;
procedure procesarLista(l: lista; var puntoB: string; var puntoB2, puntoD: integer; var puntoC, puntoE: real);
    var
        paisActual, ciudadInicialActual: string[10];
        A_cantCorredores, A_distTotal, A_tiempoTotal: integer;
        B_corredores, B_dist, B_corredoresMax: integer;
        C_brasilCorredores, C_brasilDist: integer;
        D_corredores:= 0;
        E_corredores: integer;
        E_pasoTotal: real;
    begin
        //Inicializar variables
        paisActual:= l^.data.pais;
        ciudadInicialActual:= l^.data.ciudad_inicial;
        A_cantCorredores:= 0;
        A_distTotal:= 0;
        A_tiempoTotal:= 0;
        B_corredores:= 0;
        B_dist:= 0;
        B_corredoresMax:= -1;
        C_brasilCorredores:= 0;
        C_brasilDist:= 0;
        D_corredores:= 0;
        E_corredores:= 0;
        E_pasoTotal:= 0;
        
        //Recorrer toda la lista
        while (l <> nil) do begin //Romper cuando se llegue al último elemento
            while (l <> nil) and (l^.data.pais = paisActual) do begin //Romper cuando el país leido sea diferente del paisActual
                while (l <> nil) and (l^.data.ciudad_inicial = ciudadInicialActual) do begin //Romper cuando la ciudad leida sea diferente de la ciudad actual
                    //Punto A
                    A_cantCorredores:= A_cantCorredores + 1;
                    A_distTotal:= A_distTotal + l^.data.distancia;
                    A_tiempoTotal:= A_tiempoTotal + l^.data.tiempo;
                    
                    //Punto B - Obtener corredores y distancia
                    B_corredores:= B_corredores + 1;
                    B_dist:= B_dist + l^.data.distancia;
                    
                    //Punto C - Obtener corredores y distancia total
                    if (l^.data.pais = 'Brasil') then begin
                        C_brasilCorredores:= C_brasilCorredores + 1;
                        C_brasilDist:= C_brasilDist + 1;
                    end;
                    
                    //Punto D
                    if (l^.data.ciudad_final <> l^.data.ciudad_inicial) then begin
                        D_corredores:= D_corredores + 1;
                    end;
                    
                    //Punto E - Sacar cantidad de corredores y paso total
                    if (l^.data.ciudad_inicial = 'Boston') then begin
                        E_corredores:= E_corredores + 1;
                        E_pasoTotal:= E_pasoTotal + sacarPaso(l^.data.tiempo, l^.data.distancia);
                    end;
                    
                    //Seguir leyendo la lista
                    l:= l^.sig;
                end;
                //Punto B - Actualizar el máximo
                actualizarMaximo(ciudadInicialActual, B_corredores, B_dist, puntoB, B_corredoresMax, puntoB2);
                B_corredores:= 0;
                B_dist:= 0;
                
                //Punto E - Sacar el promedio
                if (l^.data.ciudad_inicial = 'Boston') then begin
                    puntoE:= (E_pasoTotal / E_corredores);
                end;
                
                //Reiniciar variables
                ciudadInicialActual:= l^.data.ciudad_inicial;
            end;
            //Punto C - Sacar promedio
            puntoC:= (C_brasilDist / C_brasilCorredores);
            
            //Reiniciar variables
            paisActual:= l^.data.pais;
        end;
        //Punto A - Leer cantidad total de corredores, la distancia total recorrida y el tiempo total de carrera de todos los corredores.
        writeln('Cantidad total de corredores: ', A_cantCorredores);
        writeln('Distancia total recorrida: ', A_distTotal);
        writeln('Tiempo total de carrera de todos los corredores: ',A_tiempoTotal);
        writeln;
    end;
var
    l: lista;
    puntoB: string[10];
    puntoC, puntoE: real;
    puntoB2, puntoD: integer;
begin
    crearNodo(l);
    cargarLista(l);
    puntoB:= '';
    puntoB2:= 0;
    puntoC:= 0;
    puntoD:= 0;
    puntoE:= 0;
    procesarLista(l, puntoB, puntoD, puntoC, puntoE);
    writeln('Nombre de la ciudad que convocó la mayor cantidad de corredores: ',puntoB);
    writeln('Cantidad total de kilómetros recorridos por los corredores de esa ciudad: ',puntoB2);
    writeln;
    writeln('Distancia promedio recorrida por corredores de Brasil: ',puntoC);
    writeln;
    writeln('Cantidad de corredores que partieron de una ciudad y finalizaron en otra ciudad: ',puntoD);
    writeln;
    write('Paso (cantidad de minutos por km) promedio de los corredores de la ciudad de Boston: ', puntoE);
end.
