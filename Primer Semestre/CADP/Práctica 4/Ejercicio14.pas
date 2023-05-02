program Ejercicio14;
const
    dimF = 10; //1000 proyectos
type
    dosCositas = record //para el punto c y d
        monto: real;
        cantArqSoft: integer;
    end;
    codigo = array [1..1000] of dosCositas; //Vector para los codigos del proyecto
    rangoNum: 0..9999;
    rangoTxt: str[40];
    proyecto = record //Registro del proyecto
        pais_origen: rangoTxt;
        cod_proj: 1..1000;
        nombre: rangoTxt;
        rol: 1..5;
        horas: rangoNum;
        c: codigo;
    end;
    vector = array [1..dimF] of proyecto; //Vector principal
function salarioPorRol(rol, cantidad: integer):real;
    begin
        case rol of
            1: salarioPorRol:= cantidad * 35.20; //Analista Funcional 
            2: salarioPorRol:= cantidad * 27.45; //Programador
            3: salarioPorRol:= cantidad * 31.03; //Administrador de bases de datos
            4: salarioPorRol:= cantidad * 44.28; //Arquitecto de software
            5: salarioPorRol:= cantidad * 39.87; //Administrador de redes y seguridad
        end;
    end;
procedure leerProyecto(var p: proyecto);
    begin
        write('País de residencia del participante: '); readln(p.pais_origen);
        write('Nombre del proyecto: '); readln(p.nombre);
        write('Rol del participante en el proyecto: '); readln(p.rol);
        write('Cantidad de horas trabajadas: '); readln(p.horas);
    end;
procedure leerVector(var v: vector; var dimL: integer);
    var
        i, aux: integer;
    begin
        i:= 1; //Comenzar index en 1
        write('Código del proyecto: '); readln(v[i].cod_proj);
        while (v[i].cod_proj <> -1) and (dimL <= dimF) do begin //Terminar si el código ingresado es -1 o la dimensión lógica es igual a la física
            leerProyecto(v[i]);
            i:= i + 1;
            write('Código del proyecto: '); readln(v[i].cod_proj);
        end;
        dimL:= i-1;
    end;
//a) El monto total invertido en desarrolladores con residencia en Argentina.
//b) La cantidad total de horas trabajadas por Administradores de bases de datos.
//c) El código del proyecto con menor monto invertido.
//d) La cantidad de Arquitectos de software de cada proyecto.
procedure encontrarProyectoMontoMin(c: codigo);
    var
        i. codMin: integer;
        montoMin: real;
    begin
        montoMin:= 99999;
        codMin:= 0;
        for i:= 1 to 1000 do begin
            if (c[i].monto < montoMin) then begin
                montoMin:= c[i].monto;
                codMin:= i;
            end;
        end;
    end;
procedure procesarVector(v: vector; dimL: integer; var cMontoMin: integer; var pMontoMin: real);
    var
        i, horasAdmBaseDatos: integer;
        r: roles;
        c: codigo;
        montoArgentino: real;
    begin
        montoArgentino:= 0;
        montoProyectoMin:= 99999;
        codProyectoMin:= 0;
        horasAdmBaseDatos:= 0;
        for i:= 1 to dimL do begin //Recorrer todos los espacios llenos del vector
            if (v[i].pais_origen = 'Argentina') then begin //punto a
                montoArgentino:= montoArgentino + salarioPorRol(v[i].rol, v[i].horas);
            end;
            if (v[i].rol = 3) then begin //punto b
                horasAdmBaseDatos:= horasAdmBaseDatos + v[i].horas;
            end;
            v[i].c[v[i].cod_proj].monto:= v[i].c[v[i].cod_proj].monto + salarioPorRol(v[i].rol, v[i].horas); //Incrementar el monto por código del proyecto - punto c
            if (v[i].rol = 4) then begin //punto d
                v[i].c[v[i].cod_proj].cantArqSoft:= v[i].c[v[i].cod_proj].cantArqSoft + 1;
            end;
        end;
        encontrarProyectoMontoMin(v[i].c, pMontoMin, cMontoMin);
    end;
var
    
begin
    
end.
