# Teoría/Clase 6

---

## Arboles

---

Los **arboles binarios de búsqueda**, como estructura de datos para los **indices**, son mejores opciones que las alternativas (lista ordenada/no ordenada). El problema radica en que se desbalancean fácilmente, y estar constantemente actualizándolos para que no se pierda la **propiedad de orden** es costoso.

Un árbol se considera **balanceado** cuando la altura del camino hacia una hoja cualquiera no difiere en la del camino hacia las otras.

### Arboles AVL

---

Los **Arboles ALV** son árboles balanceados en altura (BA(1)), en las que la diferencia de altura entre su rama izquierda y su rama derecha solo es de 1 unidad, y en el que las inserciones y eliminaciones se efectúan con un mínimo de accesos. Cada vez que se rompe el estado de equilibrio, el árbol debe ser rotado.

| Performances en el peor |  caso posible |
| --- | --- |
| BINARIO | AVL |
| Log2 (N+1) | 1.44 Log2(N+2) |

### Arboles Binarios Paginados

---

Un **Arbol Binario Paginado** es un arbol binario cuyas partes se encuentran divididas, en segmentos iguales, en *páginas*, grupos de N nodos del árbol que son guardados en un bloque de localidad en disco. Este tipo de arbol soluciona poblemas de almacenamiento secundario, buffering, páginas de memoria, varios registros individuales, minimiza el número de accesos. 

Pero como contraparte, surje el problema de cómo construimos exactamente el árbol y como lo vamos balanceando a medida que se le añaden nodos.

### Arboles Multicaminos/Generales

---

Un **Arbol Multicamino** es un árbol cuyos nodos son de un grado máximo superior a 2, es decir, pueden albergar MAS DE 2 HIJOS. Cada nodo tiene K punteros y (K - 1) registros/claves. Además, por su diseño, se reduce la profundidad del árbol.

### Arboles Balanceados

---

Son **Arboles Multicaminos** con una construcción especial en forma ascendente que permite mantenerlo balanceado a bajo costo. Su performance en el **mejor caso** es de **1 lectura**, y en el **peor caso**, de **H lecturas** (siendo H la altura del árbol)

Si se tiene un **árbol B** de **orden M**, se cumplen las siguientes propiedades:

- Ningún nodo tiene mas de M hijos
- Cada nodo no-raíz y no-hoja tiene como mínimo M/2 hijos
- La raíz, o es de grado 0, o es por lo menos de grado 2
- Todas las hojas se encuentran en el mismo nivel
- Los nodos no-hoja con K hijos contienen K - 1 registros
- Los nodos hoja tienen como mínimo (M / 2) - 1 registros, y como máximo, M - 1 registros

### Inserción en los Arboles Balanceados

---

La operación de **inserción** del **Arbol Balanceado** tiene dos partes elementales: la **división** y la **promoción**. 

**Cuando se inserta un registro en una hoja**, y en esta hoja ya no hay mas lugar (*overflow*), **se divide** el nodo, los elementos se reparten entre ambos nodos, y, o el registro “mas grande” del nodo izquierdo, o el registro “mas chico” del nodo derecho (*el criterio es a elección del programador*), **promocionan** hacia el nivel superior, esto es, suben al nodo del nivel inmediatamente superior, se intentan reacomodar, y si no es posible la inserción (*overflow de nuevo*), entonces se repite el proceso.

| **Mejor caso** | **Peor caso** |
| --- | --- |
| H lecturas | H lecturas |
| 1 escritura | 2 * h + 1 escrituras |

## Herramientas útiles

---

[B-Tree Visualization](https://www.cs.usfca.edu/~galles/visualization/BTree.html)
