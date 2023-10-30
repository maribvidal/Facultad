.data
	caracter: .ascii "A"
	vocales: .asciiz "AEIOUaeiou"
	cadena: .asciiz "hola mundo"; Ambas cadenas tienen longitud 10
	long: .word 10
.code
	daddi $sp, $zero, 0x400;Inicializar pila porque la vamos a utilizar
	lbu $a0, cadena($zero); Pasar cadena
	ld $a1, long($zero);    Pasar longitud
	jal contarVoc
	halt

contarVoc: daddi $sp, $sp, -8
	   sd $ra, 0($sp); Guardar dirección en la pila
	   daddi $t2, $zero, 0; Desplazador
	   daddi $v1, $zero, 0; Usar para contar las vocales en la cadena pasada
	lazo: lbu $a0, cadena($t2); Pasar carácter
	      jal esVocal
	      beqz $v0, pasar
		daddi $v1, $v1, 1
	pasar: daddi $t2, $t2, 1
	       bne $t2, $a1, lazo; Si aún no se recorrió toda la cadena...
	       ld $ra, 0($sp)
	       daddi $sp, $sp, 8
	       jr $ra

esVocal: daddi $t1, $zero, 0; Esta subrutina utiliza los registros T1, A1, A2, A3, y V0
	lazo2: lbu $a3, vocales($t1); Cargar cadena de vocales
		bne $a0, $a3, saltar; Comparar la vocal pasada por param. con la de la lista de vocales
		j loes
	saltar: daddi $t1, $t1, 1
		bne $t1, $a1, lazo2; Fijarse si terminó de recorrerse la cadena
		j noes
	loes: daddi $v0, $zero, 1
		j terminar
	noes: daddi $v0, $zero, 0
	terminar: jr $ra
