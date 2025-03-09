package ar.edu.unlp.oo1.ejercicio15;

import java.time.LocalDate;

import org.junit.jupiter.api.*;

public class FacturaTest {
	Factura unaFactura;
	Usuario unUsuario;
	double precioKwh = 10; //Esto sería proveido por el CuadroTarifario
	
	@BeforeEach
	void setUp() {
		unUsuario = new Usuario("Truxton");
		unaFactura = new Factura(unUsuario, precioKwh);
	}
	
	@Test
	void getFechaEmisionTest() {
		Assertions.assertEquals(LocalDate.now(), unaFactura.getFechaEmision());
	}
	
	@Test
	void calcularMontoFinalTest() {
		Assertions.assertThrows(NullPointerException.class, ()->unaFactura.calcularMontoFinal());
		
		unUsuario.consumir(0, 10);
		
		Assertions.assertEquals(0, unaFactura.calcularMontoFinal());
		
		unUsuario.consumir(50, 15); //fpe > 0.8
		
		Assertions.assertNotEquals(45, unaFactura.calcularMontoFinal());
	}
}
