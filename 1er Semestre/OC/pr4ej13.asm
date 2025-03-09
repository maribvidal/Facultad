ORG 1000H
CANT DB ?
INICIO DB "Organización y la Computación"; Lleva las letras en la tabla
FIN DB ?

ORG 2000h
MOV BX, OFFSET INICIO; Asignarle a BX la dirección inicial de la tabla
MOV CL, 0; Guardar la cantidad de 'A's seguidas de 'C's
MOV DL, 0; Acumulador de los espacios sin A
RECORRER: NOP; Este módulo va a repetirse hasta que se haya leido toda la tabla
 MOV DH, [BX]; Mover la letra al registro DH
 CMP DH, 061h; Comprobar si es una 'a'
  JZ : SI_A
  INC DL
  JMP PASAR
  SI_A: MOV DL, 0
 PASAR: NOP
 CMP DH, 063h; Comprobar si es una 'c'
  JNZ : PASAR2; Si no es 'c', entonces pasar de largo
  CMP DL, 1; Si DL es Z=1 entonces significa que A está al lado
   JNZ : PASAR2; En caso contrario, pasar de largo.
   INC CL
 PASAR2: NOP
 CMP DH, 043h; Comprobar si es una 'C'
  JNZ : PASAR3; Si no es 'C', entonces pasar de largo
  CMP DL, 1; Si DL es Z=1 entonces significa que A está al lado
   JNZ : PASAR3; En caso contrario, pasar de largo.
   INC CL
 PASAR3: NOP
 CMP BX, OFFSET FIN; Sacarle un número 
 JZ : FINAL; Si ya no quedan mas elementos... terminar programa
 INC BX; Próxima dirección
 JMP RECORRER; LOOP
FINAL: MOV CANT, AL
HLT
END
