package parcial2025;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class PaqueteTest {
	Paquete paquete;
	
	@BeforeEach
	void setUp() {
		paquete = new Paquete("Caja de libros", "Moliere", "Rue de Richelieu", 20000);
	}
	
	@Test
	void test_inicializacion() {
		Assertions.assertEquals(1000, paquete.getCostoEnvio());
	}
	
	@Test
	void test_caja_libros() {
		PaqueteConSeguro paqSeguro = new PaqueteConSeguro(paquete);
		Assertions.assertEquals("Caja de libros con seguro", paqSeguro.getDescripcion());
		Assertions.assertEquals(5000, paqSeguro.getCostoEnvio());
		
		PaqueteExpres paqExpresConSeguro = new PaqueteExpres(paqSeguro);
		Assertions.assertEquals("Caja de libros con seguro entrega express", paqExpresConSeguro.getDescripcion());
		Assertions.assertEquals(15000, paqExpresConSeguro.getCostoEnvio());
	}
}
