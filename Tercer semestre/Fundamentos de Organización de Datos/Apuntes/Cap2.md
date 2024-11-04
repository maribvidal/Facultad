# Introducción a las Bases de Datos/Capítulo 2

---

## Archivos

---

Como los datos necesitan ser preservados mas alla de la ejecución de un algoritmo (*persistencia de datos*), los archivos no pueden residir en la memoria RAM, ya que esta es volatil, si no que deben residir en una estructura que permita la persistencia de datos cuando se haya apagado la computadora, que son los *dispositivos de almacenamiento permanente de información* (o almacenamiento secundario)

## Tipos de archivos

---

- Desde la perspectiva de la información que contiene, un archivo puede contener un tipo de dato simple. Además, puede contener una estructura heterogénea como los registros.
- **Archivo de longitud fija →** Archivo generado a partir de registros de longitud fija (determinada por la suma de las longitudes de los campos que los componen)
- **Acceso a información contenida en los archivos**
    - **Secuencial →** El acceso a cada elemento de datos se realiza luego de haber accedido a su inmediato anterior (orden físico de los datos)
    - **Secuencial indizado →** El acceso a los elementos de un archivo se realiza teniendo presente algún tipo de organización previa, sin tener en cuenta el orden físico (una lista de posiciones)
    - **Directo →** Recuperar un elemento de dato de un archivo con un solo acceso (conociendo sus características)

## Sobre los archivos

---

- Cada archivo tiene un puntero que apunta a la posición actual de trabajo del archivo, y una marca de *fin de archivo* (EOF) al final de su contenido que avisa donde termina este.
- Mientras se está operando un archivo, los cambios y la información volcada permanecen en un buffer, que es luego transferido al disco cuando se cierra el programa. Esto obviamente está hecho para no estar modificando constantemente la información del archivo en el disco
- **Operaciones esenciales**
    - **Alta →** Ingresar nuevos datos
    - **Modificación →** Alterar el contenido de algún dato del archivo
    - **Consulta →** Presentar el contenido total o parcial del archivo
    - **Baja →** Quitar información del archivo
