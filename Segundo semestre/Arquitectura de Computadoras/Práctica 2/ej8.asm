ORG 1000H
MSJ1 DB "INGRESE DOS DIGITOS: "
MSJ2 DB " - "
MSJ3 DB " = -"
FIN DB ?

ORG 1500H
NUM DB ?; Reservar celda de memoria para guardar el número

ORG 3000H
RESTA: MOV BX, OFFSET NUM
INT 6; Guardar primer dígito
MOV AL, 1
INT 7; Imprimirlo (solo para que se vea xd)
MOV CL, [BX]; Pasarlo al registro CL
MOV BX, OFFSET MSJ2
MOV AL, OFFSET MSJ3 - OFFSET MSJ2
INT 7; Imprimir cadena 2 ' - '
MOV BX, OFFSET NUM
INT 6; Guardar segundo dígito
MOV AL, 1
INT 7;
MOV CH, [BX]; Pasarlo a CH
MOV BX, OFFSET MSJ3;
MOV AL, OFFSET FIN - OFFSET MSJ3
INT 7; Imprimir cadena 3 ' = '

;Cuentas
SUB CL, '0'; Convertir número ASCII en número manejable en cuentas (reemplazar el '3' por un '0')
SUB CH, '0'; Lo mismo con el segundo
SUB CL, CH; Restar los dígitos
MOV CH, 0; Dejarlo en 0
CMP CL, 00h
JZ PASAR; Si es cero, pasar de largo la siguiente sección

;Restarle 1 a CH e invertir los bits (hacer el opuesto al CA2 de binarios negativos)
DEC CL
NOT CL
ADD CL, '0'
JMP PASAR_2
PASAR: MOV CL, 0; Dejarlo en 0 pq la cuenta dió 0
ADD CL, '0'
PASAR_2: NOP
MOV BX, OFFSET NUM
MOV BYTE PTR [BX], CL; Pasar el CL a la dirección NUM
MOV AL, 1; Longitud de la cadena
INT 7; Lectura
RET

ORG 2000H
PUSH BX; Vamos a usar estos registros, pushearlos a la pila por las dudas
PUSH CX;
MOV BX, OFFSET MSJ1; Dirección de la primera celda del mensaje
MOV AL, OFFSET MSJ2 - OFFSET MSJ1; Longitud del mensaje
INT 7; Leer mensaje
CALL RESTA
POP CX; Recuperar registros como estaban antes de ejecutarse el programa
POP BX
INT 0
END
