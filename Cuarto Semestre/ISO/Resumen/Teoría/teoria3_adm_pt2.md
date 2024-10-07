# Teoría 3 - Administración de Memoria (pt. 2)   
# Memoria virtual   
 --- 
Vendría a ser *la memoria que percibe el programador y el usuario*, y que permite cargar los procesos de manera dinámica. Se la denomina virtual, en contraposición con la "memoria real", porque es en esta última donde es que se ejecutan los procesos    
- [permite la carga de un proceso bajo demanda.]   
   
No es necesario que un proceso entero esté en la RAM (no todo el espacio de direcciones de un proceso se necesita en todo momento)   
- Rutinas o librerías que se ejecutan una única vez o nunca   
- Partes del programa que no vuelven a ejecutarse   
- Regiones de memoria alocadas dinámicamente y luego liberadas   
   
Por lo tanto, el Sist. Operativo podría ir trayendo "trozos" de un proceso en la memoria principal, a medida que las necesite   
### Conjunto residente (working set)   
Porción del *espacio de direcciones* de un proceso que se encuentra en memoria   
- Con ayuda del hardware, se detecta cuando se necesita una porción del proceso que no está dentro del conjunto residente en ese momento (se maneja con Fallos de Página) ⟶ se debe cargar dicha porción en la memoria para continuar ejecutando el proceso sin problemas   
   
## Ventajas   
 --- 
1. **La memoria puede mantener mas procesos **⟶ con mas procesos en la RAM, es mas probable que existan mas procesos Listo   
2. **Un proceso podría ser mas grande que la memoria principal e igual ejecutarse (en pedazos)** ⟶ el usuario no se tiene que preocupar por el tamaño de sus programas ⟶ la limitación la impone el *hardware *y el *bus de direcciones*   
   
## Paginación por demanda   
 --- 
El SO va metiendo paginas a memoria bajo demanda, a medida que se necesiten   
- Se requiere un dispositivo de almacenamiento o un área de memoria que sirva para almacenar las secciones del proceso que no se estén ejecutando o no se requieran en un momento (*swapping area/área de swap*)   
- El Sist. Op. debe ser capaz de manejar el movimiento de las páginas entre la memoria principal y la secundaria   
   
### Tabla de páginas   
Su formato lo define el *hardware*   
Cada proceso cuenta con una **tabla de páginas**, cuyas entradas hacen referencia al marco en el que se encuentra la página (en ese momento) en la memoria principal. Cada entrada cuenta con bits de control, algunos de ellos son:   
- **Bit V ⟶** Indica si la página está en memoria o no (lo activa/desactiva el SO, y **lo consulta el HW**)   
- **Bit M ⟶** Indica si la página fue modificada o no (lo activa el HW, **lo consulta y desactiva el SO**) ⟶ le ayuda al SO a decidir qué acciones tomar cuando se descargue una página   
- Page Frame Number (PFN) - Marco de memoria asociado   
- Flags que describen su estado y protección (res, res, res, global, res, dirty, accessed, cache disabled, write through, owner, write, valid)   
   
Una entrada es válida si su Bit V = 1, si tiene PFN, y si tiene flags que describan su estado y protección   
   
## Fallo de páginas   
 --- 
El hardware avisa que **el Bit V = 0** (por medio de un trap). Hay que encontrar un marco en memoria para cargar la página. Se genera una operación de E/S ⟶ transparentes a los procesos   
Se detecta que se necesita una página en la RAM debido a que se intentó cargar una dirección cuyo Bit V en la entrada de la Tabla de Páginas asociada es 0   
- Ocurre cuando el proceso intenta usar una dirección que está en una página que no está cargada / no se encuentra en memoria principal ⟶ *la página no se encuentra en el* **conjunto residente ***del proceso*   
- El Sist. Op. podrá colocar al proceso en estado de "blocked/bloqueado/espera" mientras gestiona que la página que se necesite se cargue   
- El SO busca un marco libre en la memoria y genera una operación de E/S al disco para copiar, en dicho marco, la **página del proceso **que se necesita utilizar   
- El SO puede asignarle la CPU a otro proceso mientras se completa la operación de E/S (hasta que la E/S avise mediante interrupción que finalizó esta operación)   
- Cuando la mencionada operación finaliza, se le notifica al Sist. Op. y este actualiza la tabla de páginas del proceso (le coloca un 1 en el bit V de la página en cuestión y coloca la dirección base del marco donde se colocó la página), el proceso que generó el Fallo de Página vuelve a estado de Ready, y cuando el proceso se ejecute, volverá a ejecutar la instrucción que antes generó el fallo de página   
   
## Performance   
 --- 
**Tasa de Page Faults ⟶** Un TPF = 0 es prácticamente imposible (significaría que nunca ocurrirían fallos de páginas). Un TPF = 1 querría decir que TODO acceso a memoria produciría un fallo de página, lo que mantiene ocupado al Kernel y consume tiempo de CPU   
- Effective Access Time (EAT) ⟶ (1 - p) x *mem\_access + p x (page\_fault\_overhead + [swap\_page\_out] + swap\_page\_in + restart\_overhead)*   
    - el **swap\_page\_out** quiere decir que podría ocurrir una situación en la que no hubieran marcos disponibles, por lo que se demoraría tiempo en sacar uno para cargar la nueva página   
   
## Tabla de Páginas   
 --- 
Cada proceso tiene su tabla de páginas. El tamaño de la *tabla de páginas* depende del *espacio de direcciones del proceso* ⟶ esta puede alcanzar un tamaño considerable   
La cantidad de **entradas que puede tener la Tabla de Páginas** de un proceso (PTEs) depende de cuantos bits en la dirección se destinen a identificar el número de página (con 20 bits, por ejemplo, se podrían tener 2 a la 20)   
![](./files/image_w.png)    
## Tabla de 2 niveles   
 --- 
Si se la piensa a la tabla de páginas de manera lineal, *como un vector con PTEs* (entradas), y la cantidad de PTEs que puede tener un proceso es muy grande, podría darse el caso tranquilamente que **el tamaño de la tabla de páginas de cada proceso ocupara mas de 100 GB**   
El propósito de la tabla de páginas multinivel es dividir la tabla de páginas lineal en multiples tablas de páginas   
- Cada tabla de páginas suele tener el mismo tamaño, pero se busca que tengan un menor número de páginas por tabla   
- La idea general es que cada tabla sea mas pequeña   
- Una desventaja con este enfoque es que la MMU va a tener que hacer mas accesos a memoria (2 o mas veces)   
   
Las tablas de páginas de segundo nivel podrían sacarse de la memoria principal en cualquier momento, pero la que SIEMPRE tiene que estar presente en memoria principal es la primera tabla de páginas (la que permite acceder a las otras)   
[Paginación de multinivel y tabla de pagina invertida](https://www.youtube.com/watch?v=2zEGiZga04g)    
### Translation Lookaside Buffer   
Caché de alta velocidad que guarda entradas de tablas de página. Si la página buscada está adentro, entonces la saca de ahí y traduce la dirección física. Si no está adentro, se va a la tabla de páginas. Mantiene las últimas tablas de páginas referenciadas.   
### Tabla Invertida   
## Tamaño de la Página   
 --- 
Si las **paginas **(y los marcos) son *mas grandes*, hay *menos entradas* en las **tablas de paginas**, y menos trasferencias de bloques de disco, además de haber mayor fragmentación interna.   
Si las **páginas** son mas chicas, va a haber *menor fragmentación interna*, además de mas entradas en las tablas de páginas y mas páginas cargadas en memoria. Una desventaja es que se va a necesitar mas tiempo para transferir las páginas del disco a memoria   
# Políticas en el manejo de la Mem. Virtual   
 --- 
- **Fetch Policy ⟶** Cuando una página debe ser llevada a la memoria   
- **Placement Policy ⟶** Donde ubicar la página en memoria (best-fit, first-fit, …)   
- **Política de Reemplazo ⟶** Algoritmos para elegir la página "víctima"   
- **Resident Set Management ⟶** Cuantas páginas se traen a memoria   
- **Cleaning Policy ⟶** Cuando una página modificada debe llevarse a disco   
- **Load Control ⟶** Número de procesos en memoria   
   
## Asignación de Marcos   
 --- 
¿Cuántas páginas de un proceso se pueden encontrar en memoria?   
- **Asignación fija ⟶** Número fijo de marcos otorgados a cada proceso   
    - **Asignación equitativa ⟶** Dado 100 marcos y 5 procesos, cada proceso recibe 20 marcos   
    - **Asignación proporcional ⟶** Se asigna acorde al tamaño del proceso   
- **Asignación dinámica ⟶** El número de marcos puede variar por proceso   
- **Combinación ⟶** Asignación fija flexible con el paso del tiempo (se observa el comportamiento de un proceso, y si tiene un TFP alto o si nunca tiene problemas, se le sube o se le bajan marcos)   
   
## Reemplazo de Página   
 --- 
Cuando todos los marcos están ocupados, o un proceso tiene tantos marcos asignados y aún así necesita mas para su conjunto residente en ese instante, se necesita seleccionar una página víctima para ser reemplazada de todos los marcos   
*El reemplazo óptimo sería una página que en el futuro próximo no sea referenciada. Pero el sistema no puede prever el futuro, lo máximo que se puede hacer es predecirlo.*   
### Algoritmos de Reemplazo   
- **FIFO ⟶ **First-In First-Out   
- **LRU ⟶** El Kernel manejaría una estructura adicional en la RAM, junto a los bits R y M del hardware, para mantener un timestap de los marcos ⟶ el Kernel revisa las tablas de páginas   
- **2da. Chance ⟶** El Kernel usa una cola donde mete a las páginas con el bit R = 0, y si la segunda vez que recorre la cola hay una página con el bit R = 0, entonces la saca porque no se está **usando**   
- **NRU ⟶** Utiliza bits R y M. Favorece a las páginas que fueron usadas recientemente   
   
### Alcance del Reemplazo   
Cuando tengo que seleccionar una víctima, el conjunto del cual selecciono a la víctima incluye todas las páginas cargadas en memoria principal, o se limita al conjunto residente de un proceso   
- El Sist. Op. no podría determinar la tasa de page-faults de cada proceso, ya que si ocurre una interrupción por fallo de página, esto podría ser tanto porque el conjunto residente de un proceso debe actualizarse para seguir ejecutando el proceso, o porque la página del conjunto residente de un proceso fue seleccionada como víctima. Si el reemplazo es local, el SO puede utilizar esta información a su favor   
   
## Política de Limpieza   
 --- 
- **Bajo demanda ⟶** fallo de página   
- **Pre-creaning ⟶** necesita estar monitoreando   
   
# Thrashing (hiperpaginación)   
 --- 
El uso de la CPU se está usando mayoritariamente para tratar fallos de página, cuando esta debería estar dedicándose a ejecutar procesos   
La hiperpaginación es la situación de un Sist. Operativo en la que se consume mucho tiempo del procesador en el tratamiento de fallos de página, y por lo tanto baja el rendimiento/performance del sistema ([se utiliza una creciente cantidad de recursos para hacer un trabajo cada vez menor](https://es.wikipedia.org/wiki/Hiperpaginaci%C3%B3n))   
- Hay una porción de código en el kernel que administra la paginación por demanda   
- Se puede limitar el thrashing **utilizando reemplazo local**, pero esto solo ayuda hasta cierto punto   
- También se puede **bajar el grado de multiprogramación** para tratar con el problema   
   
## Ciclo de Thrashing   
 --- 
1. El Kernel monitorea el uso de la CPU   
2. Si hay baja utilización, aumenta el grado de multiprogramación (*cantidad de procesos en memoria principal*)   
3. Si el algoritmo de reemplazo es global, se les pueden quitar marcos a otros procesos   
4. Un proceso necesita mas marcos. Comienzan los fallos de página y robo de marcos a otros procesos   
5. Por swapping de páginas, y encolamiento en dispositivos, baja el uso de la CPU   
6. Se regresa al paso 1   
   
## Entonces, ¿qué podemos hacer al respecto?   
 --- 
Hay que partir del hecho de que el thrashing se produce esencialmente debido a que cada proceso no dispone de los marcos suficientes que necesita.   
Si el SO lograra detectar, en cada momento, qué páginas necesita un proceso, y el SO pudiera garantizar que esas páginas estén en memoria principal, entonces comienzo a reducir la cantidad de fallos de página que pudieran ocurrir.   
### El modelo de localidad   
Las referencias a datos y programa dentro de un proceso tienden a agruparse (*[Principio de Cercanía de referencias](https://es.wikipedia.org/wiki/Cercan%C3%ADa_de_referencias)*)   
Si el sist. op. **logra mantener cada una de esas localidades** en el momento que se necesita, lo que causaría sería que **se reduzca la frecuencia de fallos de página** de los procesos   
**Localidad ⟶** las páginas del proceso que se pueden usar sin generar un fallo de página   
## Modelo del Working Set   
 --- 
- Se basa en *el modelo de localidad*   
- **Ventana del working set **Δ** ⟶** las referencias a memorias mas recientes   
- El working set sería aquí el conjunto de páginas que tienen las referencias mas recientes a páginas   
![image.png](./files/image_u.png)    
   
Cuando haya que seleccionar una página víctima, seleccionar una que no forme parte del conjunto   
### Problemas de esta técnica   
1. Cómo decidir el tamaño del conjunto Δ   
2. Cómo se obtiene la información sobre las páginas (se necesitaría un apoyo del hardware) ⟶ con el bit de referencia de la tabla de páginas podría llegar a aproximarse a alguna solución pequeña ⟶ produciría sobrecarga   
   
### Medida del working set   
- m = cantidad marcos disponibles   
- WSSi = tamaño del working set del proceso i   
- Σ WSSi = D ⟶ *la demanda de páginas de todos los procesos en un momento dado*   
- D = demanda total de marcos   
- **si D > m, habrá hiperpaginación**   
   
# Prevención del Thrashing por PFF   
 --- 
Esta técnica, denominada **técnica de Frecuencia de Fallo de Páginas**, en lugar de calcular el Working Set de los procesos, utiliza la tasa de fallos de página para estimar si el proceso tiene un conjunto residente que representa adecuadamente al Working Set ⟶ la realiza un proceso auxiliar; si o si se necesita usar **reemplazo local**   
Se considera **la frecuencia de fallo de páginas** de un proceso para ver si el proceso necesita mas marcos o menos. Se establece un umbral superior y uno inferior. Si se supera el umbral superior, *se le asignan mas marcos al procesos*, y si toca el umbrar inferior, *se le quitan marcos*   
![image.png](./files/image_e.png)    
