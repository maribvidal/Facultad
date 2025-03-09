# Herencia   
 --- 
Propiedad que poseen las clases de poder acceder a los datos y el comportamiento asociados a una superclase   
Las **subclases ***heredan *el contenido de las **superclases**, el comportamiento y los datos asociados con las primeras clases siempre serán una **extensión **de las propiedades asociadas con las segundas clases.   
- La herencia es **transitiva **(si C es hijo de la clase B, y a su vez B es hijo de la clase A, entonces…)   
- La prueba "es-un" sirve como regla general para ver si tiene sentido hacer a la clase B hija de A   
   
### Razones para usar herencia   
- **Como forma de reutilizar código ⟶** Ahorro   
- **Como forma de reutilizar conceptos ⟶** Polimorfismo / implementación de métodos abstractos   
   
### Principio de sustitución (de Liskov)
Dado que una clase hijo comparte todos los *miembros *(datos y comportamiento) que posee la clase padre, si se reemplazara la referencia de instancia de una clase padre por la de una clase hijo en una variable, y se procediera a ejecutar el código, esto debería ser *indistinguible*   
### Subtipo (subtype) ⟶ *Clase que cumple con el principio de sustitución con respecto a otra clase*   
## Formas de herencia comunes   
 --- 
### Especialización   
La clase hija es una forma especializada de la clase padre (solo agrega variables y métodos)   
### Especificación   
La clase padre no hace mucho mas que limitarse a definir como deben ser sus clases hijas (a la clase hija no se la piensa como una extensión de la clase padre, si no como a la "*concretación" *de una clase abstracta ⟶ **clase abstracta de especificación**)   
### Generalización   
En vez de ser una especialización de la clase padre, la clase hija expande el comportamiento (modifica métodos heredados) de la clase padre para ser un tipo de objeto mas general (por lo gral. solo se usa cuando no queremos o podemos modificar toda la jerarquía de clases previas)   
### Extensión   
Similar a la de especialización, con el detalle de que los métodos no tienen que tener mucha relación con los del padre   
## Ventajas   
 --- 
- Reusabilidad de Software   
- Reutilización de código   
- Consistencia de interfaz   
- Encapsulamiento de información   
   
## Desventajas   
 --- 
- Tamaño del programa   
- Complejidad del programa 
