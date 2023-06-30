;Dada la frase "Organización y la Computación", 
;almacenada en la memoria, escriba un programa que determine
;cuantas letras ‘a’ seguidas de ‘c’ hay en ella.
ORG 1000H
CANTIDAD DB ?
INICIO DB "Organización y la Computación"; Lleva las letras en la tabla
FIN DB ?

ORG 2000h
MOV BX, OFFSET INICIO + 1; Asignarle a BX la dirección  inicial de la tabla (comenzando por las letras)
MOV AL, OFFSET INICIO - FIN; Calcular longitud de la tabla
MOV CL, 0; Guardar la cantidad de 'A's seguidas de 'C's
MOV DL, 0; Acumulador de los espacios sin A
RECORRER: NOP; Este módulo va a repetirse hasta que se haya leido toda la tabla
 CMP BYTE PTR [BX], 061h; Comprobar si es una 'a'
  JZ : SI_ES_A
  JNZ: INC DL
  JMP PASAR
  SI_ES_A: MOV DL, 0
 PASAR: NOP
 CMP BYTE PTR [BX], 063h; Comprobar si es una 'c'
  JNZ : PASAR2; Si no es 'c', entonces pasar de largo
  CMP DL, 0; Si DL es Z=1 entonces significa que A está al lado
   JNZ : PASAR2; En caso contrario, pasar de largo.
   INC CL
 PASAR2: NOP
 CMP BYTE PTR [BX], 043h; Comprobar si es una 'C'
  JNZ : PASAR3; Si no es 'C', entonces pasar de largo
  CMP DL, 0; Si DL es Z=1 entonces significa que A está al lado
   JNZ : PASAR3; En caso contrario, pasar de largo.
   INC CL
 PASAR3: NOP
 DEC AL; Sacarle un número 
 JZ : FINAL; Si ya no quedan mas elementos... terminar programa
 INC BX; Próxima dirección
 JMP RECORRER; LOOP
FINAL: HLT
END
