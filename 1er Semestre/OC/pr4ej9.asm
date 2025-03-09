ORG 1000H
TABLA DB 2,4,6,8,10,12,14,16,18,20
FIN DB ?
TOTAL DB ?
MAX DB 13

ORG 2000H
MOV AL, 0
MOV CL, OFFSET FIN - OFFSET TABLA
MOV BX, OFFSET TABLA
MOV DL, 0; Inicializar el registro DL en 0 para guardar la cant. elementos <= MAX
LEER_TAB: MOV AL, [BX]; Mover lo que está guardado en la dirección BX en AL
 CMP AL, MAX; Número de AL - Número MAX
 JZ CERO
 JNZ NO_CERO
CERO: JMP ACT1; Si AL - MAX = 0, entonces ir a ACT1
NO_CERO: NOP
 JC ACT1; Si AL < MAX, entonces ir a ACT1
 JNC ACT2; Si no, ir a ACT2
ACT1: INC DL; Incrementar cantidad de elementos de TABLA menor o iguales a MAX
ACT2: INC BX;
 DEC CL; Decrementar la cantidad de elementos que quedan por leer
 JNZ LEER_TAB; Si aún no se leyó toda la TABLA, seguir leyendo
MOV TABLA, DL; Mover lo acumulado en el registro DL a la dirección etiquetada como TOTAL
HLT
END
