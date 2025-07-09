package refactoring070625;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class ReportGeneratorTest {
	ReportGenerator generatorPDF; 
	ReportGenerator generatorXLS; 
	Document document;
	
	@BeforeEach 
	void setUp() { 
		document = new Document("Informe"); 
		document.addAuthor("Carlos");
		document.addAuthor("Ana");
		generatorPDF = new ReportGenerator("PDF"); 
		generatorXLS = new ReportGenerator("XLS"); 
	}

	@Test 
	void testPDF() { 
		Assertions.assertEquals("salió bien", generatorPDF.generateReport(document));
	}
	
	@Test 
	void testXLS() { 
		Assertions.assertEquals("salió bien", generatorXLS.generateReport(document));
	}
}