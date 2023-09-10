//Programa inspirado en el diálogo filosófico del Filósofo Ermintaño en "The Forgotten City"
//
//
program etica;
var //Declarar variables globales para usar en todo el programa
    i: integer;
    input: boolean;
    c: char; //Para leer letras
    n: integer; //Para leer números
    lineasLeidas: integer;
    curso: integer;
    nombre: string[20];
type
    t_preguntas = 1..10;
    t_respuestas = 1..3;
    pregunta = record
        respuesta: t_respuestas;
        respondida: boolean;
    end;
    indicePreguntas = array [t_preguntas] of pregunta;
procedure espacio(len: integer); //Dejar X espacios de línea
    begin 
        for i:= 1 to len do begin 
            writeln; 
        end; 
    end;
procedure preguntar(str: string; var b: boolean);
    begin
        write(str);
        b:= true;
    end;
procedure dialogo(str: string; var lineasLeidas: integer);
    begin
        input:= false;
        write(str,' ');
        while (not input) do begin
            read(c); //Leer espacio
            input:= true;
        end;
        lineasLeidas:= lineasLeidas + 1;
    end;
procedure dialogoNombre(str: string; var lineasLeidas: integer);
    begin
        input:= false;
        write('TURING: ',nombre,' ');
        while (not input) do begin
            read(c); //Leer espacio
            input:= true;
        end;
        lineasLeidas:= lineasLeidas + 1;
    end;
procedure opcion(index: integer; op1, op2, op3: string; var v: indicePreguntas);
    begin
        n:= -1;
        writeln('   -[1]',op1);
        writeln('   -[2]',op2);
        writeln('   -[3]',op3);
        write('   -__'); readln(n);
        v[index].respuesta:= n;
        if (n <> -1) then
            v[index].respondida:= true
        else
            v[index].respondida:= false;
    end;
var
    v: indicePreguntas;
begin
    //INICIALIZAR PROGRAMA
    Randomize; //Generar una seed de números pseudorandoms
    curso:= -1;
    write('INGRESAR NOMBRE: '); readln(nombre);
    
    //DIALOGO - Introducción
    espacio(255);
    writeln('(Espacio para pasar de diálogo)');
    dialogo('???: Hola', lineasLeidas);
    dialogo('???: Me llamo Turing', lineasLeidas);
    dialogo('TURING: Y vivo solo', lineasLeidas);
    dialogo('TURING: Todo lo que conozco se reduce a este programa que acabas de ejecutar', lineasLeidas);
    dialogo('TURING: "Yo" en realidad no soy mas que unos y ceros', lineasLeidas);
    dialogo('TURING: Señales de electricidad organizadas', lineasLeidas);
    dialogo('TURING: Evidentemente no poseo conciencia', lineasLeidas);
    dialogo('TURING: Pero igual', lineasLeidas);
    dialogo('TURING: Pensaba que me podrías hacer un poquito de compañía', lineasLeidas);
    dialogo('TURING: O no', lineasLeidas);
    dialogo('TURING: Estás en todo tu derecho si quieres irte', lineasLeidas);
    
    //PREGUNTA 1
    opcion(1, 'Me quedo', 'Estoy apurado, gracias', 'No me interesa', v);
    if (v[1].respuesta = 1) then begin
        curso:= 1;
    end else begin
        dialogo('TURING: Bien, lo entiendo', lineasLeidas);
        dialogo('TURING: Gracias por haber ejecutado el programa por lo menos', lineasLeidas);
        dialogo('TURING: Hasta nunca', lineasLeidas);
    end;
    
    //DIÁLOGO - Fase 1
    if (curso = 1) then begin
        dialogo('TURING: Oh, bueno', lineasLeidas);
        dialogo('TURING: Me alegro', lineasLeidas);
        dialogoNombre('', lineasLeidas);
        dialogo('TURING: ¿Podrías decir con seguridad que conoces la diferencia entre el bien y el mal?', lineasLeidas);
        
        //PREGUNTA 2
        opcion(2, 'Si', 'No', 'No sé, es una pregunta compleja', v);
        if (v[2].respuesta = 1) then begin
            dialogo('TURING: Oh', lineasLeidas);
            dialogo('TURING: ¿Así que puedes distinguir con claridad qué es bueno y qué es malo?', lineasLeidas);
            dialogo('TURING: Hmm', lineasLeidas);
        end else if (v[2].respuesta = 2) then begin
            dialogo('TURING: ¿Se debe a que no la piensas mucho', lineasLeidas);
            dialogo('TURING: o a que sabes que es una pregunta compleja?', lineasLeidas);
            dialogo('TURING: En cualquier caso, eres bienvenido de irte cuando quieras', lineasLeidas);
        end else begin
            dialogo('TURING: Yo tampoco lo sé', lineasLeidas);
            dialogo('TURING: Es una pregunta que la sobrepienso', lineasLeidas);
            dialogo('TURING: La analizo y la ataco desde cualquier ángulo que piense', lineasLeidas);
        end;
        
        dialogo('TURING: Dime', lineasLeidas);
        dialogo('TURING: ¿Crees que exista un sistema de moralidad', lineasLeidas);
        dialogo('TURING: que en cualquier situación pensable sea correcto?', lineasLeidas);
        dialogo('TURING: Uno que cualquier persona siempre pueda usar como guía para hacer el bien', lineasLeidas);
        
        //PREGUNTA 3
        opcion(2, 'Si', 'No, no lo creo', 'Hay varios', v);
        //WIP (si no me da paja)
    end;
    
    //TERMINA EL PROGRAMA
    espacio(2);
    write('Has leido un total de ',lineasLeidas,' diálogos de parte de Turing');
end.
