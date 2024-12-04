# Teoría 6 - Tablas de Decisión (y AE...)   
# Tablas de Decisión   
 --- 
Técnica de Especificación de Requerimientos dinámica   
- Sistema visto como un conjunto de condiciones, reglas, y acciones   
- **Condiciones ⟶** Dos valores posibles (*V o F*)   
- **Reglas ⟶** Determinados conjuntos de *condiciones*   
- **Acciones ⟶**  Tomadas como resultado de las *reglas*   
   
Herramienta que permite presentar, de forma concisa, las reglas lógicas que hay que utilizar para decidir acciones a ejecutar en función de las condiciones y la lógica de decisión de un problema específico   
## Construcción de una Tabla   
 --- 
1. Identificar las **condiciones **y **acciones
***⟶ Hay 2^N reglas donde N son la cantidad de condiciones*   
2. Completar la tabla teniendo en cuenta que:
⟶ Si hay condiciones opuestas, elegir una de ellas (**tiene sed** o **no tiene sed**)
⟶ Las condiciones deben ser atómicas   
3. Colocar las reglas ⟶ *marcar lo que sucederá dadas ciertas condiciones*   
   
## Especificaciones   
 --- 
### Especificaciones completas   
Son aquellas que determinan acciones para todas las reglas posibles   
### Especificaciones redundantes   
Son aquellas que, para reglas que determinan las mismas condiciones, marcan acciones iguales   
### Especificaciones contradictorias   
Son aquellas que, para reglas que determinan las mismas condiciones, marcan acciones distintas   
   
# Análisis Estructurado   
 --- 
*Técnica de Especificación de Requerimientos estática*   
La técnica de **análisis estructurado** permite lograr una representación gráfica que permite lograr una comprensión más profunda del sistema a construir y comunicar a los usuarios lo comprendido.   
Hace énfasis en el procesamiento o la transformación de datos conforme estos pasan por distintos procesos   
## Diagrama de Flujo de Datos   
 --- 
Es una herramienta que permite visualizar un sistema como una red de procesos funcionales, conectados entre sí por “conductos” y almacenamientos de datos.   
### Elementos   
- **Entidad Externa ⟶** Es un elemento del sistema (por ejemplo, un elemento hardware, una persona, otro programa) u otro sistema que produce información para ser transformada por el software, o recibe información producida por el software   
- **Proceso ⟶** Es una transformación que es aplicada a los datos (o al control) y los modifica.   
- **Flecha ⟶** "Conducto" para uno o mas elementos de datos   
- Almacen de Datos   
   
   
