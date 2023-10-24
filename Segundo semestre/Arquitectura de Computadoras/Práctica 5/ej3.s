 .data
  	base: .double 5.85
  	altura: .double 13.47
  	superficie: .double 0
  	dos: .double 2
 .code
  	l.d f1, base(r0)
  	l.d f2, altura(r0)
  	l.d f3, dos(r0)
  	mul.d f1, f1, f2
  	div.d f1, f1, f3
  	s.d f1, superficie(r0)
  	halt
