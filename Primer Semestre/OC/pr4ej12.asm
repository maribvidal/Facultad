ORG 1000H
DIR DB ?
NUM DB -4

ORG 2000h
MOV BX, OFFSET DIR
MOV AL, NUM
MOV CL, 0; Para hacer el AND y verificar si el NUM es par o no
LAZO: NOP
 MOV CL, AL; Mover al registro C-bajo lo que está contenido en A-bajo (el número)
 AND CL, 1b; Ver si es par o no
 JZ : PAR; Si la operación dió Z=1 es porque el NUM es PAR
 JNZ : IMPAR; Si no, es porque es IMPAR
  PAR: SUB AL, 7; Si es par, hay que restarle 7
   JMP CONT; Skipear la línea de abajo
  IMPAR: ADD AL, 5; Si es impar, hay que sumarle 5
 CONT: CMP AL, 0; Comparar si AL (NUM) es igual a 0
 JZ : FINAL; Si el NUM es 0, entonces terminar
 MOV [BX], AL; Mover el NUM a la dirección apuntada por el registro BX
 INC BX; Incrementar la dirección
 JMP LAZO; Repetir
FINAL: HLT
END
