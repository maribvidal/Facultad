# Teoría 1 - Introducción   
 --- 
## Sistema Operativo   
Programa que controla la ejecución de aplicaciones y programas, y que actúa como interfaz entre las aplicaciones y el hardware del computador. El Sistema Operativo tiene tres objetivos: facilidad de uso, eficiencia, y escalabilidad.    
Como es software, necesita del procesador y de la memoria para funcionar   
También podemos decir que es el gestor de hardware, de los procesos, de la memoria y de las E/S del ordenador.   
## Componentes   
Kernel **⟶** Porción de código que siempre se encuentra en memoria. Se encarga de lograr que el software y el hardware de la PC puedan trabajar juntos. De la administración de recursos.   
- **Monolítico ⟶** Incluye prácticamente toda la funcionalidad del SO.   
- **Microkernel ⟶** Provee un conjunto de primitivas o llamadas mínimas al sistema para implementar servicios esenciales como espacios de direcciones, comunicación entre procesos, manejo de memoria, manejo de la CPU ydemás planificación básica, delegando todo lo demas al espacio del usuario. [[FUENTE](https://es.wikipedia.org/wiki/Micron%C3%BAcleo)]   
   
Shell **⟶** Programa que actúa como interfaz para comunicar al usuario con el SO, todo esto por medio de una ventana que espera comandos textuales ingresados por teclado, los interpreta, y los entrega al SO para su ejecución.   
Herramientas **⟶** Editores, compiladores, librerías, etc.   
   
## Problemas que un SO debe evitar   
- Acaparamiento de la CPU por parte de un proceso   
- Que un proceso ejecute acciones que no le correspondan (como instrucciones de E/S)   
- Que un proceso acceda a una posición de memoria que no le corresponde (espacio de direcciones)   
   
## Modos de Ejecución   
El **modo de ejecución** es una flag del procesador que indica cual es el modo actual con el que se están ejecutando las instrucciones, si el modo usuario o el modo supervisor/kernel. Esto puede ser interrumpido por clock o por otro tipo de interrupción (solo por medio de interrupción es que se puede cambiar el modo de ejecución)   
Esto es importante para protejer que cualquier proceso pueda ejecutar cualquier instrucción del SO. El kernel del SO y algunos otros programas (dependiendo del SO) se ejecutan en modo supervisor. El resto de programas, en modo usuario (solo se les permite utilizar un subconjunto de las instrucciones)   
- Cuando el proceso de usuario intenta (por si mismo) ejecutar instrucciones privilegiadas, el HW lo detecta como una operación ilegal y produce una interrupción   
- **Interrupción de Clock ⟶ **esencialmente evita que un proceso acapare la CPU ⟶ cada proceso recibe un intervalo de tiempo denominado **quantum**   
   
El BSOD ocurre porque un programa se bloqueó estando el SO en modo supervisor   
### Modo supervisor   
- Gestión de procesos   
- Gestión de memoria   
- Gestión E/S   
- Funciones de Soporte   
   
### Modo usuario   
- Debug de procesos   
- Definición de protocolos de comunicación   
- Gestión de aplicaciones   
- Todas las tareas que no requieran de modo privilegiado   
   
   
## Protección de la Memoria   
Hay que delimitar el espacio de direcciones que utiliza un proceso ⟶ evitar que los procesos ejecuten instrucciones que no les pertenecen. De esto se encarga el Kernel.   
   
## System Calls   
La forma en que los programas de usuario acceden a los servicios del SO (como las operaciones de archivo)   
- Los parámetros asociados a las llamadas pueden pasarse de varias maneras: por registros, bloques o tablas de memoria a la pila   
- Se ejecutan en modo supervisor   
- Tienen un syscall\_handler que maneja las interrupciones   
![image.png](./files/image_1.png)    
