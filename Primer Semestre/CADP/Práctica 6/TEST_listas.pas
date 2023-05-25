program TEST_lista;
type
    content = string[4];
    lista = ^nodo; //ESTRUCTURA DINÁMICA (puede variar durante la ejecución del programa) PARA GUARDAR ELEMENTOS
    nodo = record
        contenido: content;
        siguiente: lista;
    end;
procedure crearNodo(var p, u: lista); //INICIALIZAR EL NODO EN LA DIRECCIÓN NIL
    begin
        p:= nil;
        u:= nil;
    end;
procedure agregarAlPrincipio(var p: lista; contenido: string); //Va agregando elementos para atrás
    var
        nuevo_p: lista;
    begin
        new(nuevo_p); //GENERAR UNA NUEVA DIRECCIÓN PARA P
        nuevo_p^.contenido:= contenido;
        nuevo_p^.siguiente:= nil;
        if (p = nil) then begin p:= nuevo_p; end //SI P NO TIENE DIRECCIÓN, ASIGNAR NUEVO_P A P
        else begin //SI NO, ASIGNAR COMO "SIGUIENTE" DE NUEVO_P AL PUNTERO ACTUAL, Y ASIGNAR AL PUNTERO ACTUAL LA DIRECCIÓN DE NUEVO_P
            nuevo_p^.siguiente:= p;
            p:= nuevo_P;
        end;
    end;
procedure agregarAlFinal(var p, u: lista; contenido: string); //Agrega un último elemento a la lista
    var
        nuevo_p: lista;
    begin
        new(nuevo_p); //GENERAR UNA NUEVA DIRECCIÓN PARA P
        nuevo_p^.contenido:= contenido;
        nuevo_p^.siguiente:= nil;
        if (p = nil) then begin 
            p:= nuevo_p; 
            u:= nuevo_p;
        end else begin
            u^.siguiente:= nuevo_p;
            u:= nuevo_p;
        end;
    end;
procedure recorrerLista(p: lista); //RECORRER LA LISTA DE NODOS
    begin
        while (p <> nil) do begin //MIENTRAS LA DIRECCIÓN DE NODO SEA DIFERENTE DE NIL (osea, cuando el elemento de la lista no sea el último)
            writeln(p^.contenido); //IMPRIMIR CONTENIDO GUARDADO EN LA DIRECCIÓN
            p:= p^.siguiente; //ASIGNARLE LA DIRECCIÓN Y EL CONTENIDO DEL SIGUIETNE PUNTERO EN LA LISTA
        end;
    end;
var
    primerNodo: lista; //MEMORIA ESTÁTICA - 4 bytes (variable local)
    ultimoNodo: lista; //MEMORIA ESTÁTICA - 4 bytes (variable local)
    contenido: content; //MEMORIA ESTÁTICA - 4+1=5 bytes (variable local)
begin
  crearNodo(primerNodo, ultimoNodo);
  write('Ingrese texto: >'); readln(contenido);
  agregarAlFinal(primerNodo, ultimoNodo, contenido);
  write('Ingrese texto: >'); readln(contenido);
  agregarAlFinal(primerNodo, ultimoNodo, contenido);
  write('Ingrese texto: >'); readln(contenido);
  agregarAlFinal(primerNodo, ultimoNodo, contenido);
  write('Ingrese texto: >'); readln(contenido);
  recorrerLista(primerNodo);
  agregarAlPrincipio(primerNodo, contenido);
  writeln;
  recorrerLista(primerNodo);
end.
