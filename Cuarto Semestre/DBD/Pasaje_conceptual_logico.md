# Pasaje del modelo conceptual al lógico (relacional)
 ---
### Propósito
- Volver al esquema conceptual mas parecido a la representación que entiende el Sistema de Gestion de Base de Datos.
Esta representación final está orientada al tipo de SGBD que se usará para implementar la base de datos. En este caso
es de tipo relacional, pero también podría ser orientada a objetos u de otro tipo.
### A tener en cuenta
- El modelo lógico deberá poseer la misma información que el modelo conceptual
- Si la conversión de alguna cosa en el pasaje tiene varias soluciones, se deberá
elegir aquella que "permita alcanzar los estándares de rendimientos definidos para el problema"
### Conversiones a realizar:
- **Jerarquías** --> *No pueden ser representadas con el modelo relacional*

Soluciones posibles:
1. **Eliminar las especializaciones** dejando solo la **generalización**, la cual deberá incorporar todos los atributos de sus hijos como opcionales
2. **Eliminar la generalización** dejando las **especializaciones**, teniendo que incluir los atributos del padre en sus hijos (NO aplicable para los subconjuntos)
3. **Dejar la jerarquía tal como está, y convertirla en relaciones uno a uno con sus hijos**
La cobertura de la jerarquía determina la solución viable en cada caso
- **Atributos derivados** --> Sus ventajas son la disponibilidad de información que ofrecen, y sus
desventajas son tener que ser recalculados cada vez que se modifica la información contenida
- **Ciclo de Relaciones** --> Similar al de arriba, hay que poner en una balanza si se prefiere quitar 
información redundate o mejorar la accesibilidad a la información
- **Atributos polivalentes** --> Ningún SGBD relacional permite que un atributo contenga valores
multiples determinados dinámicamente. Conviene generar una nueva entidad "posee/tiene", con una relación
*muchos a muchos*, entre la entidad que tenía el atributo compuesto y la nueva entidad
- **Atributos compuestos** --> Las SGBD en general no soportan registros de atributos simples

Soluciones posibles:
1. Generar un atributo único concatenando todos
2. Dejar los atributos simples del compuesto en la entidad
3. Generar una entidad aparte
