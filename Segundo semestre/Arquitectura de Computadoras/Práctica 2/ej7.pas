ORG 1000H
MSJ1 DB "INGRESE DOS DIGITOS: "
MSJ2 DB " + "
MSJ3 DB " = "
FIN DB ?

ORG 1500H
NUM DB ?; Reservar celda de memoria para guardar el número
    DB ?; Reservar celda de memoria para guardar el número 2

ORG 3000H
SUMA: MOV BX, OFFSET NUM
INT 6; Guardar primer dígito
MOV AL, 1
INT 7; Imprimirlo (solo para que se vea xd)
MOV CL, [BX]; Pasarlo al registro CL
MOV BX, OFFSET MSJ2
MOV AL, OFFSET MSJ3 - OFFSET MSJ2
INT 7; Imprimir cadena 2 ' + '
MOV BX, OFFSET NUM
INT 6; Guardar segundo dígito
MOV AL, 1
INT 7;
MOV CH, [BX]; Pasarlo a CH
MOV BX, OFFSET MSJ3
MOV AL, OFFSET FIN - OFFSET MSJ3
INT 7
SUB CL, '0'; Convertir número ASCII en número manejable en cuentas (reemplazar el '3' por un '0')
SUB CH, '0'; Lo mismo con el segundo
ADD CH, CL; Sumar los dígitos
MOV CL, 0; Dejarlo en 0
CMP CH, 0Ah; Si CH es menor que 10, se deduce que el número es de 2 digitos
JC UN_DIG
SUB CH, 0Ah; Sustraerle 10 al número
MOV CL, 1; A CL pasamos un '31', que vendría a ser el 1 que tiene cualquier número del 10 al 18
ADD CL, '0'; Copiado de Carlos Mogollon
UN_DIG: ADD CH, '0'; Poner un 3 ASCII adelante para que se pueda imprimir
MOV BX, OFFSET NUM
MOV BYTE PTR [BX], CL; Pasar el CL a la dirección NUM
INC BX; Incrementar la dirección de BX en 1 unidad
MOV BYTE PTR [BX], CH; Pasar el CL a la dirección NUM
MOV BX, OFFSET NUM; Dirección de inicio para imprimir
MOV AL, 2; Longitud de la cadena
INT 7; Lectura
RET

ORG 2000H
PUSH BX; Vamos a usar estos registros, pushearlos a la pila por las dudas
PUSH CX;
MOV BX, OFFSET MSJ1; Dirección de la primera celda del mensaje
MOV AL, OFFSET MSJ2 - OFFSET MSJ1; Longitud del mensaje
INT 7; Leer mensaje
CALL SUMA
POP CX; Recuperar registros como estaban antes de ejecutarse el programa
POP BX
INT 0
END
