# Ejercicio de Frameworks: Extender SingleThreadTCPServer
## Solución propuesta
1. **Explique brevemente cuáles son los frozen spots y hot spot del código presentado del framework** <br>Los frozen spot y los hot spot son, por definición, los elementos invariables y variables, respectivamente, en cuanto a funcionalidad que posee un framework. Los hot spot puden ser desde un método hasta una clase, lo fundamental es que sea una pieza de código modificable o extendible. <br>&emsp;Teniendo esto en cuenta, el único hot spot presente, dentro del método _handleClient(...)_, es el método abstracto _handleMessage(...)_, que permite a un desarrollador especializar la clase SingleThreadTCPServer y meterle, o agregarle, el comportamiento deseado. Como todo lo demás permanece inalterable, todas las sentencias y métodos que aparecen, serían los frozen spots.<br>
2. **Modificar este framework para permitir personalizar los mensajes que se muestran en consola por defecto cuando un cliente se conecta y se desconecta**
```Java
x. public class SingleThreadTCPServer {
x.   ...
x.   public abstract string connectionClosedMessage(Socket clientSocket);
x.   public abstract string receivedMessage(Socket clientSocket);
x.   ...
1.   private final void handleClient(Socket clientSocket) {
2.      try {
x.          ...
7.          while ((line = in.readLine()) != null) {
8.             System.out,println(this.receivedMessage(clientSocket));
x.             ...
14.         }
15.         System.out.println(this.connectionClosedMessage(clientSocket));
18.     }
x.     ...
25. }
```
3. **Explique brevemente cuales son los frozen spot y hot spot después de la extensión realizada** <br>Luego de la extensión realizada, los hot spot serían los siguientes métodos: _connectionClosedMessage(Socket clientSocket)_, _receivedMessage(Socket clientSocket)_, _handleMessage(Sring message, PrintWriter out)_. Los frozen spot serían todos los demás.
4. **Indique en dónde se produce la inversión de control en la extensión realizada** <br> La inversión de control ocurriría cuando el método llama a los hook methods para que realicen una tarea del programa. Aquí se produciría una IoC al depender de las implementaciones del usuario del framework para poder realizar dichas tareas (los hot spots).
