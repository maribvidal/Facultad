package unlp.oo2.patrones.ej20;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import unlp.oo2.patrones.ej11.TopografiaAgua;

public class PersonajeTest {
	SistemaJuego juego;
	Personaje guerrero, arquero, mago, thoor;
	
	@BeforeEach
	void setUp() throws Exception {
		juego = new SistemaJuego();
		guerrero = juego.crearPersonaje(new PersonajeGuerreroBuilder());
		arquero = juego.crearPersonaje(new PersonajeArqueroBuilder());
		mago = juego.crearPersonaje(new PersonajeMagoBuilder());
		thoor = juego.crearPersonaje(new PersonajeThorBuilder());
	}
	
	@Test
	void test_inicializacion() {
		// Falta por controlar que el personaje Guerrero
		// haya sido creado con los elementos correspondientes
		// ¿tendría que usar un Test Spy o Mock Object?
		Assertions.assertTrue(guerrero.getVida() == 100);
	}
	
	@Test
	void test_arquero_ataca() {
		arquero.enfrentar(thoor);
		Assertions.assertEquals(97, thoor.getVida());
		arquero.enfrentar(guerrero);
		Assertions.assertEquals(98, guerrero.getVida());
		arquero.enfrentar(mago);
		Assertions.assertEquals(95, mago.getVida());
		arquero.enfrentar(arquero);
		Assertions.assertEquals(95, arquero.getVida());
	}
	
	@Test
	void test_guerrero_ataca() {
		guerrero.enfrentar(thoor);
		Assertions.assertEquals(95, thoor.getVida());
		guerrero.enfrentar(arquero);
		Assertions.assertEquals(92, arquero.getVida());
		guerrero.enfrentar(mago);
		Assertions.assertEquals(92, mago.getVida());
		guerrero.enfrentar(guerrero);
		Assertions.assertEquals(97, guerrero.getVida());
	}
	
	@Test
	void test_mago_ataca() {
		mago.enfrentar(thoor);
		Assertions.assertEquals(99, thoor.getVida());
		mago.enfrentar(arquero);
		Assertions.assertEquals(98, arquero.getVida());
		mago.enfrentar(guerrero);
		Assertions.assertEquals(99, guerrero.getVida());
		mago.enfrentar(mago);
		Assertions.assertEquals(98, mago.getVida());
	}
	
	@Test
	void test_thoor_ataca() {
		thoor.enfrentar(thoor);
		Assertions.assertEquals(95, thoor.getVida());
		thoor.enfrentar(arquero);
		Assertions.assertEquals(94, arquero.getVida());
		thoor.enfrentar(guerrero);
		Assertions.assertEquals(96, guerrero.getVida());
		thoor.enfrentar(mago);
		Assertions.assertEquals(94, mago.getVida());
	}
	
	@Test
	void test_personaje_no_tiene_vida() {
		// Realizar esta acción 13 veces (13 * 8 = 104)
		for (int i = 0; i < 13; i++)
			guerrero.enfrentar(arquero);
		// Comprobar que se lanza una excepción cuando
		// el personaje ya no tiene mas vida
    	RuntimeException thrown = Assertions.assertThrows(
    			RuntimeException.class,
    			() -> guerrero.enfrentar(arquero),
    			"El personaje guerrero no puede seguir atacando"
    		);
	}
}
