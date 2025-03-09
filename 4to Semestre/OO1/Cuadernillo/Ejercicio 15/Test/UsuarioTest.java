package ar.edu.unlp.oo1.ejercicio15;

import org.junit.jupiter.api.*;

public class UsuarioTest {
	Usuario unUsuario;
	
	@BeforeEach
	void setUp() {
		unUsuario = new Usuario("Truxton");
	}
	
	@Test
	void TestGeneral() {
		Assertions.assertNull(unUsuario.obtenerUltimoConsumo());
		
		unUsuario.consumir(15, 10);
		unUsuario.consumir(10, 5);
		unUsuario.consumir(5, 1);
		
		Assertions.assertEquals(5, unUsuario.obtenerUltimoConsumo().getEnergiaActiva());
		Assertions.assertEquals(3, unUsuario.getDomicilio().size());
	}
}
