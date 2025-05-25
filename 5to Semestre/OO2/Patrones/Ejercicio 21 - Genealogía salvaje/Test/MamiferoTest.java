package unlp.oo2.patrones.ej21;

import java.time.LocalDate;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class MamiferoTest {
	Mamifero alexa;
	Mamifero mufasa;
	Mamifero sarabi;
	Mamifero nala;
	Mamifero melquiades;
	Mamifero elsa;
	Mamifero scar;
	
	@BeforeEach
	void setUp() throws Exception {
		alexa = new Mamifero("ALEXA", "Leon", LocalDate.now());
		mufasa = new Mamifero("MUFASA", "Leon", LocalDate.now());
		sarabi = new Mamifero("SARABI", "Leon", LocalDate.now());
		nala = new Mamifero("NALA", "Leon", LocalDate.now());
		melquiades = new Mamifero("MELQUIADES", "Leon", LocalDate.now());
		elsa = new Mamifero("ELSA", "Leon", LocalDate.now());
		scar = new Mamifero("SCAR", "Leon", LocalDate.now());
	
		alexa.setPadre(mufasa);
		alexa.setMadre(sarabi);
		
		mufasa.setMadre(nala);
		mufasa.setPadre(melquiades);
		
		sarabi.setMadre(elsa);
		sarabi.setPadre(scar);
	}
	
	@Test
	void test_inicializacion() {
		Assertions.assertTrue(alexa.getIdentificador().equals("ALEXA"));
		Assertions.assertTrue(alexa.getEspecie().equals("Leon"));
		Assertions.assertNotNull(alexa.getFechaNacimiento());
		Assertions.assertNotNull(alexa.getMadre());
		Assertions.assertNotNull(alexa.getPadre());
	}
	
	@Test
	void test_familia_alexa() {
		Assertions.assertEquals(alexa.getMadre(), sarabi);
		Assertions.assertEquals(alexa.getPadre(), mufasa);
		Assertions.assertEquals(alexa.getAbuelaMaterna(), elsa);
		Assertions.assertEquals(alexa.getAbueloMaterno(), scar);
		Assertions.assertEquals(alexa.getAbuelaPaterna(), nala);
		Assertions.assertEquals(alexa.getAbueloPaterno(), melquiades);
	}
	
	@Test
	void test_familia_mufasa() {
		Assertions.assertEquals(mufasa.getMadre(), nala);
		Assertions.assertEquals(mufasa.getPadre(), melquiades);
	}
	
	@Test
	void test_familia_sarabi() {
		Assertions.assertEquals(sarabi.getMadre(), elsa);
		Assertions.assertEquals(sarabi.getPadre(), scar);
	}
	
	@Test
	void test_tiene_como_ancestro_a() {
		Assertions.assertTrue(alexa.tieneComoAncestroA(sarabi));
		Assertions.assertTrue(alexa.tieneComoAncestroA(nala));
		Assertions.assertTrue(mufasa.tieneComoAncestroA(nala));
		
		Assertions.assertFalse(alexa.tieneComoAncestroA(alexa));
		Assertions.assertFalse(mufasa.tieneComoAncestroA(scar));
	}
	
	@Test
	void test_mamiferos_sin_padres() {
		Assertions.assertNotNull(mufasa.getPadre());
		Assertions.assertNotNull(mufasa.getMadre());
	}
	
	@Test
	void test_mamiferos_sin_abuelos() {
		Assertions.assertNotNull(sarabi.getAbuelaMaterna());
		Assertions.assertNotNull(sarabi.getAbueloMaterno());
		Assertions.assertNotNull(sarabi.getAbuelaPaterna());
		Assertions.assertNotNull(sarabi.getAbueloPaterno());
	}
}
