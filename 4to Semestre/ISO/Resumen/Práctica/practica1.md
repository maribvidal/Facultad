# Práctica 1   
# Sistema operativo   
 --- 
Programa que controla la ejecución de aplicaciones y programas y que actúa como interfaz entre las aplicaciones y el hardware del computador. El software tiene tres objetivos: falicidad, eficiencia, y escalabilidad   
## Funciones principales   
- Administrar la memoria   
- Administrar la CPU   
- Administrar los dispositivos   
   
# GNU/Linux   
 --- 
Linux es un sistema operativo **monolítico híbrido,** de código abierto, de tipo UNIX, gratuito y de libre distribución. Linux adhiere y se distribuye bajo licencia GPL. Además, cabe mencionar que es multiusuario, multiprocesador, altamente portable, posee diversos intérpretes de comandos, permite el manejo de usuarios y permisos, todo dentro se maneja como una abstracción de archivo, cada directorio puede estar en una partición diferente, y es CASE SENSITIVE.   
## GNU   
GNU fue iniciado por Richard Stallman en 1983 con el fin de crear un UNIX libre, y para asegurar que esto se cumpliera, se necesitó crear un marco regulatorio (que sería conocido como GPL). Para financiar el proyecto, en 1985 Stallman crea la FSF.   
  En el año 1992, Torvalds y Stallman, deciden fusionar los proyectos Linux y GNU con el fin de crear GNU/Linux (el aporte de Linus fue el kernel del SO, Linux)   
## Cuatro libertades principales:   
- Libertad de usar el programa con cualquier propósito   
- Libertad de estudiar su funcionamiento   
- Libertad para distribuir sus copias   
- Libertad para mejorar los programas   
   
## Características del Software Libre   
- Una vez obtenido, puede ser usado, copiado, estudiado, modificado y redistribuirlo libremente   
- Es común que se distribuya junto a su código fuente   
- Correción mas rápida ante fallas (debido a que la comunidad lee y usa el código fuente)   
   
## POSIX   
Serie de normas, estándares y convenciones creadas por la comunidad de usuarios de Unix. POSIX es un acrónimo para Portable Operating System Interface uniX   
## Distribuciones de GNU/Linux   
Una distribución Linux es una [customización ](https://www.um.es/neologismos/index.php/v/neologismo/1757/customizar)de GNU/Linux formada por una versión de kernel y determinados programas con sus configuraciones. Algunos ejemplos son Ubuntu, LinuxMint, ArchLinux, y Fedora.   
Conjunto de aplicaciones reunidas que permiten brindar mejoras para instalar fácilmente un SO basado en GNU/Linux. Las distribuciones entre sí se diferencian, en general, por las herramientas para configuración y sistemas de administración de paquetes de Software para instalar. Cada una puede incluir una cantidad variable de Software adicional y una enorme variedad de aplicaciones, como entornos gráficos o servidores web.   
# Estructura de GNU/Linux   
 --- 
Los tres componentes fundamentales de GNU/Linux, y de prácticamente cualquier Sistema Operativo creado, son el Kernel, el Shell, y el FileSystem   
## Kernel   
 --- 
Es la parte fundamental de la estructura. Se encarga de lograr que el software y el hardware de la máquina puedan trabajar juntos. Es una porción de código, que se encuentra siempre en la memoria, que se encarga de la administración de los recursos   
- Kernel Monolítico   
- Kernel Monolítico Híbrido   
- Micronkernel   
   
### El Kernel de Linux   
Es de tipo **monolítico híbrido** ya que permite que los controladores de dispositivos y las extensiones al sistema operativo se puedan cargar y descargar en tiempo de ejecución.    
Se encuentra en el directorio '/boot'   
Sus funciones principales son:   
- *Computación concurrente y ejecución paralela verdadera*   
- Selección y configuración de features del Kernel y de los drivers, modificación del comportamiento del Kernel en tiempo de ejecución   
- Manejo de memoria avanzada con paginación de memoria virtual   
- Comunicación entre procesos y mecanismos de sincronización   
- Un filesystem virtual arriba de varios filesystems concretos   
- Schedulers de entrada y salida configurables   
- Virtualización a nivel de SO   
- Multiprocesamiento asimétrico, etc   
   
## Shell   
 --- 
Programa (archivo binario ejecutable) que actúa como interfaz para comunicar al usuario con el Sistema Operativo, todo esto mediante una ventana que espera comandos textuales ingresados por teclado, los interpreta, y los entrega al Sistema Operativo para su ejecución. A cada usuario de Linux se le asigna un shell por defecto (dentro de /etc/passwd)   
**No es parte del Kernel**. La shell se encarga de "dialogar" con esta.   
### Comandos   
Los comandos internos se encuentran en el respectivo directorio del shell dentro de '/bin'. Los comandos externos puedan estar en '/bin', '/usr/bin', '/usr/local/bin', o cualquier otro directorio si se lo agrega a la variable PATH.   
## FileSystem   
 --- 
Es la forma en la que se organizan y administran los archivos (dentro de un sistema de cómputo)   
### FHS   
Acrónimo para Filesystem Hierarchy Standard. Estandar de Unix.   
- **/bin ⟶** Programas esenciales del sistema   
- **/dev ⟶** Controladores de dispositivos   
- **/etc ⟶** Archivos de configuración del sistema   
- **/home ⟶ **Directorios "home" de los usuarios   
- **/lib ⟶** Imagenes de las librerías compartidas   
- **/proc ⟶** "Sistema de ficheros virtual"   
- **/root ⟶** Directorio home de root   
- **/tmp ⟶** Directorio para guardado temporal de información   
- **/usr ⟶** Contiene una serie de subdirectorios que contienen, a su vez, algunos de los mas importantes y útiles programas y archivos de configuración usados en el sistema   
- **/boot ⟶** Ficheros involucrados en el arranque del Sistema Operativo   
   
# Particiones   
 --- 
Es una forma de dividir lógicamente el disco físico. En Linux residen en el directorio '/   
- Partición primaria   
- Partición extendida   
- Partición lógica   
   
En una tabla de particiones pueden haber definido como máximo 3 o 4 particiones primarias y 1 extendida   
### Linux   
Para instalar Linux, es necesario como mínimo 1 partición (para el /), pero se recomiendan crear al menos 2   
- Root ⟶ Sistema de archivos raíz, se recomienda utilizar entre 2gb y 8gb   
- Swap ⟶ Memoria virtual, se recomienda que tenga el 50% del tamaño de la RAM física   
   
### Tipos de particionadores   
- **Destructivo ⟶** Solo permite crear y eliminar particiones   
- **No destructivo ⟶** Además, permiten modificarlas   
   
# Arranque del sistema   
 --- 
### Bootstrap   
Proceso de inicio de una máquina y carga del Sistema Operativo   
### BIOS   
El BIOS (Basic I/O System) es el encargado de iniciar la carga del Sistema Operativo, a través del Master Boot Code   
### UEFI   
El UEFI (Unified Extensible Firmware Interface) es un nexo entre el Sistema Operativo y el firmware cuyas características, como el bootloader entre otras, quedan definidas por el **UEFI Forum**, *una alianza entre varias compañías con el objetivo de modernizar el proceso de arranque*.   
El GRUB (GRand Unified Bootloader) es una aplicación UEFI   
### MBR   
El Master Boot Record es el primer sector de un dispositivo de almacenamiento de datos, que, por lo general, se emplea para el arranque del Sistema Operativo con bootstrap, y otras para almacenar una tabla de peticiones.   
### MBC   
El Master Boot Code es el código de arranque que se encuentra en el MBR   
### GPT   
Acrónimo de GUID Partition Table. Sustituye al MBR. Especifica la ubicación formato de la tabla de particiones en un disco duro   
### Gestor de Arranque   
Permite cargar una imagen del Kernel, de alguna partición, para su ejecución.    
El **GRUB **se encuentra en el MBR, MBR gap, y en Linux se configura a través del fichero /boot/grub/menu.lst   
## Proceso de arranque   
 --- 
Se ve como una serie de pequeños programas de ejecución cadenada   
Por lo general: Se ejecuta el código de la BIOS ⟶ El hardware lee el sector de arranque ⟶ Se carga el gestor de arranque (lanzado desde el MBC) ⟶ Se carga el Kernel   
# Archivos   
 --- 
En Linux, los archivos se identifican por i-nodos y números. Los directorios son mapas de inodos. Si usamos el comando "ls -l", veremos que cualquier archivo ren realidad se identifica como "-RW-R—R— 1 <usuario> <usuario> 30 aug 27 22:27 <archivo>".   
Un inodo contiene las características de un archivo regular, directorio, o cualquier otro objeto que pueda contener el sistema de ficheros   
## Permisos   
 --- 
|    PERMISO | VALOR | OCTAL |
|:-----------|:------|:------|
|    Lectura |     R |     4 |
|  Escritura |     W |     2 |
|  Ejecución |     X |     1 |
