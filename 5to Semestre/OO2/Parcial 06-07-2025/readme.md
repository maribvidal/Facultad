# Parcial - Orientación a Objetos II - 06/17/2025 
## Ejercicio de Patrones
Se quiere mejorar un sistema de envíos de paquetes que permite registrar los paquetes enviados y calcular sus costos.<br>
De los paquetes se conoce: el valor declarado, la dirección de destino, el destinatario y una descripción, como puede verse en el diagrama UML. El costo de envío es el 5% del valor declarado.

<p align="center">
    <img src="https://github.com/maribvidal/Facultad/blob/main/5to%20Semestre/OO2/Parcial%2006-07-2025/diag_uml_enun.png" alt="Diagrama UML Enunciado">
</p>

Se plantea la incorporación de servicios adicionales para personalizar la entrega, mejorando la seguridad, velocidad en el envío o manejo especial del paquete, sin modificar la clase Paquete mencionada anteriormente, pero permitiendo que la clase pueda implementar una interfaz en caso de ser necesario.<br>
Los servicios adicionales que se quieren implementar son:
- **Con seguro:** Incrementa el costo de envío en un 20% del valor declarado y agrega la nota "con seguro" a la descripción.
- **Con seguimiento en tiempo real:** permite que el cliente siga el trayecto en tiempo real. Esto incrementa el costo de envío en 2000 pesos, pero no modifica la descripción.
- **Entrega exprés:** Incrementa el costo de envío en un 50% del valor declarado y agrega la nota "entrega express" a la descripción.
- **Manipulación frágil:** No incrementa el costo, pero agrga la nota "frágil" a la descripción.

Se pide que los servicios puedan combinarse libremente.
Por ejemplo, un paquete descrito como una "Caja de libros" con un valor declarado de $20.000 que incluye los servicios adicionales de seguro ($4.000) y entrega express ($10.000), resulta en
- Costo de envío: 5%: 1.000
- Seguro 20% de 20.000: $4.000
- Entrega express 50% de 20.000: $ 10.000
- Costo final del envio: $ 15.000
y la descripción de "Caja de libros con seguro entrega express"

### Tareas (debe realizar los cuatro ítems para aprobar el tema):
1. Realice un diagrama UML de clases para su solución al problema planteado.
2. Indique claramente en el diagrama UML el o los patrones de diseño que utiliza en el modelo y el rol que cada clase cumple en cada uno.
3. Implemente su solución en Java
4. Escriba un test que muestre cómo instanciar y utilizar su solución para el caso de la "Caja de libros" con los servicios detallados anteriormente.

[<Solución propuesta>](./solucion_patrones.md)<br>
## Ejercicio de Frameworks
Consideremos una parte del framework SingleThreadTCPServer que permite construir servidores TCP en Java. El framework define el método _handleClient_ que se encarga de leer los mensajes que envía el cliente, procesarlos y responder.

<p align="center">
    <img src="https://github.com/maribvidal/Facultad/blob/main/5to%20Semestre/OO2/Parcial%2006-07-2025/diag_uml_enun_fram.png" alt="Diagrama UML Enunciado Frameworks">
</p>

```Java
1. private final void handleClient(Socket clientSocket) {
2.  try {
3.      PrintWriter out = new PrintWriter(clientSocket.getOutputStream(), true);
4.      BufferedReader in = new BufferedReader(
5.                              new InputStreamReader(clientSocket.getInputStream()));
6.      String line;
7.      while ((line = in.readLine()) != null) {
8.          System.out.println("Received message: + " inputLine
9.              + " from " + clientSocket.getInetAddress().getHostAddress()
10.             + ":" + clientSocket.getPort());
11.
12.         if (line.isEmpty()) break;
13.         this.handleMessage(line, out);
14.     }
15.     System.out.println("Connection closed with " + clientSocket.getInetAddress().getHostAddress()
16.         + ":" + clientSocket.getPort());
17.
18. } catch (IOException e) {
19.     System.err.println("Error: " + e.getMessage());
20. } finally {
21.     try {
22.         clientSocket.close();
23.     } catch (IOException.ignored) {}
24. }
25.}
```

### Tareas (debe realizar los cuatro ítems para aprobar el tema):
1. Explique brevemente cuáles son los frozen spots y hot spot del código presentado del framework
2. Modificar este framework para permitir personalizar los mensajes que se muestran en consola por defecto cuando un cliente se conecta y se desconecta
3. Explique brevemente cuales son los frozen spot y hot spot después de la extensión realizada
4. Indique en dónde se produce la inversión de control en la extensión realizada
   
[<Solución propuesta>](./solucion_frameworks.md)
