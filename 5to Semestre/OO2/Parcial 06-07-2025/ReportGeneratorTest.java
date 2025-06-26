class ReportGeneratorTest {
  ReportGeneratorPDF generatorPDF;
  ReportGeneratorXLS generatorXLS;
  Document document;

  @BeforeEach
  void setUp() {
    document = new Document("informe");
    document.addAuthor("carlos");
    document.addAuthor("ana");
    generatorPDF = new ReportGeneratorPDF();
    generatorXLS = new ReportGeneratorXLS();
  }
  ... // Lo demás igual
}
