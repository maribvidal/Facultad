 .data
  	peso: .double 120
  	estatura: .double 1.75
  	imc: .double 0
  	estado: .double 1
  	lim1: .double 18.5
  	lim2: .double 25
  	lim3: .double 30
  	uno: .double 1
 .code
  	;Inicializar registros
  	l.d f1, peso(r0)
  	l.d f2, estatura(r0)
  	l.d f3, imc(r0)
  	l.d f4, estado(r0) ; Comienza en 1
  	l.d f5, lim1(r0)
  	l.d f6, lim2(r0)
  	l.d f7, lim3(r0)
  	l.d f8, uno(r0)
  	;Obtener el IMC
    mul.d f2, f2, f2 ; (estatura * estatura)
  	div.d f1, f1, f2 ; (peso / estatura^2)
  	c.lt.d f1, f5    ; comprobar si el PESO es menor que 18.5
  	bc1t terminar
    		;Comprobar si el peso está dentro del rango NORMAL
    		add.d f4, f4, f8 ; Dejar ESTADO en 2
    		c.eq.d f1, f5 ; Comparar si es igual a 18.5
    		bc1t terminar
    		c.lt.d f1, f6 ; Comparar si es menor a 25
    		bc1t terminar
    	   		;Comprobar si el peso está dentro del rango SOBREPESO
      			add.d f4, f4, f8 ; Dejar ESTADO en 3
      			c.eq.d f1, f6 ; Comparar si es igual a 25
      			bc1t terminar
      			c.lt.d f1, f7 ; Comparar si es menor a 30
      			bc1t terminar
        				;No queda otra que el peso esté en el rango de OBESO
        				add.d f4, f4, f8 ; Dejar ESTADO en 4
  terminar:	s.d f3, imc(r0)
  s.d f4, estado(r0)
  halt
