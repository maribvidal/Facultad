;CONSTANTES
PA EQU 30H; Para las llaves
PB EQU 31H; Para las luces
CA EQU 32H; Configuración de entrada de llaves
CB EQU 33H; Configuración de salido de luces
PIC EQU 20H
ID_F10 EQU 11

ORG 44
  DW RUT_F10

;VARIABLES
ORG 1000H
  CHAR DB ?

;SUBRUTINAS
;Configurar el PIO
ORG 3000H
  CONF_PIO: MOV AL, 01H
  OUT CA, AL
  MOV AL, 00H
  OUT CB, AL
  RET

;Consultar estado de la impresora
ORG 3100H
  POLL: IN AL, PA
  AND AL, 1; Comprobar si el primer bit de la cadena es 1 o 0 (es el bit de BUSY)
  JNZ POLL; Si el bit es 1, es porque la impresora sigue ocupada y hay que esperar
  RET

;Handler del F10
ORG 3200H
  RUT_F10: MOV BX, OFFSET CHAR; Setear BX en la primera dirección de la cadena
  ;Loopear sección del código hasta que CL valga 0 (lo que significa que se acabaron de leer letras)
  LAZO: CALL POLL
    MOV AL, [BX]
    OUT PB, AL
    CALL STROBE; Imprimir la letra
    INC BX
    DEC CL; Decrementar contador
  JNZ LAZO
  ;Terminar interrupción
  MOV BX, OFFSET CHAR
  MOV AL, 20H
  OUT PIC, AL; Avisarle a la CPU que terminó la interrupción
  IRET

;Ingresar letras
ORG 3300H
  INGR_LETRA: INC CL; Incrementar contador
  INT 6; Retornar la letra en la dirección actual de BX
  INC BX; Incrementar la dirección de BX
  RET

;Strobe de la impresora
ORG 3400H
  STROBE: IN AL, PA
  AND AL, 0FDH
  OUT PA, AL
  IN AL, PA
  OR AL, 02H
  OUT PA, AL
  RET

;PROGRAMA PRINCIPAL
ORG 2000H
  CLI; DESHABILITAR INTERRUPCIONES
    CALL CONF_PIO; Configurar la impresora PIO
    MOV BX, OFFSET CHAR; Pasar a BX la dirección para leer carácteres
    MOV CX, 0; Usar registro para ir guardando la cantidad de carácteres leídos
    MOV AL, 0FEH
    OUT PIC+1, AL; IMR
    MOV AL, ID_F10
    OUT PIC+4, AL; F10
  STI; HABILITAR INTERRUPCIONES

;Loop
LOOP: CALL INGR_LETRA; Ingresar letra
JMP LOOP

;Terminar programa
INT 0
END
