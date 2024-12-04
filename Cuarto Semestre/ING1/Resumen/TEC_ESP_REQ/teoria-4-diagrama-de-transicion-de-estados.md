# Teoría 4 - Diagrama de Transición de Estados   
# Técnicas de Especificación de Requerimientos   
 --- 
- **Estáticas ⟶** se describe al sistema A TRAVÉS de las entidades / objetos, sus atributos y sus relaciones   
    - Ejemplo: Diagrama Entidad-Relación   
- **Dinámicas ⟶** A diferencia del anterior, describe como las relaciones CAMBIAN CON EL TIEMPO. Se describe como cambia el sistema a lo largo del tiempo. Considera un sistema en función de los cambios que ocurren a lo largo del tiempo, como cambia el estado particular frente a la reacción a un ESTÍMULO.   
    - Ejemplo: Diagrama de Transición de Estados, Redes de Petri, Casos de Uso   
   
# Diagrama de Transición de Estados   
 --- 
## Máquina de Estado Finito   
Visión de un sistema como conjunto de estados donde el sistema reacciona a ciertos eventos posibles (internos o externos)   
- Se pueden pensar como funciones tal que    

$$
f(Si,Cj)=Sk
$$
   
Al estar en estado Si, la ocurrencia del evento Cj hace que el sistema cambie al estado Sk   
- Convención: los estados tendrán nombres en gerundio   
   
## Representaciones   
- Diagrama de Persianas   
- Diagrama de Transición de Estados   
   
**Transición ⟶ **Relación entre dos estados unidos por una flecha, identificando a una situación particular en un estado primario donde se realizará una acción específica y que pasará a un estado segundo, cuando ocurra un evento y se cumplan unas condiciones específicas   
**Acción ⟶ **Operación atómica, que no se puede interrumpir por un evento y que se ejecuta hasta su finalización   
**Evento ⟶** Ocurrencia que puede causar la transición de un estado a otro   
# Para construir un DTE   
 --- 
1. Identificar los ESTADOS   
2. Descomponer los estados complejos   
3. Identificar el ESTADO INICIAL   
4. Identificar los CAMBIOS de ESTADO con flechas   
5. Analizar CONDICIONES y ACCIONES para pasar de un estado a otro   
6. Verificar la CONSISTENCIA del diagrama   
    - En cada estado, asegurarse de que el sistema responda a todas las condiciones posibles   
    - Alcanzar y salir de, definir todos los estados   
