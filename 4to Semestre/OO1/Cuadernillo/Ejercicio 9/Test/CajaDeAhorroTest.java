package ar.edu.unlp.oo1.ejercicio9;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class CajaDeAhorroTest {
	private CajaDeAhorro cajaDePrueba;
	
	@BeforeEach
	void setUp() {
		// Escrito según las especificaciones de la práctica
		cajaDePrueba = new CajaDeAhorro(400);
	}
	
	@Test
	void testDepositar() {
		// Si se deposita 200, se debería obtener 596 de saldo (400 + 200 - 200 * 0.02)
		cajaDePrueba.depositar(200);
		assertEquals(596, cajaDePrueba.getSaldo());
	}
	
	@Test
	void testExtraer() {
		// Si se extrae 100, se debería obtener 298
		cajaDePrueba.extraer(100);
		assertEquals(298, cajaDePrueba.getSaldo());
	}
	
	@Test
	void testExtraer2() {
		// No debería ser posible extraer 400
		assertEquals(false, cajaDePrueba.extraer(400));
	}
}
