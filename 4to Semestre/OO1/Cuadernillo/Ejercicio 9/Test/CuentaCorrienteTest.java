package ar.edu.unlp.oo1.ejercicio9;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class CuentaCorrienteTest {
	private CuentaCorriente cuentaDePrueba;
	
	@BeforeEach
	void setUp() {
		// Escrito según las especificaciones de la práctica
		cuentaDePrueba = new CuentaCorriente(100);
		cuentaDePrueba.setLimiteDescubierto(500);
	}
	
	@Test
	void testDepositar() {
		// Si se deposita 200, se debería obtener 300
		cuentaDePrueba.depositar(200);
		assertEquals(300, cuentaDePrueba.getSaldo());
	}
	
	@Test
	void testExtraer() {
		// Si se extrae 100, se debería obtener 0
		cuentaDePrueba.extraer(100);
		assertEquals(0, cuentaDePrueba.getSaldo());
	}
	
	@Test
	void testExtraer2() {
		// Si se extrae 400, se debería obtener -300
		cuentaDePrueba.extraer(400);
		assertEquals(-300, cuentaDePrueba.getSaldo());
	}
}
