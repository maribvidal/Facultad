package ar.edu.unlp.oo1.Ejercicio13;

import org.junit.jupiter.api.*;

public class CarpetaTest {
	Carpeta unaCarpeta;
	Carpeta otraCarpeta;
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
		
		unaCarpeta = new Carpeta("Reportes");
		otraCarpeta = new Carpeta("Temporal");
	}
	
	@Test
	void carpetaTestGeneral() {
		Assertions.assertEquals("Reportes", unaCarpeta.getNombre());
	}
	
	@Test
	void buscarEmailTest() {
		unaCarpeta.agregarEmail(unEmail);
		Assertions.assertNotNull(unaCarpeta.buscarEmail("Reportes 2023"));
		Assertions.assertNull(otraCarpeta.buscarEmail("Reportes 2023"));
	}
	
	@Test
	void tamañoTotalTest() {
		unaCarpeta.agregarEmail(unEmail);
		unaCarpeta.agregarEmail(unEmail);
		Assertions.assertEquals(204, unaCarpeta.tamañoTotal());
		Assertions.assertEquals(0, otraCarpeta.tamañoTotal());
	}
	
	@Test
	void moverTest() {
		unaCarpeta.agregarEmail(unEmail);
		unaCarpeta.mover(unEmail, otraCarpeta);
		Assertions.assertEquals(0, unaCarpeta.tamañoTotal());
		Assertions.assertEquals(102, otraCarpeta.tamañoTotal());
	}
}
