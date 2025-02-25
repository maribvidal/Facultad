# Ejercicio 7
| Página  | Marco |
| ------------- | ------------- |
| 0  | 3  |
| 1  | 5  |
| 2  | 2  |
| 3  | 6  |
- Tamaño de la página = 512 bytes
- Tamaño del proceso = 2000 bytes
### b) Indicar si las siguientes direcciones lógicas son correctas y en caso afirmativo indicar la dirección física a la que corresponden:
| Dir. lógicas | ¿Son correctas? | Dir. físicas |
| :---         |     :---:      |          ---: |
| 35 | 35 DIV 512 = 0 :white_check_mark: | 3 * 512 (Dir. inicial del marco) = 1536 + (35 MOD 512) = 1536 + 35 = 1571 |
| 512 | 512 DIV 512 = 1 :white_check_mark: | 5 * 512 = 2560 + (512 MOD 512) = 2560 + 0 = 2560 |
| 2051 | 2051 DIV 512 = 4 :x: | No existe la dirección |
| 0 | 0 DIV 512 = 0 :white_check_mark: | 0 * 512 = 0 + (0 MOD 512) = 0 + 0 = 0 |
| 1325 | 1325 DIV 512 = 2 :white_check_mark: | 2 * 512 = 1024 + (1325 MOD 512) = 1024 + 301 = 1325 |
| 602 | 602 DIV 512 = 1 :white_check_mark: | 5 * 512 = 2560 + (602 MOD 512) = 2560 + 90 = 2630 |
### c) Indicar, en caso de ser posible, las direcciones lógicas del proceso que se corresponden si las siguientes direcciones físicas:
| Dir. físicas | ¿Son correctas? | Dir. lógicas |
| :---         |     :---:      |          ---: |
| 509 | 509 DIV 512 = 0 :x: (No hay marco 0 asignado) | |
| 1500 | 1500 DIV 512 = 2 :white_check_mark: | 2 * 512 = 1024 + (1500 MOD 512) = 1024 + 476 = 1500 |
| 0 | 0 DIV 512 = 0 :x: | |
| 3215 | 3215 DIV 512 = 6 :white_check_mark: | 3 * 512 = 1536 + (3215 MOD 512) = 1536 + 143 = 1679 |
| 1024 | 1024 DIV 512 = 2 :white_check_mark: | 2 * 512 = 1024 + (1024 MOD 512) = 1024 + 0 = 1024 |
| 2000 | 2000 DIV 512 = 3 :white_check_mark: | 0 * 512 = 0 + (2000 MOD 512) = 0 + 464 = 464 |
### d) ¿Indique, en caso que se produzca, la fragmentación (interna y/o externa)?
Se produce fragmentación interna en la última página ya que el proceso ocupa 2000 bytes y no cubre el espacio total asignado

# Ejercicio 12
**Tabla de Segmentos**
| Núm. Seg. | Dir. base |
| ------------- | ------------- |
| 1  | 500 |
| 2  | 1500 |
| 3  | 5000 |

**Tabla de Páginas**
| Nro. Segmento | Nro. Pagina | Direc. Base |
| :---: | :---: | :---: |
| 1 | 1 | 40 |
|  | 2 | 80 |
| | 3 | 60 |
| 2 | 1 | 20 |
|  | 2 | 25 |
| | 3 | 0 |
| 3 | 1 | 120 |
|  | 2 | 150 |

### Indicar las direcciones físicas correspondientes a las siguientes direcciones lógicas (segmento, página, desplazamiento):
_i._ (2, 1, 1) = 1500 + 20 + 1 = 1521 dirección física

_ii._ (1, 3, 15) = 100 + 60 + 15 = 575 dirección física

_iii._ (3, 1, 10) = 5000 + 120 + 10 = 5130 dirección física

_iv._ (2, 3, 5) = 1500 + 0 + 10 = 1510 dirección física

# Ejercicio 22
> Considere la siguiente secuencia de referencias de páginas:
> 1, 2, 15, 4, 6, 2, 1, 5, 6, 10, 4, 6, 7, 9, 1, 6, 12, 11, 12, 2, 3, 1, 8, 1, 13, 14, 15, 3, 8
### a) Si se disponen de 5 marcos. ¿Cuántos fallos de página se producirán si se utilizan las siguientes técnicas de selección de victima? (Considere una política de Asignación Dinámica y Reemplazo Global) 
### b) Suponiendo que cada atención de un fallo se pagina requiere de 0,1 seg. Calcular el tiempo consumido por atención a los fallos de páginas para los algoritmos de a).
[Hoja de cálculo](https://docs.google.com/spreadsheets/d/1t6GM4KzfgfnYHzuUT8jnqyzMsfqQnDDgl5KjdX0Za3k/edit?usp=sharing)
- Para la política óptima solo reemplazo páginas que no se van a referenciar mas en la secuencia del enunciado, no elijo un orden en específico.

# Ejercicio 23
### a) Considerando una política de Asignación Dinámica y Reemplazo Global y disponiéndose de 7 marcos. ¿Cuántos fallos de página se producirán si se utiliza la técnica de selección de victimas:
[Hoja de cálculo](https://docs.google.com/spreadsheets/d/1jyAGcAUN0EpElvmZC1--XCiQgSqdpCIK35bscIpPRnw/edit?usp=sharing)
- Me basé un poco en lo que hizo agusrnfr para hacerlo pero no me quedó igual, quizás esté mal
### b) b) Considerando una política de Asignación Fija con reparto equitativo y Reemplazo Local y disponiéndose de 9 marcos. ¿Cuántos fallos de página se producirán si se utiliza la técnica de selección de victimas:
Al ser reparto equitativo, a cada proceso le corresponden 3 marcos:
[Hoja de cálculo](https://docs.google.com/spreadsheets/d/14MEAWKUK2bZuCWv58_Or6p6HJegy5fWqpwvBKZvXDW0/edit?usp=sharing)

# Ejercicio 29
### a) ¿Qué es?
La anomalía de Belady es una situación en la que se obtienen mas fallos de página al aumentar el número de marcos disponibles en la RAM, y ocurre específicamente con la política de reemplazo FIFO.
> Dada la siguiente secuencia de referencias a paginas:
> 3, 2, 1, 0, 3, 2, 4, 3, 2, 1, 0, 4
### I. Calcule la cantidad de fallos de páginas si se cuentan con 3 marcos y se utiliza el algoritmo de reemplazo FIFO
### II. Calcule la cantidad de fallos de páginas si se cuentan con 4 marcos y se utiliza el algoritmo de reemplazo FIFO
[Hoja de cálculo](https://docs.google.com/spreadsheets/d/1A3t0kNh3H7WabS1i7ctRhpk2cF3Rgh-aLYgYSUDOhR0/edit?usp=sharing)
