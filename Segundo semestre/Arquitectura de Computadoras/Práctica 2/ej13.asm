TIMER EQU 10H; ID 10
PIC EQU 20H
EOI EQU 20H
N_CLK EQU 10
 
ORG 40
IP_CLK DW RUT_CLK
 
ORG 1000H
SEG DB 30H; "0" SEG
 DB 30H; "0" SEG+1
 DB 3AH; ":" SEG+2
 DB 30H; "0" SEG+3
 DB 30H; "0" SEG+4
 DB 7CH; "|" SEG+5
FIN DB ?
 
 ORG 3000H 
RUT_CLK: PUSH AX
 INC SEG+4; Incrementar el segundo contador
 CMP SEG+4, 3AH; Comparar si llegó a 10
     JNZ RESET; Resetear el TIMER
     MOV SEG+4, 30H;
     INC SEG+3; Incrementar TERCER SEG
CMP SEG+3, 36H; Si el tercer SEG llegó a 6 entonces
     JNZ RESET 
     MOV SEG+3, 30H; Reiniciarlo
     INC SEG+1; Incrementar SEGUNDO SEG
CMP SEG+1, 3AH; Comparar si el SEGUNDO SEG llegó a 10
    JNZ RESET
    MOV SEG+1, 30H; Reiniciarlo
    INC SEG; Incrementar PRIMER SEG
CMP SEG, 36H; Comprar si el PRIMER SEG llegó a 6
    JNZ RESET
    MOV SEG, 30H; Reiniciarlo
RESET: CMP DH, 0AH; Comprobar si ya pasaron 10 segundos
    JNZ NO_PASO
    INT 7; Si ya pasaron, imprimir tiempo
    MOV DH, 01H; Y resetearlo
    JMP SEGUIR
NO_PASO: INC DH; Incrementar un segundo
SEGUIR: MOV AL, 0; Setear el CONT en 0 para contar de vuelta
  OUT TIMER, AL 
  MOV AL, EOI; Notificarle al EOI que la interrupción terminó
  OUT PIC, AL 
  POP AX 
  IRET 
 
 ORG 2000H 
CLI
  MOV DH, 1; Para contar 10 segundos y visualizar los minutos (lo inicializo en 1 para que cuente exacto)
 MOV AL, 0FDH 
 OUT PIC+1, AL ; PIC: registro IMR 
 MOV AL, N_CLK 
 OUT PIC+5, AL ; PIC: registro INT1 
 MOV AL, 1
 OUT TIMER+1, AL ; TIMER: registro COMP
 MOV AL, 0 
OUT TIMER, AL ; TIMER: registro CONT
 MOV BX, OFFSET SEG 
 MOV AL, OFFSET FIN-OFFSET SEG 
STI
LAZO: JMP LAZO; loop
END
