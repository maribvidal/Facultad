PA EQU 30H
PB EQU 31H
CA EQU 32H
CB EQU 33H

ORG 1000H
  MSJ DB "FIN DEL PROGRAMA"
  CHAR DB ?
  CADENA DB ?

ORG 3000H
  CONF_PIO: MOV AL, 01H
    OUT CA, AL
    MOV AL, 00H
    OUT CB, AL
    RET

ORG 3100H
  CONSULTA: IN AL, PA
    AND AL, 1
    JNZ CONSULTA
    RET

ORG 3200H
  STROBE: IN AL, PA
    AND AL, 0FDH; xxxx xx0x poner el S en 0
    OUT PA, AL
    IN AL, PA
    OR AL, 02H; xxxx xx1x poner el S en 1
    OUT PA, AL
    RET

ORG 3300H
  SUB_R: PUSH BX
  PUSH AX
  LEER_AG: MOV BX, OFFSET CHAR
    IGNORAR_R: INT 6
    CMP BYTE PTR [BX], 'r'
    JZ IGNORAR_R
    CMP BYTE PTR [BX], 'i'
    JZ IGNORAR_R
    CMP BYTE PTR [BX], 's'
    JZ IGNORAR_R
    CMP BYTE PTR [BX], '.'
    JZ TERMINAR_R
      MOV DL, [BX]
      MOV BX, OFFSET CADENA
      ADD BX, CX; Sumar índice
      MOV BYTE PTR [BX], DL; Pasar carácter de DL
      INC CX
      JMP LEER_AG
    TERMINAR_R: MOV DL, [BX]
      MOV BX, OFFSET CADENA
      ADD BX, CX
      MOV BYTE PTR [BX], DL
      INC CX
    POP AX
    POP BX
    RET

ORG 3400H
  SUB_I: PUSH BX
    PUSH AX
    CMP CX, 0
    JZ TERMINAR_I
    MOV BX, OFFSET CADENA
    LEER_I: CALL CONSULTA
      MOV AL, [BX]
      OUT PB, AL
      CALL STROBE
      INC BX
      DEC CX
      JNZ LEER_I
    TERMINAR_I: POP AX
    POP BX
    RET

ORG 3500H
  SUB_S: PUSH BX
    PUSH AX
    MOV BX, OFFSET MSJ
    MOV AL, OFFSET CHAR - OFFSET MSJ
    INT 7
    POP AX
    POP BX
    RET

ORG 2000H
  MOV CX, 0; Vamos a usar este registro de manera global
  CALL CONF_PIO; Configurar impresora PIO
  LEER: MOV BX, OFFSET CHAR
    INT 6; Dir. de mem. para leer inputs
    CMP BYTE PTR [BX], 'r'
    JZ HANDLER_R
    CMP BYTE PTR [BX], 'i'
    JZ HANDLER_I
    CMP BYTE PTR [BX], 's'
    JZ HANDLER_S
    JMP LEER; Si se leyó otro carácter, leer de nuevo
  HANDLER_R: CALL SUB_R
    JMP LEER
  HANDLER_I: CALL SUB_I
    JMP LEER
  HANDLER_S: CALL SUB_S
  INT 0
  END
