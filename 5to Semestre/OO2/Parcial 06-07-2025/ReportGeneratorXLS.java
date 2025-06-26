public class ReportGeneratorXLS extends ReportGenerator {
  @Override
  public void configurarMetadatos(Document document, DocumentFile docFile) {
    docFile.contentType("application/vnd.ms-excel");
    docFile.setSheetName(document);
  }
  @Override
  public void setearContenido(Document document, DocumentFile, docFile) {
    ExcelWriter exporter = new ExcelWriter();
    byte[] content = exporter.generateExcelFile(document);
    docFile.setContent(content);
  }
}
