package ar.edu.unlp.oo1.ejercicio21;

import org.junit.jupiter.api.*;

public class BagTest {
	Bag<String> bolsa;
	
	@BeforeEach
	void setUp() {
		bolsa = new BagImpl<String>();
	}
	
	@Test
	void TestAdd() {
		bolsa.add("Pan");
		bolsa.add("Pan");
		bolsa.add("Pan");
		bolsa.add("Leche");
		
		Assertions.assertEquals(3, bolsa.occurrencesOf("Pan"));
		Assertions.assertEquals(1, bolsa.occurrencesOf("Leche"));
	}
	
	@Test
	void TestRemove() {
		// Agregar 5 unidades de ambos productos
		for (int i = 0; i < 5; i++) {
			bolsa.add("Harina");
			bolsa.add("Huevos");
		}
		
		bolsa.removeOccurrence("Harina");
		bolsa.removeOccurrence("Harina");
		bolsa.removeAll("Huevos");
		
		Assertions.assertEquals(3, bolsa.occurrencesOf("Harina"));
		Assertions.assertEquals(0, bolsa.occurrencesOf("Huevos"));
	}
}
