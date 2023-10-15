a) ¿Qué instrucción está generando atascos (stalls) en el cauce (ó pipeline) y por qué?
  La tercera instrucción está generando atascos ya que intenta guardar en memoria un registro que está siendo utilizado (RAW).
  La segunda instrucción quiere guardar el contenido de la variable B (2) en R2, y la siguiente instrucción quiere acceder a este valor
  para así guardarlo en la variable de memoria A, pero como el ciclo de instrucción está segmentado, para acceder a dicho dato primero
  tiene que esperar a que la segunda instrucción guarde el valor en el registro (etapa WriteBack), cosa que produce que hayan
  2 ciclos de penalización.

- ¿Qué tipo de ‘stall’ es el que aparece?
Aparece un atasco tipo RAW

- ¿Cuál es el promedio de Ciclos Por Instrucción (CPI) en la ejecución de este programa bajo esta configuración?
Hay un CPI de 2,2 sin el forwarding activado ((5 instr. + 4 + 2 atascos) / 5 instr.)

b) ¿Por qué no se presenta ningún atasco en este caso? Explicar la mejora.
  En esta versión del programa no se produce ningún atasco ya que se utiliza el Forwarding, una técnica de hardware que
  utiliza registros temporales en EX y MEM (si es LD) para pasar los datos a otras instrucciones de manera mas rápida.
  
- ¿Qué indica el color de los registros en la ventana Register durante la ejecución?
  Indica donde se está llevando a cabo el Forwarding específicamente.
  
- ¿Cuál es el promedio de Ciclos Por Instrucción (CPI) en este caso? Comparar con el anterior.
  Es de 1,8 CPI (solo ocurren 9 ciclos y 5 instrucciones gracias al Forwarding)
