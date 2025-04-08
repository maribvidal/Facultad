package unlp.oo2.patrones.ej5;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class DecodificadorTest {
	Decodificador decodificador;
	ISugeridor sugeridorNovedad, sugeridorPuntaje, sugeridorSimilaridad;
	Pelicula capitanAmerica, dunkirk, ironMan, rambo, rocky, thor;
	
	@BeforeEach
	void setUp() {
		// Voy a seguir el ejemplo del cuadernillo
		capitanAmerica = new Pelicula("Capitan América", 2016, null, 7.8);
		dunkirk = new Pelicula("Dunkirk", 2017, null, 7.9);
		ironMan = new Pelicula("Iron Man", 2010, null, 7.9);
		rambo = new Pelicula("Rambo", 1979, null, 7.8);
		rocky = new Pelicula("Rocky", 1976, null, 8.1);
		thor = new Pelicula("Thor", 2007, null, 7.8);
		
		//thor.agregarPeliculaSimilar(capitanAmerica);
		//thor.agregarPeliculaSimilar(ironMan);
		
		//capitanAmerica.agregarPeliculaSimilar(thor);
		capitanAmerica.agregarPeliculaSimilar(ironMan);
		
		//ironMan.agregarPeliculaSimilar(thor);
		ironMan.agregarPeliculaSimilar(capitanAmerica);
		
		//rocky.agregarPeliculaSimilar(rambo);
		//rambo.agregarPeliculaSimilar(rocky);
		
		sugeridorNovedad = new SugeridorNovedad();
		sugeridorPuntaje = new SugeridorPuntaje();
		sugeridorSimilaridad = new SugeridorSimilaridad();
		
		decodificador = new Decodificador(null, sugeridorNovedad);
		
		//decodificador.agregarPelicula(thor);
		decodificador.agregarPelicula(capitanAmerica);
		decodificador.agregarPelicula(ironMan);
		decodificador.agregarPelicula(dunkirk);
		//decodificador.agregarPelicula(rocky);
		decodificador.agregarPelicula(rambo);
	}
	
	@Test
	void test_inicializar() {
		// Si al decodificador no se le pasa ninguna lista de películas, igualmente creará una
		Assertions.assertNotNull(decodificador);
	}
	
	@Test
	void test_sugerencias_por_novedad() {
		List<Pelicula> sugerenciasRecibidas = decodificador.obtenerSugerencias();
		
		List<Pelicula> sugerenciasEsperadas = new ArrayList<Pelicula>();
		sugerenciasEsperadas.add(dunkirk);
		sugerenciasEsperadas.add(capitanAmerica);
		sugerenciasEsperadas.add(ironMan);
		
		Assertions.assertEquals(sugerenciasRecibidas, sugerenciasEsperadas);
	}
	
	@Test
	void test_sugerencias_por_puntaje() {
		decodificador.setSugeridor(sugeridorPuntaje);
		List<Pelicula> sugerenciasRecibidas = decodificador.obtenerSugerencias();
		
		List<Pelicula> sugerenciasEsperadas = new ArrayList<Pelicula>();
		sugerenciasEsperadas.add(dunkirk);
		sugerenciasEsperadas.add(ironMan);
		sugerenciasEsperadas.add(capitanAmerica);
		
		Assertions.assertEquals(sugerenciasRecibidas, sugerenciasEsperadas);
	}
	
	@Test
	void test_sugerencias_por_similaridad() {
		decodificador.setSugeridor(sugeridorSimilaridad);
		List<Pelicula> sugerenciasRecibidas = decodificador.obtenerSugerencias();
		
		List<Pelicula> sugerenciasEsperadas = new ArrayList<Pelicula>();
		// no tiene sentido este resultado
		sugerenciasEsperadas.add(capitanAmerica);
		sugerenciasEsperadas.add(ironMan);
		sugerenciasEsperadas.add(rambo);
		
		Assertions.assertEquals(sugerenciasRecibidas, sugerenciasEsperadas);
	}
}
