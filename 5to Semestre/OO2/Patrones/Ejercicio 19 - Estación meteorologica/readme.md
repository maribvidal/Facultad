# Ejercicio 19: Estación meteorológica
## Solución propuesta
![Diagrama UML](./diag_uml.png)
[Código UML](./source.uml)
### Notas
- En este ejercicio usé el patrón Decorator
- Hay que plantear un diseño que permita agregarle comportamiento dinámicamente a la clase HomeWeatherStation, y que permita cambiar en tiempo de ejecución la forma de leer la temperatura (de Fahrenheit a Celsius)
- Al igual que en el ejercicio 18, declaré en la clase que toma el rol Decorator un método que se supone que debería devolver el objeto HomeWeatherStation inicial
- Al igual que en el ejercicio 16c, hay que utilizar el patrón Builder para separar los objetos en base a si utilizan temperatura Fahrenheit o Celsisu, y para encapsular el proceso de construcción y permitir que se puedan crear mas de paso.
