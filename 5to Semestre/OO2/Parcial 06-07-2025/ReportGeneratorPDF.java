public class ReportGeneratorPDF extends ReportGenerator {
  @Override
  public void configurarMetadatos(Document document, DocumentFile docFile) {
    docFile.contentType("application/pdf");
    docFile.setPageSize("a4");
  }
  @Override
  public void setearContenido(Document document, DocumentFile, docFile) {
    PDFExporter exporter = new PDFExporter();
    byte[] content = exporter.generatePDFFile(document);
    docFile.setContent(content);
  }
}
