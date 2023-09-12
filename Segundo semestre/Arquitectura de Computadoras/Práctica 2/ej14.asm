;Constantes
PIC EQU 20H
TIMER EQU 10H
ID_F10 EQU 10
ID_CLK EQU 11
VECES EQU 5; Veces que se quiera apretar F10 para detener el contador

ORG 40; Enlazar subrutina a la interrupción
  DW RUT_F10

ORG 44; Enlazar subrutina a la interrupción
  DW RUT_CLK

ORG 1000H
  SEG DB ?

ORG 3000H
  RUT_F10: NOP
    INC CH; Incrementar CH
    MOV AL, 20H
    OUT PIC, AL; Notificarle al EOI que se terminó la interrupción
    IRET

ORG 3500H
  RUT_CLK: NOP
    
    MOV AL, 20H
    OUT PIC, AL
    IRET

ORG 2000H
CLI; DESHABILITAR INTERRUPCIONES
  ;Vamos a usar algunos registros
  PUSH BX
  PUSH CX
  PUSH DX
  MOV DX, 0; Habilitador y deshabilitador del TIMER en pantalla
  MOV DH, 1; Switch
  MOV CH, 0; Contador de F10s
  MOV CL, 0; Comprobador de CH
  ;Configuración del PIC
  MOV AL, 0FCH; (1111 1100)
  OUT PIC+1, AL; IMR
  MOV AL, ID_F10
  OUT PIC+4, AL; INT0 - F10
  MOV AL, ID_CLK
  OUT PIC+5, AL; INT1 - CLOCK
  MOV AL, 1
  OUT TIMER+1, AL; Inicializar registro COMP en 1
  MOV AL, 0
  OUT TIMER, AL; Inicializar registro CONT en 0
STI; VOLVER A HABILITAR INTERRUPCIONES
;Loop
LOOP: NOP
  CMP DH, 1;
  JNZ PASAR
    MOV DL, 1
    MOV DH, 0
    JMP PASAR_2
  PASAR: CMP DL, 1
    JNZ PASAR_2
    MOV DL, 0
    MOV DH, 1
  PASAR_2: CMP CH, VECES
    JNZ PASAR_3
    MOV CH, 0; Reiniciar CH
  PASAR_3: JMP LOOP
;Devolver registros
POP DX
POP CX
POP BX
INT 0
END
