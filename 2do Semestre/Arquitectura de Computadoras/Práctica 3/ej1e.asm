PIO EQU 30H
PIC EQU 20H
TIMER EQU 10H
ID_CLK EQU 10

ORG 40; Dirección que le asignamos al vector de interrupción del TIMER
  DW RUT_CLK

ORG 1000H; Forma mas fácil
  PATRON DB 01H
         DB 02H
         DB 04H
         DB 08H
         DB 10H
         DB 20H
         DB 40H
         DB 80H
  
ORG 3000H
  RUT_CLK: NOP
  ;Obtener los bits del patrón
  CMP DH, 1
  JZ ATRA
    MOV DL, [BX]
    CMP DL, 80H
    JNZ SALTAR
      MOV DH, 1; Setear DH a 1 para bajar 
      JMP SALTAR_2
    SALTAR: INC BX; Incrementar dirección de BX para acceder al próximo patrón
      JMP SALTAR_2
ATRA: DEC BX
      CMP BX, OFFSET PATRON; Ver si BX llegó a la primera dirección...
      JNZ SEGUIR
        MOV DH, 0; Setear DH a 0 para subir
        JMP SALTAR_2
      SEGUIR: MOV DL, [BX]
      JMP SALTAR_2
SALTAR_2: MOV AL, DL
  OUT PIO+1, AL
  MOV AL, 0
  OUT TIMER, AL; Resetear CONT
  ;Avisar a la CPU que se terminó la interrupción
  MOV AL, 20H
  OUT PIC, AL; Al EOI
  IRET

ORG 2000H
CLI
;Registros
MOV BX, OFFSET PATRON; Obtener los patrones
MOV DX, 0; Setear DX en 0
;Configuración de las luces
MOV AL, 0
OUT PIO+3, AL; Pasárselo al CB
OUT PIO+1, AL; Pasárselo al PB
;Configuración del PIC
MOV AL, 0FDH
OUT PIC+1, AL
MOV AL, ID_CLK
OUT PIC+5, AL
MOV AL, 1
OUT TIMER+1, AL
MOV AL, 0
OUT TIMER, AL
STI

LOOP: JMP LOOP

INT 0
END
