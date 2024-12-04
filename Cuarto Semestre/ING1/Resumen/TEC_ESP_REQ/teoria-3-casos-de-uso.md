# Teoría 3 - Casos de Uso   
La especificación de requerimientos es crucial en el desarrollo de software. Los casos de uso son una herramienta fundamental para capturar los requisitos de un sistema y traducirlos en acciones.   
**Especificación de Requerimientos ⟶** Proceso de definir qué debe hacer el software y qué limitaciones debe tener   
## Casos de uso   
 --- 
Proceso de modelado de las "funcionalidades" del sistema en término de los eventos que interactúan entre los usuarios y el sistema ⟶ tiene su origen en el modelado orientado a objetos   
### ¿Qué ventajas tiene?   
- Capturar requerimientos funcionales   
- Descomponer el alcance del sistema en piezas más manejables   
- Medio de comunicación con los usuarios   
- Utiliza lenguaje común y fácil de entender por las partes   
- Permite estimar el alcance del proyecto y el esfuerzo a realizar   
- Define una línea base para la definición de los planes de prueba   
- Define una línea base para toda la documentación del sistema   
- Proporciona una herramienta para el seguimiento de los requisitos   
   
## Componentes   
 --- 
**Caso de Uso ⟶ **Representación de un objetivo individual del sistema. Describe la secuencia de actividades y de interacciones para alcanzar dicho objetivo   
- Debe representar UNA funcionalidad concreta   
- El uso de condicionales en el curso normal es limitado a la invocación de excepciones, ya que este flujo representa la ejecución del caso sin alteraciones   
- Los "uses" deben ser accedidos por al menos desde dos CUs   
   
**Actor ⟶ **Elemento que inicia una actividad (CU) en el sistema   
- Representa un rol   
- Puede ser una persona, sistema externo o dispositivo externo que dispare un evento   
   
**Diagrama de CU ⟶** Ilustra las interacciones entre el sistema y los actores   
**Escenario ⟶** Descripción de la interacción entre el actor y el sistema para realizar la funcionalidad. Describe escenarios alternativos también.   
**Relaciones ⟶** Los tipos de interacciones que pueden ocurrir en el diagrama   
- **Asociaciones ⟶** Relación entre un actor y un CU en el que interactúan entre sí   
    - *Si la flecha que va desde el actor hasta el CU apunta hacia este último, entonces el que inició la actividad fue ese actor*   
    - *Si la flecha no tiene dirección, entonces esa actividad meramente interactua con ese actor*   
- Extensiones (Extends) ⟶   
- **Uso o Inclusión (Uses) ⟶** Reduce la redundancia entre dos CUs al combinar los pasos comunes de los CUs   
- **Herencia ⟶** Relación entre actores donde un actor hereda las funcionalidades de unos o varios actores   
   
## Plantilla de un Escenario   
 --- 
|  **Nombre del CU** |                                                                                                                       Debe comenzar con un verbo y representar la meta del CU |
|:-------------------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|    **Descripción** |                                                                                                                              Descripción corta y precisa del propósito del CU |
|        **Actores** |                                                                                                                                  Actores principales que se benefician del CU |
| **Precondiciones** |                                                                                                             Restricciones del estado del sistema antes de la ejecución del CU |
|   **Curso Normal** |     Secuencia normal y exitosa realizada por los actores y el sistema (Acción del Actor / Acción del Sistema) Debería ser como una *conversación *entre el actor y el sistema |
|  **Curso Alterno** |                                                                                               Describe el comportamiento si ocurre una excepción o variación del curso típico |
|  **Postcondición** |                                                                                                  Restricción del estado del sistema después de la finalización exitosa del CU |

