;Vamos a usar la impresora HANDSHAKE por método de INTERRUPCIÓN

HAND_DATO EQU 40H
HAND_ESTADO EQU 41H
PIC EQU 20H
INT2 EQU 26H
ID_HANDSHAKE EQU 9

ORG 36; 9 * 4
  DW RUT_HANDSHAKE

ORG 1000H
  STR DB "Dead Bug Daylight"
  FIN DB ?

ORG 3000H
  RUT_HANDSHAKE: MOV AL, [BX]
    OUT HAND_DATO, AL
    INC BX
    DEC CL
    MOV AL, 20H
    OUT PIC, AL; Avisarle a la CPU que la interrupción terminó
  IRET

ORG 2000H
  ;Configuración inicial
  MOV CL, OFFSET FIN - OFFSET STR; Pasar la cantidad de carácteres a leer
  MOV BX, OFFSET STR; Pasar a BX la dirección de inicio de la cadena
  IN AL, HAND_ESTADO; Obtener estado de la impresora
  OR AL, 10000000B; Forzar que el bit mas significativo (correspondiente al INT) se ponga en 1
  OUT HAND_ESTADO, AL; Devolverlo para establecer el modo INTERRUPCIÓN

  CLI
    MOV AL, 11111011B; Abrir canal del INT2 en el IMR (FD)
    OUT PIC+1, AL
    MOV AL, ID_HANDSHAKE; Pasar el ID del Handshake
    OUT INT2, AL; También PIC+6
  STI

  LOOP: CMP CL, 0; Loopear hasta que no hayan mas carácteres que imprimir
  JNZ LOOP

  ;Inhibir la capacidad de interrumpir del periférico Handshake
  MOV AL, 0FFH
  OUT PIC+1, AL
  
  ;Terminar programa
  INT 0
  END
