EOI EQU 20H
IMR EQU 21H
INT0 EQU 24H
ID_F10 EQU 10
LETRA_A EQU 41H
LETRA_Z EQU 5AH

ORG 1000H
LETRA DB 41H; Inicializar celda en 41h (A)

ORG 3000H
HANDLER_F10: NOP
MOV BX, OFFSET LETRA; Pasarle a BX la dirección de LETRA
MOV AL, 1; Leer 1 solo carácter
INT 7; IMPRIMIRLO
MOV AL, 20H
OUT EOI, AL; Decirle a EOI que la interrupción terminó
IRET

ORG 2000H
CLI; Deshabilitar interrupciones
MOV AL, ID_F10; Pasarle a INT0 la dirección de la subrutina
OUT INT0, AL
MOV AL, 0FEH; (1111 1110)
OUT IMR, AL; Mascaras
MOV BX, 40
MOV WORD PTR [BX], HANDLER_F10; Pasar la dirección de la subrutina
STI; Habilitar interrupciones

LOOP: NOP
  CMP LETRA, LETRA_Z; Si lo que está contenido en CX no es igual que 5A...
  JNZ NO_CAMBIO
  MOV LETRA, LETRA_A
  JMP LOOP
  NO_CAMBIO: INC LETRA
JMP LOOP
INT 0
END
