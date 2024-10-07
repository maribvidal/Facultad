# Práctica 2   
## Proceso de Arranque - SystemV   
 --- 
1. Se empieza a ejecutar el código del BIOS   
2. El BIOS ejecuta el POST   
3. El BIOS lee el sector de arranque (el sector 0 del disco que tiene el MBR)   
4. Se carga el gestor de arranque (el MBC contenido dentro del MBR)   
5. El bootloader carga el Kernel y el *initrd *(**initial ramdisk** ⟶ [sistema de ficheros temporal](https://es.wikipedia.org/wiki/Initrd))   
6. Se monta el initrd como sistema de archivos raíz y se inicializan componentes esenciales   
7. El Kernel ejecuta el proceso init y se desmonta el initrd   
8. Se lee el /etc/inittab   
9. Se ejecutan los scripts apuntados por el *runlevel* 1   
10. El final del *runlevel *1 le indica que vaya al *runlevel *configurado por defecto   
11. Se ejecutan los scripts apuntados por el *runlevel default*   
12. El sistema está listo para usarse   
   
### Proceso init   
Lo ejecuta el Kernel durante el proceso de arranque. Su objetivo es cagar todos los subprocesos necesarios para el funcionamiento correcto del Sistema Operativo. Es el encargado de montar los filesystems y de hacer disponible los demás dispositivos.   
### Runlevel   
Son los modos de operación en los que arranca Linux. Cada uno es responsable de iniciar o detener una serie de servicios. Son 7, y permiten iniciar un conjunto de procesos al/para el arranque o apagado del sistema.   
- **Runlevel 0 ⟶** HALT   
- **Runlevel 1 ⟶** Single User Mode   
- **Runlevel 2 ⟶ **Multiuser without NFS                                                                                                              * [MULTIUSUARIO]*   
- **Runlevel 3 ⟶** Full Multiuser Mode Console                                                                                                   * [MULTIUSUARIO]*   
- **Runlevel 4 ⟶** (No se utiliza, por lo general las diferentes distribuciones lo personalizan a su gusto)   * [MULTIUSUARIO]*   
- **Runlevel 5 ⟶** X11                                                                                                                                             *  [MULTIUSUARIO]*   
- **Runlevel 6 ⟶** REBOOT   
   
### /etc/inittab   
Su finalidad es dejar definidos y preparados los runlevels. Es el fichero de configuración que utiliza el proceso init para iniciar el resto del sistema.   
### Scripts RC   
La finalidad de los Scripts RC es la de gestionar el inicio y la detención de servicios durante el arranque y apagado del sistema, como se menciona en el punto sobre la función de los scripts RC en el arranque y la parada del sistema. Se almacenan en /etc/rc.d/rc   
## Systemd   
 --- 
Colección de bloques de compilación básicos para un sistema Linux. Provee un sistema y un gestor de servicios, que se ejecuta como PID 1 e inicia el resto del sistema. Entre las cosas que proporciona podemos encontrar: una notable capacidad de paralelización, la activación de socket y D-Bus para iniciar los servicios, la capacidad de iniciar **daemons **bajo demanda, realiza un control/seguimiento de los procesos con el uso de los CGROUPS, mantiene puntos de mount y automount, la implementación de un sistema de gestión de dependencias basado en un control lógico de los servicios.   
### Unit   
Hace referencia a cualquier recurso que el sistema sepa como operar/usar y gestionar/manejar ⟶ están definidos en unos archivos de configuración llamados UNIT FILES   
### SystemCTL   
Comando que permite controlar los daemons/servicios del sistema   
### Target   
Agrupación de units con puntos de sincronización para ordenar dependencias con otros unit files. Se parecen a los runlevels   
## Usuarios   
 --- 
GNU/Linux es un sistema multiusuarios. Por lo tanto, es necesario establecer una forma de distinguirlos y una jerarquía o un sistema de permisos   
### UID   
User Identifier. Es imposible que coexistan dos UIDs iguales en un sistema.   
### Root   
Es el usuario administrador del sistema. Cuenta con todos los permisos dentro de este, incluido el de editar los permisos de otros usuarios.   
## Procesos   
 --- 
Un **proceso **es un *programa en ejecución*, con el **programa **siendo *una porción de código* (secuencia de instrucciones basadas en un lenguaje de programación) *que resuelve un problema o una función específica*.   
- Un proceso es creado por otro proceso   
- Un proceso padre tiene uno o mas hijos   
   
### PID   
Process Identifier   
### PPID   
Parent Process Identifier. El proceso init/systemd no tiene PPID ya que es el proceso que inicia los demás procesos.   
### Otros atributos   
- Número NICE (indica prioridad)   
- TTY (terminal)   
- RUID   
- EUID   
- EGID   
   
El proceso puede ser **foreground **(ser dependiente del usuario), o **background **(ejecutados sin interacción del usuario)   
