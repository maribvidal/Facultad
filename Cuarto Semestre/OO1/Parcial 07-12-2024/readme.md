# Parcial - Orientación a Objetos I - 07/12/2024 
Un juego de peleas permite realizar enfrentamientos entre personajes. Cadada personaje es de una especie, que puede ser
humano u orco. Además, cada personaje tiene un nombre, un nivel y habilidades distribuidas en dos aspectos: inteligencia y fuerza.
Al crear un personaje, los valores iniciales de nivel, inteligencia y fuerza son los que se indican en la siguiente tabla:

|  | Nivel | Inteligencia | Fuerza |
| ------------- | ------------- | ------------- | ------------- |
| **Humano** | 1 | 2 | 1 |
| **Orco**  | 1 | 1 | 2 |

Un personaje tiene un rol, que puede ser mago o guerrero. Los personajes siempre comienzan con uno de estos roles y se debe poder cambiar
en cualquier momento a lo largo del juego. Además, tienen un poder de ataque que es utilizado para que puedan enfrentarse entre ellos.

## <ins>Nos piden implementar la siguiente funcionalidad:</ins>

**Determinar el poder de ataque de un personaje:** El poder de ataque está definido por el rol, el momento del día y
la especie del personaje: <br>
El rol determina un **valor base**, que luego se puede incrementar según su especie y el momento del día. El
**valor base** se calcula de la siguiente manera:
- Mago: (inteligencia + nivel) * 2
- Guerrero: (fuerza * 2) + nivel + inteligencia

Además, según la especie del personaje, el **valor base** calculado por su rol, se incrementa de acuerdo al momento del día:
en el caso de los humanos, se incrementa un 40% solamente sí es de día (entre las 8 y las 20hs). En cambio,
para los orcos, se incrementa un 60% solamente sí es de noche (entre las 20 y las 8hs).

**Subir un nivel:** dado un personaje, se incrementa en 1 su nivel y se realizan mejoras en su habilidades, que dependen de su especie y
de su rol. Los humanos aumentan sus habilidades según su rol a partir del nivel 7 y los orcos aumentan sus habilidades según su rol
cada 3 niveles.

El rol define qué habilidad incrementar y cuánto es el incremento:
- Mago: aumenta la inteligencia del personaje en (3/2 * nivel)
- Guerrero: aumenta la fuerza del personaje en (nivel / 6)

**Enfrentamiento uno a uno:** dados dos personajes, y el momento del día, se determina el ganador. El personaje con
el mayor poder de ataque gana el enfrentamiento y sube de nivel. En caso de empate, ambos suben de nivel.

**Buscar oponentes de nivel similar:** dados un personaje y una colección de personajes, se quiere obtener los
personajes cuyo nivel es adecuado para un enfrentamiento parejo. Si el nivel del oponente es igual al del personaje
dado, su poder de ataque calculado a las 12 horas debe ser menor a 5. En otros casos, un oponente se considera de
nivel similar si la diferencia entre su nivel y el del personaje dado es de 2 o menos.

> **Ayudas:** Para indicar el momento del día puede utilizar un número entero (entre 0 y 23) <br>
> Para calcular el valor absoluto de un número: _int numero = Math.abs(x);_ <br>
> Para calcular el resto de una división (módulo de un número): _int modulo = x % y;_

**Tareas:** 
1. Describa el diseño de su solución utilizando un diagrama de clases UML.
2. Implemente en Java toda la funcionalidad antes descripta. Puede usar las clases implementadas en los ejercicios de la práctica: DateLapse, FilteredSet, Bag, según se requiera.
3. Diseño de los casos de prueba: Enfocándose en la funcionalidad que permite subir el nivel de un personaje (todos los métodos de todas las clases involucradas en conseguir esa funcionalidad),
determine y enumere **qué métodos** testear, **indicando clases** y casos de prueba (teniendo en cuenta los conceptos de valores de borde y particiones equivalentes).
Identifique claramente las particiones que encuentra y los valores de borde para cada caso.
4. Escriba un **ejemplo del código Java** necesario para crear un humano con rol mago que se enfrenta con un orco con rol guerrero
a las 22hs. Luego, el humano cambia su rol a guerrero y se enfrenta con el mismo orco guerrero a las 14hs.

Tenga en cuenta que las 4 tareas anteriores son **requeridas para aprobar**. No deje ninguna en blanco. 
