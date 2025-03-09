# Teoría 2 - Procesos   
La responsabilidad principal de todo Sistema Operativo es controlar los procesos   
## Diferencia entre proceso y programa   
 --- 
**Programa ⟶** Porción de código que se encuentra almacenado en memoria. Es "estático". Deja de existir cuando se lo borra.   
**Proceso ⟶** Programa en ejecución. Es "dinámico". Tiene program counter. Su ciclo de vida comprende desde que se lo "dispara" hasta que termina.   
Stallings define a un **proceso **como una unidad de actividad caracterizada por la ejecución de una secuencia de instrucciones, un estado actual, y un conjunto de recursos del sistema asociados (a este)   
## Estructura del Proceso   
 --- 
Todo proceso para ejecutarse necesita de   
- Sección de **código**   
- Sección de **datos **⟶ aquí, entre otras cosas, se encuentra el **modo de ejecución**   
- **Stack(s) **(con datos temporales) ⟶ formados por *stack frames*, utilizados para pasajes de parámetros, direcciones de retorno en calls…   
   
### Atributos   
- **Identificador ⟶ **tanto del *proceso mismo,* como de su *padre *(el proceso que lo creó), como del usuario que lo "disparó" (si es que hay).    
    - Si hay grupos (como en Linux), también se incluye este (GID).    
    - Si es un SO multiusuario, también desde qué terminal y quién lo ejecutó   
   
## Process Control Block   
 --- 
Estructura de datos asociada al proceso. Podríamos decir que es el estado actual de un proceso y su localización en memoria.   
Existe una por proceso, y es lo primero que se crea al crearse un proceso, y lo último que se borra cuando termina (el proceso)   
### Información asociada   
- PID, PPID, etc…   
- **Contador de Programa** (PC) ⟶ Dirección de la siguiente instrucción del programa   
- Valores de los registros de la CPU   
- Planificación ⟶ **Estado**, **Prioridad**, Tiempo consumido…   
- Datos de Contexto ⟶ Presentes en los registros del procesador   
- Punteros a Memoria   
- Información de Auditoría   
   
## Espacio de direcciones   
 --- 
En esencia, un modelo abstracto que representa como está usando el proceso la memoria   
Conjunto de direcciones de memoria que ocupa el proceso, espacio delimitado para que este no toque a otros   
Un proceso en **modo usuario** solo puede acceder a **su** espacio de direcciones   
## Contexto del proceso   
 --- 
La información que el Sistema Operativo necesita para administrar el proceso, y la información que la CPU necesita para ejecutarlo correctamente. Incluye registros de la CPU, la prioridad del proceso, información relacionada a los dispositivos E/S…   
## Cambio de contexto   
 --- 
Se produce cuando la CPU cambia de un proceso a otro   
- Se debe resguardar el contexto del **proceso saliente**, que pasa a espera, así cuando vuelva a ejecutarse se pueda volver a cargar su contexto y seguirlo ejecutando en el mismo punto en el que se lo dejó. Es como un *guardado y cargado de partida*.   
- Para el **proceso entrante**, se cargará su contexto y comenzar desde la instrucción siguente a la última ejecutada (en dicho contexto)   
- DESVENTAJA: Es tiempo **no productivo** de la CPU ⟶ la CPU **no **utiliza este tiempo realizando tareas (ejecutando procesos)   
   
## Sobre el Kernel   
 --- 
Se ejecuta en el procesador como cualquier otro proceso. Pero, ¿qué lo ejecutaría entonces? ¿cómo implementamos esto?   
### Enfoques   
- Como **entidad independiente** ⟶ *Se ejecuta fuera de todo proceso*. Cuando un proceso es interrumpido o realiza una *SysCall*, el contexto del proceso se salva y el control se le pasa al Kernel. Misma desventaja del *context-switch* (cambio)   
    - El Kernel tiene su propia región de memoria (espacio de direcciones)   
    - El Kernel tiene su propio Stack   
    - El Kernel NO es un proceso, este concepto solo se utiliza con los programas de usuario   
- Como **"dentro" del proceso** ⟶ El "código" del Kernel se encuentra dentro del espacio de direcciones de cada proceso   
    - Se ejecuta en el mismo contexto que algún proceso de usuario   
    - Se lo puede ver al Kernel como una colección de rutinas que el proceso utiliza. Cada proceso tendría un **stack **en **modo usuario**, y otro en **modo kernel**   
    - Cada interrupción sería atendida en el contexto del proceso que se encontraba en ejecución (pero en modo kernel)   
    - DESVENTAJA: El espacio de direcciones de los procesos se ve reducido   
   
## Estados de un proceso   
 --- 
A lo largo de lo que dure en ejecutarse un proceso, desde que se inicia hasta que termina, este puede cambiar de estado varias veces. Por lo general, los estados de un proceso se resumen a estos:   
- **Nuevo (new) ⟶** Aquí se crea el PCB del proceso y su tabla en memoria   
- **Listo para ejecutar (ready) ⟶** El **dispatch/activador** lo pasa al estado *running. *En este estado el proceso no tiene la CPU, por lo cual no puede ejecutarse, y "compite" contra otros procesos para poder ser ejecutado   
- **Ejecutándose (running) ⟶** El proceso podría terminar / o volver al estado **ready **(*ya acabó su tiempo*) / o entrar en el estado **waiting**   
- En espera (waiting) ⟶   
- **Terminado (terminated) ⟶** Hay dos fases: una de terminación, y la otra de preservación temporal de la información del proceso (por si el Sistema Operativo o algún programa desea hacer un análisis de rendimiento). Deja de existir la PCB.   
   
## Colas en la planificación de procesos   
 --- 
Para el pasaje de estado y su ejecución, **las PCBs se enlazan en colas **siguiendo un orden determinado. Puede haber una por cada estado, e incluso mas (puede ser que hayan **colas de prioridad** de *procesos listos para ejecutarse o en espera*)   
Los enlaces que tiene cada PCB de un proceso van cambiando con cada transición de estado, el PCB en sí se queda en memoria.   
![image.png](./files/image.png)    
- **Colas de procesos ⟶** Contiene todas las PCBs de los procesos del sistema   
- **Cola de procesos listos ⟶** Contiene las PCBs de los procesos residentes en memoria principal esperando para ejecutarse   
- **Cola de dispositivos ⟶** Contiene las PCBs de los procesos esperando por un dispositivo E/S   
   
## Módulos de planificación   
 --- 
Módulos (software) del Kernel que realizan distintas tareas asociadas a la planificación de procesos. Está el **scheduler **(*planificador*), el **dispatcher **(*activador, *realiza la tarea de *cambio de contexto* generalmente), y el **loader **(carga los procesos elegidos por el *long-term scheduler* en memoria)   
- **Scheduler de long term ⟶** Involucrado en el pasaje de procesos del estado **new **a **ready**   
- **Scheduler de medium term ⟶** Involucrado en el pasaje de procesos del estado **ready **a **ready-suspended (swap out - swap in)**. Su objetivo principal es reducir el **grado de multiprogramación** (*cantidad de procesos que tiene en memoria, con capacidad de ejecutarse, un Sist. Op.)*, sacar temporalmente de memoria los procesos que sean necesarios para mantener el equilibrio del sistema.   
- **Scheduler de short term ⟶** Involucrado en el pasaje de procesos del estado **ready **a **running**   
   
## Comportamiento de los procesos   
 --- 
Por su comportamiento (el uso que hagan de los recursos), se podrían categorizar en:   
- **CPU-bound ⟶** Mayor parte del tiempo utilizando la CPU   
- **I/O-bound ⟶** Mayor parte del tiempo esperando (por alguna entrada de un dispositivo) E/S   
   
## Algoritmos de planificación   
 --- 
### Por grado de apropiación   
- **Apropiativos ⟶** El proceso en ejecución puede ser expulsado de la CPU   
- **No apropiativos ⟶** Los procesos se ejecutan hasta que el mismo proceso abandone la CPU, por su cuenta   
   
### Por objetivo buscado   
- **Equidad ⟶ **Otorgar una parte justa de la CPU a cada proceso   
- **Balance ⟶** Mantener ocupadas todas las partes del sistema   
   
### Para procesos batch (en lotes)   
- **First Come First Served ⟶** Se ejecutan en el orden que llegan   
- **Shortest Job First ⟶** La media de espera es menor entre los procesos que en el primer método ⟶ pero **puede **producir inanición (el proceso que lleve mas tiempo puede terminar ejecutándose mucho mas tarde que cuando se creó) ⟶ **además **de que es necesario tener un mecanismo que determine la duración de cada proceso de antemano   
   
### Para procesos interactivos   
Se hacen necesarios los algoritmos apropiativos para evitar que un proceso acapare la CPU   
- **Round Robin ⟶** A cada proceso se le otorga un *quantum* para ejecutarse (lapso de tiempo determinado por clock)   
- **Prioridades ⟶** Cada proceso cuenta con un nivel de prioridad, y se van ejecutándose acorde a tal   
- **Colas Multinivel ⟶** Aparecen colas de procesos para cierto nivel de prioridad, se utiliza con un Round Robin generalmente   
- **Shortest Remaining Time First ⟶** Los procesos que tienen un menor tiempo de ejecución que los procesos que llegaron primero se adelantan ⟶ *mismas desventajas que con el algoritmo Shortest Job First*   
   
**Inversión de prioridades ⟶** Situación en la que a un proceso, que lleva mucho tiempo esperando su ejecución, se le aumenta su grado de prioridad momentáneamente o hasta que se ejecute (lo saqué del video de teoría, [pero Wikipedia dice otra cosa](https://es.wikipedia.org/wiki/Inversi%C3%B3n_de_prioridades))   
**Mecanismo vs Política ⟶** Windows de usuario y Windows Server ⟶ Ambas computadoras utilizan los mismos algoritmos de planificación (mecanismo), pero en Windows Server se utiliza una política diferente que en la versión de usuario (por ejemplo, el *quantum *que se le da a cada proceso es mayor)   
   
