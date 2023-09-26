;Escriba un programa que dada una cadena de carácteres almacenada en la memoria, 
;imprima a través de la impresora solamente sus carácteres cuyo código ASCII sea PAR, 
;en el orden en que aparecen. Para ello, deberá implementar y utilizar una subrutina
;SELECCIONADO que reciba un carácter como parámetro y devuelva verdadero (1)
;si el código del carácter es par y falso (0) de lo contrario. 
;Por ejemplo, la "A" no sería seleccionada porque su código ASCII es 65 (impar). 
;Por el otro lado, la "Z" si sería seleccionada porque su código ASCII es 90 (par). 
;El programa debe esperar a que se hayan enviado todos los carácteres a imprimir para finalizar.

;Vamos a usar el registro CH para devolver el VERDADERO o FALSO
;Vamos a usar la impresora HANDSHAKE por método de CONSULTA DE ESTADOS, ya que no especifica una

HAND_DATO EQU 40H
HAND_ESTADO EQU 41H

ORG 1000H
  STR DB "For what is a man? "
      DB "What has he got "
      DB "If not himself "
      DB "Then he has naught"
  FIN DB ?

ORG 3000H
  SELECCIONADO: AND DH, 1; Comprobar si la cadena es PAR o IMPAR
    JNZ IMPAR; Si la cadena es impar, entonces ni tenerla en cuenta
      MOV DL, 1; VERDADERO
      JMP SUB_END
    IMPAR: MOV DL, 0; FALSO
    SUB_END: RET; RETORNAR

ORG 2000H
  ;Guardar registros por si las moscas
  PUSH DX
  PUSH CX
  PUSH AX
  PUSH BX

  ;Configuración inicial
  MOV DX, 0; Inicializar registro para utilizar el DH como buffer de char y el DL como returner
  MOV CL, OFFSET FIN - OFFSET STR; Pasar la cantidad de carácteres a leer
  MOV BX, OFFSET STR; Pasar a BX la dirección de inicio de la cadena
  IN AL, HAND_ESTADO; Obtener estado de la impresora
  AND AL, 01111111B; Forzar que el bit mas significativo (correspondiente al INT) se ponga en 0
  OUT HAND_ESTADO, AL; Devolverlo para establecer el modo CONSULTA DE ESTADOS
  
  ;Loopear lazo hasta que se hayan enviado todos los carácteres
  POLLING: IN AL, HAND_ESTADO
    AND AL, 1
    JNZ POLLING; Si esto no devuelve cero, es porque la impresora sigue BUSY
  MOV DH, [BX]; Pasar carácter actual al buffer
  CALL SELECCIONADO
  CMP DL, 1
  JNZ SOLO_INC; Si DL no es 1 es porque el carácter no se debe imprimir
    MOV AL, [BX]; Pasar carácter a AL
    OUT HAND_DATO, AL; Enviar dato a la impresora
  SOLO_INC: INC BX; Leer el próximo carácter
    DEC CL; Decrementar contador
    JNZ POLLING; Si siguen habiendo carácteres para leer, continuar la operación

  ;Retornar registros pusheados inicialmente
  POP BX
  POP AX
  POP CX
  POP DX

  ;Terminar programa
  INT 0
  END
