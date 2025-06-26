public abstract class ReportGenerator {
  public abstract void configurarMetadatos(Document document, DocumentFile docFile);
  public abstract void setearContenido(Document document, DocumentFile docFile);

  public Document crearDocumento(Document document) {
    DocumentFile docFile = new DocumentFile();
    docFile.setTitle(document.getTitle());
    String authors = this.document.getAuthors().join(",");
    docFile.setAuthors(authors);
    return docFile;
  }

  public void generateReport(Document document) {
    DocumentFile docFile = this.crearDocumento(document);
    this.configurarMetadatos(document, docFile);
    this.setearContenido(document, docFile);
    this.saveExportedFile(docFile);
  }
}
