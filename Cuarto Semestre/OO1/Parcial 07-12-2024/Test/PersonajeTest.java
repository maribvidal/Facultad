package parcial.segundaFecha;

// Incompleto

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class PersonajeTest {
	IRol mago;
	IRol guerrero;
	
	Personaje circe;
	Personaje odiseo;
	Personaje polifemo;
	Personaje nadie;
	
	@BeforeEach
	void setUp() {
		mago = new Mago();
		guerrero = new Guerrero();
		
		circe = new Humano("Circe", mago);
		odiseo = new Humano("Odiseo", guerrero);
		polifemo = new Orco("Polífemo", mago);
		nadie = new Orco("Nadie", guerrero);
	}
	
	@Test
	void test_inicializacion() {
		// Comprobar la construcción de los humanos y orcos
		Assertions.assertEquals(1, circe.getNivel());
		Assertions.assertEquals(2, circe.getHabilidad().getInteligencia());
		
		Assertions.assertEquals(1, nadie.getNivel());
		Assertions.assertEquals(2, nadie.getHabilidad().getFuerza());
	}
	
	@Test
	void test_determinarPoderAtaque_humano() {
		// PARTICION NO.1: Es de día
		double valorMago = (2 + 1) * 2;
		double valorGuerrero = (1 * 2) + 1 + 2;
		Assertions.assertEquals(valorMago * 1.4, circe.determinarPoderAtaque(12));
		Assertions.assertEquals(valorGuerrero * 1.4, odiseo.determinarPoderAtaque(12));
		
		// PARTICION NO.2: Es de noche
		Assertions.assertNotEquals(valorMago * 1.4, circe.determinarPoderAtaque(21));
		Assertions.assertEquals(valorGuerrero, odiseo.determinarPoderAtaque(21));
	}
	
	@Test
	void test_determinarPoderAtaque_orco() {
		// PARTICION NO.1: Es de noche
		double valorMago = (1 + 1) * 2;
		double valorGuerrero = (2 * 2) + 1 + 1;
		Assertions.assertEquals(valorMago * 1.6, polifemo.determinarPoderAtaque(21));
		Assertions.assertEquals(valorGuerrero * 1.6, nadie.determinarPoderAtaque(21));
		
		// PARTICION NO.2: Es de día
		Assertions.assertNotEquals(valorMago * 1.6, circe.determinarPoderAtaque(12));
		Assertions.assertEquals(valorGuerrero, odiseo.determinarPoderAtaque(12));
	}
	
	@Test
	void test_subirNivel_humano() {
		// PARTICION NO.1: Nivel menor a 7 (no se modifican las habilidades) (rol mago)
		
		double valorViejo = circe.getHabilidad().getInteligencia();
		// Subirle el nivel 5 veces para que sea 6 (valor de borde)
		for (int i = 0; i < 5; i++) { circe.subirNivel(); }
		Assertions.assertEquals(valorViejo, circe.getHabilidad().getInteligencia());
		
		// PARTICION NO.2: Nivel mayor o igual a 7 (se modifican las habilidades) (rol guerrero)
		
		for (int i = 0; i < 6; i++) { odiseo.subirNivel(); } // Nivel = 7
		Assertions.assertEquals(1 + (7 / 6), odiseo.getHabilidad().getFuerza());
	}
	
	@Test
	void test_subirNivel_orco() {
		// PARTICION NO.1: Nivel no múltiplo de 3 (no se modifican las habilidades) (rol guerrero)
		
		double valorViejo = nadie.getHabilidad().getFuerza();
		nadie.subirNivel(); // Nivel = 2
		Assertions.assertEquals(valorViejo, nadie.getHabilidad().getFuerza());
		
		// PARTICION NO.2: Nivel múltiplo de 3 (se modifican las habilidades) (rol mago)
		
		polifemo.subirNivel();
		polifemo.subirNivel(); // Nivel = 3
		Assertions.assertEquals(1 + (3/2 * 3), polifemo.getHabilidad().getInteligencia());
	}
}
