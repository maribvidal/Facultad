package ar.edu.unlp.info.oo1.ejercicio22_estadisticas;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

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
	
	@Test
	void contarEmailsCarpetaTest () {
		Assertions.assertEquals(0, unaCarpeta.contarEmails());
		
		unaCarpeta.agregarEmail(unEmail);
		unaCarpeta.agregarEmail(unEmail);
		unaCarpeta.agregarEmail(unEmail);
		
		Assertions.assertEquals(3, unaCarpeta.contarEmails());
	}
	
	@Test
	void categorizarEmailsTest() {
		Assertions.assertEquals(0, unaCarpeta.categorizarEmails().size());
		
		Email emailPe = new Email("titulo", "La vida está llena de momentos pequeños que, cuando se suman, nos dan grandes recuerdos. Disfruta cada día, cada paso y cada sonrisa.");
		Email emailMe = new Email("titulo", "Las pequeñas decisiones que tomamos cada día tienen un gran impacto en nuestro futuro. A veces, es fácil perderse en la rutina, pero si aprendemos a valorar los momentos simples, descubrimos que la felicidad no está en lo que tenemos, sino en cómo vivimos el presente. Aprovecha cada oportunidad que la vida te da.");
		Email emailGr = new Email("titulo", "El tiempo es un recurso valioso, pero muchas veces lo gastamos sin darnos cuenta. En la constante búsqueda de logros, es importante no perder de vista lo que realmente importa: las relaciones, los momentos compartidos y el bienestar personal. La vida no se trata de apresurarse hacia el futuro, sino de disfrutar cada etapa del camino. Si logramos estar presentes en cada instante, encontraremos la paz en medio de la incertidumbre. No dejes que el estrés te desvíe de lo que realmente te hace feliz");
		
		unaCarpeta.agregarEmail(emailPe);
		unaCarpeta.agregarEmail(emailMe);
		unaCarpeta.agregarEmail(emailGr);
		
		Assertions.assertEquals(3, unaCarpeta.categorizarEmails().size());
		Assertions.assertEquals(1, unaCarpeta.categorizarEmails().occurrencesOf("Pequeño"));
		Assertions.assertEquals(1, unaCarpeta.categorizarEmails().occurrencesOf("Mediano"));
		Assertions.assertEquals(1, unaCarpeta.categorizarEmails().occurrencesOf("Grande"));
	}
	
}
