;No creo q esta sea la mejor forma de resolver el ejercicio, but whatever
;CONSTANTES
TIMER EQU 10H
PIC EQU 20H
EOI EQU 20H
ID_F10 EQU 10
ID_CLK EQU 11
CERO EQU 30H
SEIS EQU 36H
DIEZ EQU 3AH

ORG 40; Handler del interruptor del F10
  DW RUT_F10

ORG 44; Handler del interruptor del TIMER
  DW RUT_CLK

ORG 1000H
NUM DB ?
MSJ DB "INGRESE UN NUMERO: "
MSJ2 DB "PRESIONE F10 PARA INICIAR O DETENER EL CONTEO / "
SEG DB 30H
    DB 30H
    DB 7CH; Espacio

ORG 3000H
  RUT_F10: INC CL; Incrementar CL
  CMP CL, 1; Restar CL con 1
    JNZ PASAR_3
    MOV CL, 0
      CMP CH, 1; Restar CH con 1
      JNZ PASAR_2
        MOV CH, 0; Switch
        MOV DL, 1
        ;RECIBIR UN NÚMERO DEL USUARIO
        MOV BX, OFFSET MSJ; Mensaje
        MOV AL, OFFSET MSJ2 - OFFSET MSJ; Longitud
        INT 7; Impresión
        MOV BX, OFFSET SEG+1; Dirección a donde recibir el número
        INT 6; Recibir
        MOV SEG, CERO; Inicializarlo en cero por las dudas
        ;IMPRIMIRLO
        MOV AL, 3
        MOV BX, OFFSET SEG
        INT 7; Imprimir
        ;SETEAR RELOJ
        MOV AL, 0
        OUT TIMER, AL
        JMP PASAR_3
      PASAR_2: CMP DL, 1
      JNZ PASAR_3
        MOV CH, 1; Switch
        MOV DL, 0
        JMP PASAR_3
    PASAR_3: MOV AL, EOI
    OUT PIC, AL
    IRET

ORG 3500H
  RUT_CLK: NOP
  ;VERIFICAR SI SE PUEDE CONTAR
  CMP DL, 1
  JNZ CLK_PASAR2
      ;INCREMENTAR EL SEGUNDO DE LA IZQ.
      INC SEG+1
      CMP SEG+1, DIEZ
      JNZ CLK_PASAR
          ;SI LLEGÓ A DIEZ ENTONCES REINICIAR EL SEGUNDO E INCREMENTAR EL PRIMER SEG
          MOV SEG+1, CERO
          INC SEG; Incrementar el primer SEG
          CMP SEG, SEIS
          JNZ CLK_PASAR
              ;SI EL SEGUNDO SEG LLEGÓ A SEIS ENTONCES REINICIARLO
              MOV SEG, CERO
              JMP CLK_PASAR; Saltar a la etiqueta
  ;PASAR DE LARGO
  CLK_PASAR: MOV AL, 3; Leer 3 celdas
  MOV BX, OFFSET SEG; Comenzar a leer desde la dir. de SEG
  INT 7
  ;REINICIAR CONT
  MOV AL, 0
  OUT TIMER, AL
  CLK_PASAR2: NOP ;TERMINAR INTERRUPCIÓN
  MOV AL, EOI
  OUT PIC, AL
  IRET

ORG 2000H
CLI
  ;VAMOS A USAR ESTOS REGISTROS
  PUSH CX;
  PUSH BX;
  PUSH AX;
  PUSH DX
  ;INICIALIZAR CX Y DX
  MOV CX, 0100h
  MOV DX, 0
  ;LEER MENSAJE 2
  MOV BX, OFFSET MSJ2
  MOV AL, OFFSET SEG - OFFSET MSJ2
  INT 7
  ;RESTO DEL PROGRAMA
  MOV AL, 0FCH
  OUT PIC+1, AL; IMR
  MOV AL, ID_F10
  OUT PIC+4, AL; 24h - INT0
  MOV AL, ID_CLK
  OUT PIC+5, AL; 25h - TIMER
  MOV AL, 1
  OUT TIMER+1, AL; Inicializar registro COMP en 1
  MOV AL, 0
  OUT TIMER, AL; Inicializar registro CONT en 0
  MOV BX, OFFSET SEG
STI
;LOOP
LOOP: JMP LOOP
;DEVOLVER REGISTROS
POP DX
POP CX
POP BX
POP AX
INT 0
END
