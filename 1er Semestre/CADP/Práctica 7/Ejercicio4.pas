program Ejercicio4;
const
    dimF = 42;
type
    lista = ^nodo;
    v_peso = array [1..dimF] of integer;
    paciente = record
        nombre: string[10];
        apellido: string[10];
        peso: v_peso;
        dimL: integer;
    end;
    nodo = record
        data: paciente;
        sig: lista;
    end;
procedure leerPaciente(var p: paciente); //SE DISPONE
    var
        i, dimL, seguir: integer;
    begin
        dimL:= 0;
        seguir:= -1;
        i:= 1;
        write('NOMBRE: '); readln(p.nombre);
        write('APELLIDO: '); readln(p.apellido);
        while (i <= dimF) and (seguir <> 0) do begin
            write('INGRESE EL PESO REGISTRADO EN LA SEMANA ',i,': '); readln(p.peso[i]);
            write('¿SEGUIR? (0/1): '); readln(seguir);
            dimL:= dimL + 1;
            i:= i + 1;
        end;
        p.dimL:= dimL;
    end;
procedure agregarNodo(var l: lista; p: paciente); //SE DISPONE
    var
        aux: lista;
    begin
        new(aux);
        aux^.data:= p;
        aux^.sig:= nil;
        if (l = nil) then begin
            l:= aux;
        end else begin
            aux^.sig:= l;
            l:= aux;
        end;
    end;
procedure cargarLista(var l: lista); //SE DISPONE
    var
        p: paciente;
        seguir: integer;
    begin
        seguir:= -1;
        leerPaciente(p);
        while (seguir <> 0) do begin
            agregarNodo(l, p);
            writeln;
            write('¿SEGUIR? (0/1): '); readln(seguir);
            if (seguir <> 0) then
                leerPaciente(p);
        end;
    end;
procedure procesarLista(l: lista);
    var
        i, semanaMax, pesoAnterior, aumentoMax, pesoTotal: integer;
    begin
        semanaMax:= 0;
        aumentoMax:= -1;
        pesoTotal:= 0;
        while (l <> nil) do begin
            pesoAnterior:= l^.data.peso[1];
            for i:= 1 to l^.data.dimL do begin
                if ((l^.data.peso[i] - pesoAnterior) > aumentoMax) then begin
                    aumentoMax:= (l^.data.peso[i] - pesoAnterior);
                    semanaMax:= i;
                    pesoTotal:= pesoTotal + (l^.data.peso[i] - pesoAnterior);
                end;
                pesoAnterior:= l^.data.peso[i];
            end;
            writeln('SEMANA CON MAYOR AUMENTO DE PESO: ',semanaMax);
            writeln('AUMENTO DE PESO TOTAL: ',pesoTotal);
            semanaMax:= 0;
            aumentoMax:= -1;
            pesoTotal:= 0;
            l:= l^.sig;
        end;
    end;
var
    l: lista;
begin
    l:= nil;
    cargarLista(l);
    procesarLista(l);
end.
