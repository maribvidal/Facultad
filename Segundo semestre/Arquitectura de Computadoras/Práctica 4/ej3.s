;El programa multiplica binariamente la cadena almacenada en la variable A tres veces (la cantidad guardada en la variable B). 
;El lazo se va a seguir ejecutando hasta que R1 sea igual a 0.
;A) -Se presentan atascos tipo RAW porque el ID del BNEZ necesita saber cuanto vale R2 (si vale 0) para saber si saltar o no.
;  Y mientras se está ejecutando el ID del BNEZ, recien se está guardando el valor del decremento en R2, por lo que la instr.
;  va a tener que esperar hasta la etapa MEM para obtener el dato.
;
;  -El Branch Taken Stall se produce porque, al ejecutarse las instrucciones de manera segmentada, mientras se está ejecutando
;  la instrucción siguiente al control de salto, también se está ejecutando aquella instrucción próxima a ella, pero si la instrucción
;  de salto determina que el salto debe hacerse, la instrucción sucesiva no tenía sentido que ocurriera y por lo tanto se tiene que cortar,
;  produciendo un stall en el programa.
;
; -CPI: 1,75 / 21 Ciclos / 12 Instrucciones
;
;B) -Los atascos se producen en la instrucción de DSLL (2 ciclos) y en la de BNEZ (3 ciclos). Los atascos se producen debido a que
;  el dato que se necesita leer en cada caso (R2) aún no está listo.
;
;  -Sin forwarding, el atasco dura 3 ciclos, con forwarding solo 1. Esto se debe a que, como el forwarding está activado,
;  el dato que necesita BNEZ lo recibe adelantado de MEM por medio de un buffer.
;
; -CPI: 2,083 / 25 Ciclos / 12 Instrucciones
;
;C) -Si se coloca un 'NOP' luego de la instrucción DADDI, entonces no se producirá ningún atasco RAW (con el Forwarding activado)
;D) -Los números de la tabla son todos números 2 elevado a la N.

 .data
A: .word 1
B: .word 3
tabla: .word 0
 .code
 ld r1, A(r0); Sin desplazamiento
 ld r2, B(r0); Sin desplazamiento
 daddi r3, r0, 0; Inicializar en 0
loop: dsll r1, r1, 1
 daddi r2, r2, -1
 sd r1, tabla(r3)
 daddi r3, r3, 8; Incrementar dirección en 8
 bnez r2, loop
halt 
