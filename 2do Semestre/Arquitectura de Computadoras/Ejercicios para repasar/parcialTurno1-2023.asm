PA EQU 30H
PB EQU 31H
CA EQU 32H
CB EQU 33H

ORG 1000H
  MSJ DB "Arquitectura de Computadoras"
  MSJ2 DB "Fin del programa"
  LLAVES_ACT DB ?

ORG 3000H; Esta subrutina tiene que pasarle los bits de las llaves a las luces de manera invertida, en el caso de que los bits de las llaves hayan cambiado
  SUB_A: PUSH AX
    IN AL, PA
    CMP AL, LLAVES_ACT; Comprobar si cambió el estado de las llaves
    JZ SKIP_A
      MOV LLAVES_ACT, AL
      NOT AL; Invertirlo
      OUT PB, AL; Pasarlo a las luces invertido
    SKIP_A: POP AX
    RET

ORG 3100H; Esta subrutina tiene que mostrar el mensaje MSJ en pantalla solo si la primera llave está encendida
  SUB_B: PUSH AX
    IN AL, PA
    AND AL, 1; Hacer un AND con el primer bit de la cadena
    JZ SKIP_B
      MOV BX, OFFSET MSJ
      MOV AL, OFFSET MSJ2 - OFFSET MSJ
      INT 7
    SKIP_B: POP AX
    RET

ORG 3200H; Esta subrutina tiene que terminar el programa solo si todas las llaves están apagadas
  SUB_C: PUSH AX
    IN AL, PA
    AND AL, 0FFH; Comprobar si todas las llaves están apagadas
    JNZ SKIP_C
      MOV BX, OFFSET MSJ
      MOV AL, OFFSET LLAVES_ACT - OFFSET MSJ
      INT 7
      POP AX
      INT 0 
    SKIP_C: POP AX
    RET

ORG 2000H
  MOV AL, 0FFH
  OUT CA, AL
  MOV AL, 00H
  OUT CB, AL
  LOOP: CALL SUB_A
    CALL SUB_B
    CALL SUB_C
  JMP LOOP
END
