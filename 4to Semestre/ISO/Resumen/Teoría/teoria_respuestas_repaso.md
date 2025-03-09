# Teoría - Respuestas Repaso   
# Teoría 1 y 2   
 --- 
- Cuando a un proceso, que se encuentra en estado de ejecución, se le termina su quantum asignado, y se utiliza un algoritmo de planificación Round Robin --> Ejecución de Short Term Scheduller --> Resguardo de los datos del contexto del proceso saliente --> Carga de los datos del contexto del proceso entrante --> Cambio a modo usuario --> Sato a la instrucción del proceso entrante
- En qué registro de la CPU se almacena el bit de modo? --> En la palabra de estado de programa
- Un cambio de modo de ejecución siempre causa que se realice un cambio de contexto --> Falso (el cambio de modo puede darse dentro del mismo proceso)
- Una llamada al sistema (system call) genera la creación de un nuevo proceso del sistema operativo para atender la llamada --> Falso (las syscalls generan una interrupcion que es atendida por el vector de interrupciones)
- Un proceso en estado de listo en memoria principal nunca será llevado a memoria secundaria (swap out) --> Falso (podría ocurrir que se esté utilizando un algoritmo apropiativo y que el proceso a punto de entrar tenga menor prioridad que otro)
- Cómo detecta el hardware que un proceso en modo usuario está intentando ejecutar una instrucción privilegiada y qué ocurre? --> Lo detecta el hardware comprobando el código de operación de la instrucción
- La PCB es una estructura de datos unica  que utiliza el Kernel para almacenar información de todos los procesos. Contiene una lista encadenada con los atributos de los procesos creados --> Falso (cada proceso tiene su PCB propia)
- Un proceso existe desde que el programa es cargado en el espacio de direcciones de memoria del mismo. --> Falso (el PCB existe desde el momento en el que se crea el proceso)
- El chequeo de protección de la memoria mediante los registros base y limite es realizado por el SO ante cada acceso a memoria que intenta un proceso --> Falso
- 
   
# Teoría 3   
 --- 
- En la técnica de particiones fijas, la partición donde se cargara el espacio de direcciones de un proceso lo determina ⟶ el Kernel   
- En la técnica de administración de memoria principal por Segmentación Paginada la unidad de trabajo para subir o bajar de la RAM es ⟶ la página   
- El registro del estado (libre o ocupado) de los marcos de la memoria (frames) es administrado por ⟶ el Kernel (La información de registro está relacionada con los procesos, por ejemplo. La determinación de si está libre o ocupado tiene que ver con información que almacenan estructuras del kernel, por ejemplo, la tabla de páginas)
- La administración de memoria por particiones fijas puede causar ⟶ fragmentación interna   
- En paginación cada proceso tiene una tabla de páginas ⟶ Verdadero   
- En la técnica de administración de la memoria por particiones ⟶ dinámicas ⟶ el grado de multiprogramación es variable   
- Mientras que la técnica de administración de memoria por paginación pura puede producir ⟶ fragmentación interna ⟶ y la técnica de segmentación ⟶ fragmentación externa, ⟶ la técnica de Segmentación Páginada puede producir ⟶ fragmentación interna   
- En la técnica de particiones dinámicas los valores de Registro Base y Registro límite de cada proceso son definidos por la MMU ⟶ falso   
