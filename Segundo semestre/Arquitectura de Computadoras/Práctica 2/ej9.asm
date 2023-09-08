ORG 1000H
MSJ1 DB "INGRESE UNA CONTRASEÑA: "
MSJ2 DB "ACCESO PERMITIDO"
MSJ3 DB "ACCESO DENEGADO"
CLAVE DB "TQBF"
FIN DB ?

ORG 1500H
CARACTER DB ?; Reservar celdas de memoria para guardar la contraseña
         DB ?
         DB ?
         DB ?

ORG 3000H
INGRESAR_CONT: MOV BX, OFFSET CARACTER
               MOV CL, 4
        BUCLE: CMP CL, 0
               JZ TERMINAR_1
               INT 6
               INC BX
               DEC CL
               JMP BUCLE
  TERMINAR_1: RET

ORG 3200H
VERIFICAR_CONT: MOV CL, 4
                MOV AH, 0
                MOV CH, 0
BUCLE_2: CMP CL, 0
         JZ PASAR_2
         MOV BX, OFFSET CLAVE; Obtener dir
         ADD BL, CH
         MOV DL, [BX]
         MOV BX, OFFSET CARACTER
         ADD BL, CH
         MOV DH, [BX]
         CMP DH, DL
         JNZ PASAR
         INC AH
PASAR:   INC CH
         DEC CL
         JMP BUCLE_2
PASAR_2: CMP AH, 4
         JNZ PASAR_3
         MOV BX, OFFSET MSJ2
         MOV AL, OFFSET MSJ3 - OFFSET MSJ2
         INT 7
         JMP TERMINAR_2
PASAR_3: MOV BX, OFFSET MSJ3
         MOV AL, OFFSET CLAVE - OFFSET MSJ3
         INT 7
TERMINAR_2: RET

ORG 2000H
PUSH BX; Vamos a usar estos registros, pushearlos a la pila por las dudas
PUSH CX;
PUSH DX
PUSH AX
MOV BX, OFFSET MSJ1
MOV AL, OFFSET MSJ2 - OFFSET MSJ1
INT 7
CALL INGRESAR_CONT
CALL VERIFICAR_CONT
POP AX
POP DX
POP CX
POP BX
INT 0
END
