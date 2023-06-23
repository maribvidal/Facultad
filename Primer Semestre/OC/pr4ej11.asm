ORG 1000H
DIR DB ?; TABLA que comience a partir de DIR
MAX DB 21; Hasta MAX

ORG 2000H
MOV CL, MAX; Asignarle a CL el MAX - Este registro va a almacenar el máximo
MOV DL, 0; Inicializar DL en 0 - Este registro va a tener los múltiplos de 5
MOV BX, OFFSET DIR; Darle a BX la dirección de DIR - Este registro va a almacenar las direcciones
MAXIMO: MOV [BX], DX; Asignar DX a la dirección que contiene BX
 MOV AL, 0; Inicializar AL en 0 - Este registro va a servir como acumulador temporal
 INC BX; Pasar a la siguiente dirección de la tabla
 CINCO: INC AL; Sumar 5 a AL
  INC DL; Incrmentar DL
  CMP AL, 5; AL - 5
  JNZ : CINCO; Repetir hasta que AL sea igual a 5
 CMP DL, CL; DL - CL (MAX). Esto servirá para ver si se alcanzó el máximo
 JS : MAXIMO; Si el último valor es NEGATIVO, es porque AL no es ni igual ni mayor a CL, y por lo tanto, no se alcanzó el máximo
HLT
END
