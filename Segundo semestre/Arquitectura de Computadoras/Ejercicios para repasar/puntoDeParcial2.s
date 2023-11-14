;Escribir un programa que permita ingresar 5 caracteres por teclado, 
;mostrando el mensaje "Ingrese 5 caracteres a buscar en la cadena"
; por cada uno de ellos debe invocar a una subrutina ULTPOS que recibe 
;la dirección de comienzo de la cadena y el carácter ingresado, 
;la misma debe devolver la última posición del carácter en la cadena, si no existe devolver -1
; los valores retornados se deben almacenar en una tabla en memoria.
.data
    cadena: .asciiz "En esta cadena busco la ultima ocurrencia de un caracter"
    mensaje: .asciiz "Ingrese 5 caracteres a buscar en la cadena "
    CONTROL: .word32 0x10000
    DATA: .word32 0x10008
    tabla: .word 0
.code
    ;REGISTROS A SALVAGUARDAR
    lwu $s6, CONTROL($0)
    lwu $s7, DATA($0)
    daddi $s5, $0, 9; - Código de control para pedir una tecla
    daddi $s4, $0, 4; - Código de control para imprimir una cadena
    daddi $s3, $0, 0

    ;IMPRIMIR MENSAJE
    daddi $t0, $0, mensaje
    sd $t0, 0($s7)
    sd $s4, 0($s6)

    ;INGRESAR 5 CARÁCTERES
    daddi $s2, $0, 5; - Cuantos carácteres hay que leer
lazo2:    daddi $a1, $0, cadena
    sd $s5, 0($s6)
    lbu $a0, 0($s7); - Guardar carácter en A0
    jal ULTPOS
    sd $v0, tabla($s3); - Guardar valor en la tabla
    daddi $s2, $s2, -1
    daddi $s3, $s3, 8; - Pasar al próximo lugar de memoria
    bnez $s2, lazo2; - Terminar el programa cuando $S2 sea igual a 0
    halt

;Subrutina que recibe la dirección de comienzo de la cadena en A1
;y el carácter ingresado en A0
ULTPOS:    daddi $v0, $0, -1; - Inicializar V0 en -1 por si no existe
    daddi $t5, $0, 56
lazo:    lbu $t0, 0($a1)
    bne $t0, $a0, saltar; - Si los carácteres no son iguales, saltar
        daddi $v0, $a1, 0; - Si lo son, guardar POS
saltar:    daddi $a1, $a1, 1
    daddi $t5, $t5, -1
    bnez $t5, lazo; - Leer cadena hasta que la letra sea un 0
    jr $ra
