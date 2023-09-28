PB EQU 31H
CB EQU 33H

ORG 1000H
  STR DB "CARÁCTER INVÁLIDO "
  CARACTER DB ?

ORG 3000H
  COMPROBAR: PUSH BX
  PUSH AX
    CMP BYTE PTR [BX], 'O'
    JNS SKIP
    CMP BYTE PTR [BX], '7'
    JZ SEGUNDA
    JNS SKIP
  SEGUNDA: SUB AH, '0'
    MOV AL, AH; Pasamos el dato
    MOV CH, 1
    MULT: CMP AH, 0
      JZ SEND_LED
      ADD CH, CH
      DEC AH
      JMP MULT
    SEND_LED: MOV AL, CH
      OUT PB, AL
    JMP TERMINAR
  SKIP: MOV BX, OFFSET STR
    MOV AL, OFFSET CARACTER - OFFSET STR
    INT 7
  TERMINAR: POP AX
  POP BX
  RET

ORG 2000H
  ;Configurar el puerto de luces
  MOV AL, 0
  OUT CB, AL; Puerto configuración luces
  ;Dirección para retonar el carácter
  MOV BX, OFFSET CARACTER
  ;Lazo
  LOOP: INT 6
    MOV AH, [BX]; Pasar dato a AH
    CALL COMPROBAR;
  JMP LOOP

  INT 0
  END
