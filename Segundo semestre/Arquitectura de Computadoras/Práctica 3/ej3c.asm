;Constantes
HS EQU 40H
PIO EQU 30H
PIC EQU 20H
ID_HS EQU 10

ORG 40
  DW RUT_HS

ORG 1000H
  STR DB "INGENIERIA E INFORMATICA"
  FIN DB ?

ORG 3000H
  RUT_HS: MOV AL, [BX]
    OUT HS, AL
    INC BX
    DEC CL
    JNZ VUELVO
      MOV AL, 0FFH
      OUT PIC+1, AL; Deshabilitar que HandShake vuelva a interrumpir
    VUELVO: MOV AL, 20H
      OUT PIC, AL; Pasarle 20h a EOI
    IRET

ORG 2000H
  MOV BX, OFFSET STR
  MOV CL, OFFSET FIN - OFFSET STR
  
  CLI
    MOV AL, 0FBH; 1111 1011
    OUT PIC+1, AL; IMR
    MOV AL, ID_HS
    OUT PIC+6, AL; INT 2 = HandShake
    IN AL, HS+1
    OR AL, 80H
    OUT HS+1, AL; Poner como 1 el bit de I (Ixxxxxxx)
  STI

  LOOP: CMP CL, 0
    JNZ LOOP
  
  INT 0
  END
