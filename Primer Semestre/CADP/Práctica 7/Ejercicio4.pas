program Ejercicio4;
const
    emb_dimF = 42;
type
    t_peso = 1..42;
    v_peso = array [t_peso] of integer;
    lista = ^nodo;
    paciente = record
        nombre: string[10];
        apellido: string[10];
        semana_peso: v_peso;
        dimL: t_peso;
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
        while (i <= emb_dimF) and (seguir <> 0) do begin
            write('INGRESE EL PESO REGISTRADO EN LA SEMANA ',i,': '); readln(p.semana_peso[i]);
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
        i, semanaMax, pesoMax, pesoTotal: integer;
    begin
        pesoMax:= -1;
        semanaMax:= 0;
        pesoTotal:= 0;
        while (l <> nil) do begin
            for i:= 1 to l^.data.dimL do begin
                if (l^.data.semana_peso[i] > pesoMax) then begin
                    pesoMax:= l^.data.semana_peso[i];
                    semanaMax:= i;
                end;
                pesoTotal:= pesoTotal + l^.data.semana_peso[i];
            end;
            writeln('Semana con mayor peso: ',semanaMax);
            writeln('Aumento de peso total: ',pesoTotal);
            semanaMax:= 0;
            pesoMax:= 0;
            pesoTotal:= 0;
            l:= l^.sig;
        end;
    end;
var
    l: lista;
begin
    l:= nil;
    cargarLista(l); //SE DISPONE
    procesarLista(l);
end.
