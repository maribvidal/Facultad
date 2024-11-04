# FODa/Apuntes

---

## Conceptos dispersos

---

**Algorítmica clásica** → Actualización; Unión; Corte de control

**Arbol B →** Arbol multicamino con una construcción especial de árboles que permite mantenerlos balanceados (a bajo costo)

**Archivo →** Colección de registros que abarcan entidades con un aspecto común y originadas para algún propósito particular

**Archivo detalle** → Archivo que agrupa información que se utilizará para modificar el contenido del *archivo maestro*

**Archivo físico →** Existe en la memoria secundaria; Es tal como aparece en el S.O. Es responsabilidad del sistema operativo resolver cuestiones relativas al lugar de almacenamiento de archivo en disco, como se ubicará la información en el mismo y cómo será recuperada

Archivo lógico → Archivo utilizado desde el algoritmo. Cuando el algoritmo necesita operar con un archivo, genera una conexión con el S.O.

**Archivo maestro** → Archivo que resume un determinado conjunto de datos

**Assign** → Establece el vínculo entre el nombre lógico del código con el archivo físico existente en la memoria.

**Baja física** → La forma mas simple es copiar todo en otro archivo, menos el registro eliminado

**Bases de datos** → Conjunto de datos interrelacionados. Esta interrelación tiene un *propósito*, asociado a la resolución de un problema.

**Buffer de memoria →** Memoria intermedia entre un archivo y un programa, donde los datos residen provisoriamente hasta ser almacenados definitivamente en la memoria secundaria, o donde los datos residen una vez recuperados de dicha memoria secundaria

**Clave primaria →** Atributo que identifica unívocamente al registro

**Clave secundaria →** Atributo del registro que puede potencialmente repetirse

**Datos →** Cualquier información dispuesta de manera adecuada para su tratamiento por una computadora

**Metadatos** → Datos acerca de datos

**Merge →** Proceso a través del cual se genera un nuevo archivo a través de otros archivos existentes

**Proceso de baja →** Aquel proceso que permite quitar información de un archivo. Se puede analizar desde dos perspectivas: aquella ligada con *la algorítmica y performance* necesarias para borrar la información, y aquella que tiene que ver con *la necesidad real* de quitar información de un archivo en el contexto informático actual

## Clave

---

Se concibe al registro como la cantidad de información que se lee o escribe

- Permite acceder solo a un registro específico
- Es conveniente identificar un registro con una llave o clave que se base en el contenido del mismo
- Permitir la identificación (unívoca o secundaria) del registro
- **Forma canónica →** Forma estandar en la que se escribe un tipo de clave

## Eliminación de datos

---

- **Proceso de baja →** Proceso que permite quitar información de un archivo. Hay dos perspectivas para analizar: la de la performance del algoritmo; la necesidad real.
- **Baja física**
    
    *Borrar la información para tener mas espacio físico*
    
    ### Técnicas
    
    ---
    
    - **Generar un nuevo archivo sin la información que se desea quitar →** Este método requiere contar, por lo menos, con la capacidad de almacenameinto que permita albergar el archivo actual y su copia → También requiere hacer una lectura secuencial de todos los elementos del archivo original, menos aquellos que se deseen eliminar
    - **Reacomodar los datos en el mismo archivo →** Este método tiene mejor performance que el anterior, y además no requiere contar con mayor capacidad en el disco rígido
    
- **Baja lógica**
    
    *Borrar información del archivo sin recuperar el espacio físico respectivo → El elemento que se desea quitar será marcado como borrado, pero sigue ocupando espacio dentro del archivo*
    
    **Ventajas** → Performance → *Tantas lecturas como sean necesarias para encontrar el elemento a borrar + una escritura de la marca de borrado lógico*
    
    **Desventajas →** Espacio en dísco
    

## Libro

---

[Introducción a las Bases de Datos/Capítulo 2](./Cap2.md)

[Introducción a las Bases de Datos/Capítulo 3](./Cap3.md)

[Introducción a las Bases de Datos/Capítulo 4](./Cap4.md)

## Clases

---

[Teoría/Clase 5](./Clase5.md)

[Teoría/Clase 6](./Clase6.md)

[Teoría/Clase 7](./Clase7.md)

[Teoría/Clase 8](./Clase8.md)
