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
