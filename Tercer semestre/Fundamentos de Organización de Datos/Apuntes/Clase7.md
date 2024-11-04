# Teoría/Clase 7

---

## Bajas en los Arboles B

---

Si queremos eliminar un registro de un **nodo hoja** que tiene **igual o mas del mínimo de registros**, *no pasa nada*.

![Baja-1](./Imagenes/Untitled.png)

Si queremos eliminar un registro de un **nodo no-hoja**, hay que intercambiar el registro raíz por el máximo de los registros del subarbol izquierdo, o con el mínimo de los registros del subarbol derecho, y una vez la raíz se encuentra en el nodo hoja, podremos borrarlo, si es que **no se produce underflow**.

![Baja-2](./Imagenes/Untitled%201.png)

Si queremos eliminar un registro de un **nodo hoja**, y al eliminar dicho registro, la cantidad de registros del nodo pasa a ser menor que la cantidad mínima requerida, se produce **underflow**. Para eliminar el registro sin problemas, hay que fijarse si algún *nodo hermano* adyacente a nuestro nodo podría redistribuirle registros sin entrar en underflow. En caso que si, se hace *rotación* y *traslación* de registros para mantener la propiedad de orden.

![Baja-3](./Imagenes/Untitled%202.png)

Si queremos realizar un registro de un **nodo hoja**, y ocurre **underflow**, y ocurre **lo mismo para los hermanos adyacentes de nodo**, entonces se realiza la *concatenación*. Esto es, unir el registro del nodo con uno adyacente, disminuyendo el número de nodos (y en algunos casos, la altura del árbol)

![Baja-4](./Imagenes/Untitled%203.png)

### Performance de la baja

---

- Mejor caso (borrar de un hijo sin underflow) → H lecturas + 1 escritura
- Peor caso (concatenación que lleva a decrementar la altura del árbol) → 2H - 1 lecutras + (H + 1) escrituras

## Arbol B*

---

Es una variante del Árbol B que requiere que los nodos no-raíz estén por lo menos a 2/3 de ocupación (en vez del mínimo puesto en ORDEN/2). Para mantener estos nodos, en lugar de generar un nodo cuando se produce overflow, comparten sus claves con el nodo adyacente, y si ambos están llenos, los nodos se transforman en tres.

Redistribuye lo mas posible para retrasar la eliminación

## Arbol B+

---

Variante del Arbol B. Consiste en un conjunto de grupos de registros ordenados por clave en forma secuencial, junto con un conjunto de índices, que proporciona acceso rápido a los registros.

Las dos carácteristicas que agrega esta nueva variante son:

- Los **nodos no-hoja** no tienen datos, si no punteros a esos datos (sirven de índice)
- Los **nodos hoja** representan un conjunto de datos y son enlazados juntos

**Busqueda →** Deberá ir hasta el último nivel del árbol para acceder a los nodos, por mas que la clave buscada se encuentre antes (las claves pueden estar duplicadas)

**Inserción →** Similar al del Arbol B, con la peculiaridad de que lo que se promociona al nodo padre es nada mas una *copia* de la clave (solo se realiza con onverflow ocurrido a nivel de hoja)

**Baja →** Si la cantidad de claves es igual o superior al mínimo ([M/2]-1), entonces solo se elimina la clave del nodo hoja (no se producen cambios en las claves internas)

→ *Caso de underflow* → Debe realizarse una redistribución de claves, tanto en el índice como en las páginas hoja, si esto no es posible → C**oncatenación**

### Arbol B+ de prefijos simples

---

Variante del Arbol B+ que utiliza separadores mas cortos como índices. Los separadores son derivados de las llaves de los registros que limitan un bloque en el cojunto de secuencia.
