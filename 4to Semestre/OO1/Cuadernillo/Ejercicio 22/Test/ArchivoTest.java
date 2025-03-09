package ar.edu.unlp.info.oo1.ejercicio22_estadisticas;

import org.junit.jupiter.api.*;

public class ArchivoTest {
	Archivo unArchivoConNombre;
	Archivo unArchivoVacio;
	
	@BeforeEach
	void setUp() {
		unArchivoConNombre = new Archivo("Encefalograma");
		unArchivoVacio = new Archivo("");
	}
	
	@Test
	void tamañoTest() {
		Assertions.assertEquals(13, unArchivoConNombre.tamaño());
		Assertions.assertEquals(0, unArchivoVacio.tamaño());
	}
}
