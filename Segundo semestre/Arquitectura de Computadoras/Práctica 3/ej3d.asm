;Escribir un programa que solicite el ingreso de cinco caracteres por teclado y los almacene en memoria.
;Una vez ingresados, que los envíe a la impresora a través del HAND-SHAKE, en primer lugar tal cual
;fueron ingresados y a continuación en sentido inverso. Utilizar el HAND-SHAKE en modo consulta de
;estado. ¿Qué diferencias encuentra con el ejercicio 2c?

HS EQU 40H
CANT EQU 1; Cantidad de carácteres a ingresar

ORG 1000H
  STR DB ?

ORG 3000H; La hice subrutina porque la uso varias veces en el programa
  SETEAR: MOV BX, OFFSET STR
    MOV CL, CANT
    RET

ORG 2000H
  CALL SETEAR
  LAZO_INGRESO: INT 6
    INC BX
    DEC CL
    JNZ LAZO_INGRESO

  ;Primero, imprimir la cadena en el sentido en el que fue ingresada
  CALL SETEAR
  POLL_1: IN AL, HS+1
      AND AL, 1
      JNZ POLL_1
    MOV AL, [BX]
    OUT HS, AL
    INC BX
    DEC CL
    JNZ POLL_1

  ;Segundo, imprimir cadena en el sentido inverso
  DEC BX
  MOV CL, CANT
  POLL_2: IN AL, HS+1; Comprobar si no se está enviando nada por el HS
      AND AL, 1; Revisar el bit BUSY
      JNZ POLL_2; Si está ocupado, repetir la operación hasta que se desocupe
    MOV AL, [BX]
    OUT HS, AL
    DEC BX
    DEC CL
    JNZ POLL_2

  ;Terminar programa
  INT 0
  END

Respuesta: La diferencia con el punto 2c es que no hace falta activar por flanco ascendente un registro para que se impriman las letras, si no que en la impresora Handshake en modo CONSULTA DE ESTADO la operación estan
fácil como comprobar el ESTADO para ver si está enviando algo o no, y si no está BUSY, entonces pasar el dato por DATO para que se imprima.
