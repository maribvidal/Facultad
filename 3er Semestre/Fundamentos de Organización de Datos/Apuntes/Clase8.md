# Teoría/Clase 8

---

## Hashing estático

---

Técnica para generar una dirección base única para una llave dada. La dispersión se usa cuando se requiere acceso rápido a una llave

- No requiere índice
- Se utiliza la función de hashing para ubicar a cada registro
- Acceso cercano al directo en promedio (hay casos en el que la función devuelve un número que es igual a otro, y por lo tanto, se produce colisión y en el peor caso overflow)
- Se recibe una clave → se convierte a un número aleatorio con la función de hash → se convierte a una dirección (de memoria secundaria)
- Solo se puede hacer con registros de longitud fija
- No puede haber orden físico de datos
- No permite claves duplicadas
- Si la dirección está ocupada → cohesión y posible overflow (si no entran mas registros)
- Eficiencia → depende de la función de hash, del tamaño de los nodos, de la densidad de empaquetamiento, y del método de tratamiento de desbordes
- Colisión → Situación en la que un registro es asignado a una dirección que está siendo utilizada por otro registro
- Overflow → situación en la que a un registro se le asigna una dirección en la cual ya no hay espacio para alojarlo
- Solución → Algoritmo de dispersión sin colisiones (imposible)
- Solución → Almacenar los registros de alguna otra forma → esparcir registros → me´todo que redistribuya el registro de la forma mas aleatoria posible
- **Cubeta →** Dirección que posee mas de un registro
    - A mayor tamaño, menor **overflow**, pero mayor fragmentación interna (desperdicio de espacio)
- **Densidad de empaquetamiento →** Proporción de espacio del archivo asignado que en realidad almacena registros. Se obtiene de dividir el *NRR* por *la capacidad total del archivo*

### Análisis numérico

---

Para estimar la probabilidad de que una inserción genere overflow en un registro, es necesario utilizar la distribución de Poisson.

Sabiendo que tenemos N cubetas, cada una con una capacidad de C, y contamos con R registros en total en el archivo, entonces

- DE = (R / C * N)
- La probabilidad de que una cubeta reciba I registros

![Imagen1.png](./Imagenes/Imagen1.png)

![Imagen1.png](./Imagenes/Imagen1%201.png)

## Métodos para tratar el overflow

---

- **Saturación progresiva**
    - Consiste en asignarle el próximo registro libre cercano a un registro, si es que la **función de hash** de la clave devuelve un valor que ya ha sido ocupado. La **desventaja principal** es que se realiza un *recorrido secuencial*, y que los registros comienzan a acumularse sobre una misma zona
- Saturación progresiva **desencadenada** → Similar al anterior, pero en vez de realizar un recorrido secuencial, se guarda la dirección del nuevo registro guardado en una lista
- **Encadenamiento en áreas separadas** → Similar al anterior, pero se reserva un área aparte en donde se van a guardar los punteros a las direcciones de los registros que comparten una misma función de hash
- Doble dispersión
    - Si la **función de hash** le asigna a un registro una dirección que ya estaba ocupada, entonces se utiliza una ***segunda* función de hash** para indicarle *cuantos lugares se debe desplazar* de la posición original, y si esta también se encuentra ocupada, se desplaza la misma cantidad de espacios. Se realiza la busqueda de la misma forma

## Hashing dinámico

---

Permite reorganizar tablas sin mover muchos registros. Técnicas que asumen bloques físicos, pueden utilizarse o liberarse

- Hash virtual
- Hash dinámico
- Hash extensible

### Hash extensible

---

Adapta el resultado de la **función de hash** de acuerdo al número de registros que tenga el archivo, y de las cubetas necesitadas para su almacenamiento. Para lograr esto, va generando *secuencias de bits* cada vez mas grandes a medida que se insertan nuevos registros. Utiliza la secuencia de bits para acomodar a los registros.

- Si se intenta insertar a una cubeta llena deben reubicarse todos los registros allí contenidos entre el nodo viejo y el nuevo, para ello se toma un bit más.
- La tabla tendrá tantas entradas (direcciones de nodos) como **2^i**, siendo **i** el número de bits actuales para el sistema.

## Elección de organización

---

A la hora de elegir el tipo de organización, hay que tener en cuenta los requerimientos del usuario (los tipos de operaciones y el número de accesos a archivos), el número y tamaño de los registros, características del disco duro, parámetros, tiempo, y el uso promedio

![Imagen2.png](./Imagenes/Imagen2.png)
