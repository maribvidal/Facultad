# Parcial - Orientación a Objetos II - 06/07/2025 
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

## Ejercicio de Refactoring
Dado el siguiente código que implementa la generación de reportes
```Java
 1. public class ReportGenerator {
 2.     private String type;
 3.     public ReportGenerator(String type) { this.type = type; }
 4.
 5.     public void generateReport(Document document) {
 6.         if ("PDF".equals(type)) {
 7.             // crear documento y configurar metadatos
 8.             DocumentFile docFile = new DocumentFile();
 9.             docFile.setTitle(document.getTitle());
10.             String authors = "";
11.             for (String author : document.getAuthors()) {
12.                 authors += ", " + author;
13.             }
14.             docFile.setAuthor(authors);
15.             docFile.setContentType("application/pdf");
16.             docFile.setPageSize("A4");
17.
18.             // crear exportador y setear el contenido
19.             PDFExporter exporter = new PDFExporter();
20.             byte[] content = exporter.generatePDFFile(document);
21.             docFile.setContent(content);
22.
23.             // guardar el documento
24.             this.saveExportedFile(docFile);
25.         } else if ("XLS".equals(type)) {
26.             // crear documento y configurar metadatos
27.             DocumentFile docFile = new DocumentFile();
28.             docFile.setTitle(document.getTitle());
29.             String authors = "";
30.             for (String author : document.getAuthors()) {
31.                 authors += ", " + author;
32.             }
33.             docFile.setAuthor(authors);
34.             docFile.setContentType("application/vnd.ms-excel");
35.             docFile.setSheetName(document.getSubtitle()); // <--- Línea de la derecha
36.             // crear exportador y setear el contenido
37.             ExcelWriter writer = new ExcelWriter();
38.             byte[] content = writer.generateExcelFile(document); // <--- Línea de la derecha
39.             docFile.setContent(content); // <--- Línea de la derecha
40.
41.             // guardar el documento
42.             this.saveExportedFile(docFile); // <--- Línea de la derecha
43.         }
44.     }
// TEST
class ReportGeneratorTest {
    ReportGenerator generatorPDF;
    ReportGenerator generatorXLS;
    Document document;

    @BeforeEach
    void setup() {
        document = new Document("Informe");
        document.addAuthor("Carlos");
        document.addAuthor("Ana");
        generatorPDF = new ReportGenerator("PDF");
        generatorXLS = new ReportGenerator("XLS");
    }

    @Test
    void testPDF() {
        generatorPDF.generateReport(document);
        // aca se detallan los asserts
    }

    @Test
    void testXLS() {
        generatorXLS.generateReport(document);
        // aca se detallan los asserts
    }
}
```

### Tareas: (debe realizar los tres ítems para aprobar el tema):
1. Enumere los code smell que encuentra en el código indicando las líneas afectadas.
2. Indique que refactorings utilizará para solucionarlos considerando que se desea incluir nuevos formatos para exportar (XLSX, CSV entre otros). Explique los pasos necesarios para realizar los refactorings elegidos, haciendo referencia al código cuando corresponda. Muestre el código final resultado luego de aplicar esos refactorings en la clase ReportGenerator y si hace falta, en la clase ReportGeneratorTest.
3. Realice el diagrama de clases del código refactorizado. Si utilizó un patrón de diseño, indíquelo en el diagrama mostrando los roles del patrón.

[<Solución propuesta>](./solucion_refactoring.md)
   
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
