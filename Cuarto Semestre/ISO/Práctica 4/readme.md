# Ejercicio 6
### (a) Realice los diagramas de Gantt según los siguientes algoritmos de scheduling
[Hoja de cálculo](https://docs.google.com/spreadsheets/d/1rxmSgNwxzugB7DQ9Fe_aHiM6E9D78--UGN95BRGPn3A/edit?usp=sharing)
### (d) En el algoritmo Round Robin, que conclusión se puede sacar con respecto al valor del quantum.
Por lo menos en esta situación, si se establece un valor de quantum grande, se consigue el mismo resultado que si se hubiera utilizado el algoritmo FCFS, ya que cada proceso se va a ir ejecutando en orden de llegada y se va a ejecutar por completo porque el quantum otorgado le alcanza.

# Ejercicio 7
### (a) Realice el diagrama del Gantt para este algoritmo según el lote de trabajos del ejercicio 6.
[Hoja de cálculo](https://docs.google.com/spreadsheets/d/1KqCfEb3Ngoa6Gx2WAsqJmpHz9hZCCRXnTGjO4707_z0/edit?usp=sharing)
### (b) ¿Nota alguna ventaja frente a otros algoritmos?
Comparado con el algoritmo SJB, es mejor porque le deja la CPU a un proceso muy corto que necesita pocas unidades de tiempo para terminar, lo que quizás sea bueno para manejar procesos ligados a la E/S o aquellos urgentes, pero sigue provocando inanición para los procesos largos.

# Ejercicio 8
### (a) Realice el diagrama de Gantt correspondiente al algoritmo de planificación por prioridades según las variantes:
1. No Apropiativa
2. Apropiativa

[Hoja de cálculo](https://docs.google.com/spreadsheets/d/1g2nj6y-acPJVsG_ahj_wyjgmJVidlUnGgIVtWKZoYCM/edit?usp=sharing)

# Ejercicio 10
### (a) Suponga que al lote de procesos del ejercicio 6 se agregan las siguientes operaciones de entrada salida:
[Hoja de cálculo](https://docs.google.com/spreadsheets/d/16MQVSV4hbolcSfarStXedemjES0PMjTXflutws6oNU8/edit?usp=sharing)

# Ejercicio 12
### (a) Analice el funcionamiento de este algoritmo mediante un ejemplo. Marque en cada instante en que cola se encuentran los procesos.
[Hoja de cálculo](https://docs.google.com/spreadsheets/d/1U2mOEu1kmJmUxUv89bciXkUbgpjy7g3aYU-WwUuysAE/edit?usp=sharing)

El Proceso 2 tiene que atender una operación del Dispositivo 1 en el instante 2 desde que se ejecuta,
por lo que sale de la CPU, se encola en la Cola del D1, y en su lugar se comienza a ejecutar el Proceso 3, que ya estaba esperando en la cola de listos su turno.

En el instante 6 global, llega el P4 a la Cola de Listos.

Cuando el P2 termina la operación, sale de la E/S, pero ahora en vez de encolarse en la Cola de Listos se encola en la Cola Auxiliar.
El P3 tiene que atender una operación en el D2 en el instante 3 desde que llega, y cuando se sale de la CPU, se ejecuta el P2 ya que
la Cola Auxiliar tiene prioridad sobre la Cola de Listos. El P2 solo se ejecuta 2 unidades de tiempo, ya que no pudo terminar su ráfaga
anterior por tener que atender una operación de E/S, y de esa ráfaga le quedaron 2 unidades de tiempo, ya que el Quantum es de 4 unidades.

Terminadas las dos unidades de tiempo se vuelve a encolar en la Cola de Listos. El próximo proceso a ejecutarse es el P3 que recien termina
la operación de E/S en el D2. Su ráfaga durará 1 unidad de tiempo porque en la ráfaga anterior estuvo 3 unidades de tiempo antes de irse.
### (b) Realice el ejercicio 10)a) nuevamente considerando este algoritmo, con un quantum de 2 unidades y Timer Variable
[Hoja de cálculo](https://docs.google.com/spreadsheets/d/1lQU_HVwoK_UFyqsGp1OmOrLnny7q9-zoNArHZKUGk_c/edit?usp=sharing)

# Ejercicio 16
### (a) Asumiendo que NO hay apropiación entre los procesos.
### (b) Asumiendo que hay apropiación entre los procesos.
[Hoja de cálculo](https://docs.google.com/spreadsheets/d/1QZSI9rkk1Oh5nbq9txGytI2HwW2561arMKQ3mnagQog/edit?usp=sharing)

# Ejercicio 17
### (a) Para los casos a y b del ejercicio 16 realice el diagrama de Gantt considerando además que se tiene un envejecimiento de 4 unidades.
[Hoja de cálculo](https://docs.google.com/spreadsheets/d/1QjVjIfmWmFuprfrnYFTIukFAf2rb8KGEDjUJt4hmuPQ/edit?usp=sharing)

# Ejercicio 25
### (a) Ejecute el esquema anterior utilizando el algoritmo anterior.
### (b) Ejecute el esquema anterior. Pero ahora si el procesador preferido no está libre es asignado a otro procesador. Luego el procesador preferido de cada job es el último en el cual ejecuto.
[Hoja de cálculo](https://docs.google.com/spreadsheets/d/1MiX4KM5DiN6vNY-n2BdX6kJIbkf5K1Vq4DAuSrjjE5c/edit?usp=sharing)
### (d) ¿Cuál de las dos alternativas planteadas es mas performante?
La que tiene mejor performance final, en términos de TRP y TEP, es la segunda alternativa.
