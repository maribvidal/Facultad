package ar.edu.unlp.oo1.Ejercicio13;

import org.junit.jupiter.api.*;

public class EmailTest {
	Email unEmail;
	Archivo unArchivo;
	Archivo otroArchivo;
	Archivo tercerArchivo;
	
	@BeforeEach
	void setUp() {
		unEmail = new Email("Reportes 2023", "Listado de reportes médicos de la empresa del último año");
		
		unArchivo = new Archivo("Encefalograma");
		otroArchivo = new Archivo("Audiometria");
		tercerArchivo = new Archivo("Hemograma");
		
		unEmail.adjuntos().add(unArchivo);
		unEmail.adjuntos().add(otroArchivo);
		unEmail.adjuntos().add(tercerArchivo);
	}
	
	@Test
	void emailTestGeneral() {
		Assertions.assertEquals("Reportes 2023", unEmail.getTitulo());
		Assertions.assertEquals("Listado de reportes médicos de la empresa del último año", unEmail.getCuerpo());
	}
	
	@Test
	void tamañoTest() {
		// 13 + 56 + 13 + 11 + 9
		Assertions.assertEquals(102, unEmail.tamaño());
	}
	
	@Test
	void tieneTexto() {
		Assertions.assertTrue(unEmail.tieneTexto("reportes"));
		Assertions.assertFalse(unEmail.tieneTexto("ondas electromagnéticas"));
	}
}
