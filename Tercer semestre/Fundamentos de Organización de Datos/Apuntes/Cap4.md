# Introducción a las Bases de Datos/Capítulo 4

---

Históricamente, el proceso de baja era necesario para quitar información poco útil de la BD y recuperar espacio, pero en la actualidad esto cambió, ya que cambió el trato que le dan las organizaciones a la información (su bien mas preciado). Ahora, la información, si no es muy “importante”, se guarda en repertorios históricos u otros archivo

## Proceso de baja

---

### Baja física

---

*Quita la información del archivo, recuperando así espacio en el disco*

- **Algoritmo mas sencillo →** Copiar todos los registros de un archivo, menos lo que se desean borrar, y pasarlos a uno nuevo
    - **Performance →** Este método requiere realizar N lecturas y N - X escrituras, en forma secuencial
    - Una vez generado el nuevo archivo, coexisten tanto este como el original en memoria, lo que supone disponer previamente de la capacidad de almacenar a ambos
- **Algoritmo usando el mismo archivo →** Avanza hasta el registro que se desea borrar, y luego, copia sobre este registro el elemento siguiente, y así sucesivamente hasta el final del archivo
    - **Performance →** La cantidad de lecturas es igual a N, y la peor cantidad de escrituras posible es igual a N - X (considerando el caso en el que el registro a borrar se encuentra al principio del archivo)
    - No es necesario contar con mas espacio en disco

### Baja lógica

---

- Su ventaja principal es la **performance**. No necesita mas que: las lecturas necesarias para encontrar el registro + 1 escritura

*No recupera espacio físico, si no que marca los registros borrables*

- Su desventaja principal es el espacio en memoria que utiliza

## Recuperación de espacio

---

*¿Qué hacer con la información marcada?*

- **Recuperación de espacio →** Borrar periódicamente los registros marcados mediante la baja física
- **Reasignación de espacio →** Utilizar los registros marcados para ingresar nueva información
    - Generar una lista encadenada invertida con las posiciones “libres”, lista cuya cabecera se encuentra al comienzo del archivo
    - Durante el *proceso de alta*, primero comprobar si la lista cuenta con espacios libres, y si es el caso, insertarse en el primero de dichos espacios
    - Si el archivo no dispone de lugares para reasignar, el registro cabecera no tendrá ninguna dirección válida, y entonces la nueva información deberá ser insertada al final del archivo

### Campos y registros

---

*La longitud de cada registro del archivo está determinada por el tipo de información que guarda*

- Si bien trabajar con *registros de longitud fija* tiene sus ventajas, también puede dejar mucho espacio de almacenamiento sin usar (*espacios de relleno*)
- **Longitud variable** → otra visión de un *archivo de datos* → secuencia de caracteres
    - Es necesario colocar marcas que delimiten cada elemento/registro (*marcas de fin de campo/registro*)
    - Las operaciones de lectura y escritura son diferentes, ya que se opera sobre carácter por carácter
    - Un problema que surge es el del *acceso a la información*, ya que si la longitud de cada registro es variable, y por lo tanto no se conoce *a priori*, entonces no hay forma de calcular automáticamente la posición de cada uno

### Eliminación con registros de longitud variable

---

*Es necesario encontrar un registro cuyo tamaño sea igual al del nuevo elemento a ingresar (o por lo menos que tenga el suficiente espacio para contenerlo)*

- La solución es usar una lista encadenada, pero además de guardar la posición del próximo lugar libre, también se incluirá la longitud que posee ese espacio
    - **Primer ajuste →** Seleccionar el primer espacio disponible donde quepa el nuevo registro
    - **Mejor ajuste →** Seleccionar el espacio mas adecuado para el registro
    - **Peor ajuste →** Seleccionar el espacio de mayor tamaño, asignando para el registro solo los bytes necesarios

## Fragmentación

---

- **Fragmentación interna →** Se produce cuando a un elemento de dato se le asigna mayor espacio del necesario
- **Fragmentación externa →** Espacio disponible entre dos registros, pero que es demasiado pequeño como para poder ser utilizado
- **Garbage Collector →** Algoritmo que se ejecuta periódicamente para la recuperación de espacios no asignados
