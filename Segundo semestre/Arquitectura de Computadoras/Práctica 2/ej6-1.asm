;Mucho mejor
ORG 1000H
MSJ1 DB "INGRESE UN NUMERO: "
MSJ2 DB "ERROR"
FIN DB ?

ORG 1500H
NUM DB ?; Dirección de memoria reservada para guardar numeros

ORG 4000H; Esta subrutina comprueba que el carácter sea un dígito
COMPROBAR: CMP BYTE PTR [BX], 30H
JC NO_ES
CMP BYTE PTR [BX], 39H
JZ SI_ES
JNC NO_ES
SI_ES: MOV CL, 0FFH
JMP TERMINAR
NO_ES: MOV CL, 00H
TERMINAR: RET

ORG 3500H; Esta subrutina imprime el número en letras
IMPRIMIR: MOV AX, 1
MOV BX, OFFSET NUM; Imprimir número
INT 7
RET

ORG 3000H
INGRESAR: MOV BX, OFFSET MSJ1; Primer mensaje
MOV AL, OFFSET MSJ2 - OFFSET MSJ1; Pasar su longitud
INT 7; Imprimirlo
MOV BX, OFFSET NUM; Pasar la dirección para guardar el número
INT 6; Pedirle al usuario que ingrese un número
CALL COMPROBAR; Pasar código a BX como referencia
CMP CL, 0
JZ NO_VALIDO; Si CL es igual a 0, es porque el carácter ingresado no era un número
CALL IMPRIMIR
CMP BYTE PTR [BX], 30H
JNZ PASAR1
MOV DH, 1; Settear DL en 1
PASAR1: NOP
JMP FINAL
NO_VALIDO: MOV BX, OFFSET MSJ2
MOV AL, OFFSET FIN - OFFSET MSJ2
INT 7
MOV CL, NUM; Pasar el número a CL
FINAL: RET

ORG 2000H
MOV BX, 0
MOV CX, 0
MOV DH, 0; Settearlo en 0
MOV DL, 2; Terminar el programa al ejecutar dos veces el número 0
BUCLE: CMP DL, 0
JZ CHAU; Si se leyó 2 veces cero, terminar el programa
CALL INGRESAR
CMP DH, 1
JNZ BUCLE
DEC DL; Decrementar si se leyó un 0 la última vez
MOV DH, 0; Settearlo de vuelta en 0
JMP BUCLE
CHAU: INT 0
END
