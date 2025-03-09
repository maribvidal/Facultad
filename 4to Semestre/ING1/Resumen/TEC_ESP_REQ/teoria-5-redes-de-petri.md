# Teoría 5 - Redes de Petri   
Las Redes de Petri son una *técnica de Especificación de Requerimientos dinámica*. 
- Son utilizadas para especificar sistemas de tiempo real en los que son necesario representar aspectos de **concurrencia**. 
- Son **asincrónicas**, la ejecución es **no determinística**.
- Tiene una DEFINICIÓN MATEMÁTICA ( C = (P, T, I, O) )
- Una Red de Petri es una 4-upla multigrafo, bipartito, dirigida, donde su primer conjunto representa lugares, el segundo transiciones, el tercero una función de entrada, y el cuarto una función de salida   
- Es un grafo en el cual desde un nodo puede partir mas de una arista o arco de manera que su conjunto de vértices puede particionarse en dos conjuntos independientes donde las aristas tienen un sentido definido.   
   
### ¿Por qué es importante esta técnica?   
Las tareas concurrentes deben estar sincronizadas para permitir la comunicación entre ellas (deben prevenir la modificación de datos compartidos o condiciones de bloqueo)
- Pueden realizarse varias tareas en paralelo, pero son ejecutados en un orden impredecible   
## Elementos   
 --- 
- Eventos/Acciones (T) ⟶ Transiciones   
- Estados/Condiciones (P) ⟶ Sitios   
   
## Sintaxis   
 --- 
*f(EstadoA, Evento) ⟶ EstadoS*   
Se requieren varios eventos para pasar de un estado a otro. Los eventos NO ocurren en un orden determinado.   
*f(EstadoA, Evento1, Evento2, … , EventoN) ⟶ EstadoS*   
Se requieren varios estados para habilitar del estado a otros varios estados que se ejecutan en paralelo   
f(EstadoA, Evento1, Evento2, … , EventoN) ⟶ Estado1, Estado2, … , EstadoN   
### Diagrama   
- **Arcos ⟶ **indican, a través de una flecha, la relación entre lugares y transiciones (y viceversa)   
- **Lugares ⟶** Se les asignan o reciben tokens. Esta asignación de tokens a lugares constituye la marcación   
- **Tokens ⟶** Números o puntos de disparo dentro de un sitio   
- Luego de una marcación inicial se puede simular la ejecución de una red   
- El número de tokens que se le puede asignar a un lugar es ilímitado   
- I:T⟶P   /    I(t1) = {P1}    /   I(t2)
O:T⟶P / O(t1) = {P2, P3, P4}   
- M(P1, P2, P3, P4, P5) = (0, 0, 1, 0, 0)   
   
### Tokens   
El conjunto de tokens asociados a cada estado sirven para manejar la coordinación de eventos y estados   
## Condiciones   
 --- 
- Una condición puede ser verdadera (tiene tokens) o falsa (no tiene ninguno)   
- La ocurrencia de un evento está sujeta a que se den ciertas pre-condiciones y al ocurrir el evento causa que se hagan verdadera las post-condiciones   
- Las Redes de Petri son asincrónicas y el orden en el que ocurren los eventos solo es uno de los tantos ordenes posibles permitidos   
- Se acepta que el disparo de una transición es instantáneo   
