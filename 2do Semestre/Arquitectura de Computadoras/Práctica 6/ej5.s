.data
	dir_control: .word32 0x10000
	dir_data: .word32 0x10008
	base: .double 0; Base flotante
	exponente: .word 0; Entero sin signo
	resultado: .double 0; Resultado flotante
.code
	;INICIALIZAR PILA y APILAR DIRECCIONES
	daddi $sp, $0, 0x400
	lwu $t0, dir_control($0)
	lwu $t1, dir_data($0)
	daddi $sp, $sp, -16
	sd $t0, 0($sp); Guardamos el dir_control en 0x3F0
	sd $t1, 8($sp); Guardamos el dir_data en 0x3F7
	
	;EN EL PROGRAMA PRINCIPAL...
	l.d f1, base($0); Inicializar registro flotante para la base
	l.d f2, resultado($0); Inicializar registro flotante para el resultado

	;Solicitar ingreso de la base flotante
	ld $s0, 0($sp); Cargar dir_control en S0
	ld $s1, 8($sp); Cargar dir_data en S1
	daddi $t2, $0, 8; Código de control para ingresar numeros
	sd $t2, 0($s0);   Enviar código
	l.d f1, 0($s1);    Recibir input en el registro f1
	
	;Solicitar exponente (entero sin signo)
	daddi $t2, $0, 8; Código de control para ingresar numeros
	sd $t2, 0($s0)
	ld $a1, 0($s1);   Recibir input en el registro s1

	;Guardar numeros
	s.d f1, base($0);       Guardar base
	sd $a1, exponente($0); Guardar exponente
	
	;Llamar subrutina
	jal a_la_potencia

	;Guardar resultado y terminar programa
	s.d f1, resultado($0)
	daddi $sp, $sp, 16
	halt

;SUBRUTINAS
a_la_potencia:	ld $s0, 0($sp)
		ld $s1, 8($sp)
		;Conversión de entero a punto flotante
		mtc1 $a1, f2
		cvt.d.l f2, f2
		beqz $a1, caso_cero
	lazo:	mul.d f1, f1, f2; Multiplicar base con exponente
		daddi $a1, $a1, -1; Usar A1 como contador hasta 0
		bnez $a1, lazo;     Mientras no llegue a 0, repetir operación
		j terminar
	caso_cero:	daddi $t1, $0, 1
			mtc1 $t1, f1
			cvt.d.l f1, f1
		;Mostrar resultado en la terminal
	terminar: daddi $t0, $0, 3;   Código de impresión de número flotante
		s.d f1, 0($s1);      Guardar número flotante en dir_data
		sd $t0, 0($s0);     Enviarle código de impresión a dir_control
		jr $ra
