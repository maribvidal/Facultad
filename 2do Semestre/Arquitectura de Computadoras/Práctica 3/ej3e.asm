HS EQU 40H
PIO EQU 30H
PIC EQU 20H
ID_HS EQU 10
CANT EQU 5; Cantidad de carácteres a ingresar

ORG 40
  DW RUT_HS

ORG 1000H
  STR DB ?

ORG 3000H; Subrutina para el HANDSHAKE
  RUT_HS: NOP
    MOV AL, [BX]
    OUT HS, AL
    CMP CH, 1; Si CH = 1 entonces imprimir de manera inversa
    JZ IMPR_INV
      INC BX
      DEC CL
      JNZ VOLVER
        MOV CH, 1; Modo impresión inverso
        MOV CL, CANT
        DEC BX; Comenzar a leer la cadena desde 1 dirección atrás
      JMP VOLVER
    IMPR_INV: DEC BX
      DEC CL
      JNZ VOLVER
    MOV AL, 0FFH
    OUT PIC+1, AL; IMR
  VOLVER: MOV AL, 20H
          OUT PIC, AL
  IRET

ORG 2000H
  MOV BX, OFFSET STR
  MOV CL, CANT
  LAZO_INGRESO: INT 6
    INC BX
    DEC CL
    JNZ LAZO_INGRESO

  CLI
    MOV AL, 0FBH
    OUT PIC+1, AL
    MOV AL, ID_HS
    OUT PIC+6, AL
    IN AL, HS+1
    OR AL, 80H
    OUT HS+1, AL

    MOV CH, 0; Modo impresión ordenado
    MOV BX, OFFSET STR
    MOV CL, CANT
  STI
  
  ;Primero, imprimir la cadena en el sentido en el que fue ingresada
  LOOP_1: CMP CL, 0
          JNZ LOOP_1

  ;Segundo, imprimir cadena en el sentido inverso
  LOOP_2: CMP CL, 0
          JNZ LOOP_2

  ;Terminar programa
  INT 0
  END
