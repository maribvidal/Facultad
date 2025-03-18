package unlp.oo2.ejercicio1;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

/**
 * Aca escribiremos los test de unidad para cada clase 
 * 
 */
public class PostTest {
	
	Usuario aristarco;
	Usuario eudoxo;
	
	@BeforeEach
	void setUp() throws Exception {
		aristarco = new Usuario("aristarcoSamos");
		eudoxo = new Usuario("eudoxoCnidos");
	}
	
    @Test
    public void test_creacion_tweets() {
    	aristarco.twittear("La Tierra no gira alrededor del Sol");
    	
    	eudoxo.twittear("");
    	eudoxo.twittear("La luna tiene tres esferas. La mas externa de ellas gira hacia el "
    			+ "oeste una vez cada 24 horas, lo que explica el amanecer y el ocaso. La "
    			+ "segunda gira hacia el este una vez al mes, lo que explica el movimiento "
    			+ "mensual de la Luna a través de la región del zodiaco. La tercera y última"
    			+ " tambien realiza una revolución al mes, pero su eje está inclinado en un "
    			+ "angulo ligeramente diferente, lo que explica el movimiento en latitud y el"
    			+ " de los nodos lunares.");
    	
    	// Comprobar si Aristarco tiene un posteo
    	Assertions.assertEquals(1, aristarco.getPosteos().size());
    	// Comprobar si Eudoxo no tiene posteos
    	Assertions.assertFalse(eudoxo.getPosteos().size() > 0);
    }
    
    @Test
    public void test_creacion_retweets() {
    	Tweet tuit = aristarco.twittear("holanda");
    	Retweet retuit = eudoxo.retwittear(tuit);
    	
    	// Comprobar si Eudoxo tiene un posteo
    	Assertions.assertTrue(eudoxo.getPosteos().size() == 1);
    	// Comprobar si el texto del Retweet es el mismo que el del Tweet
    	Assertions.assertEquals(retuit.getTexto(), tuit.getTexto());
    }
    
    @Test
    public void test_eliminacion_tweets() {
    	Tweet tuit = eudoxo.twittear("holiwis");
    	eudoxo.eliminarTweet(tuit);
    	
    	// Comprobar si Eudoxo no tiene posteos
    	Assertions.assertTrue(eudoxo.getPosteos().size() == 0);
    }
    
    @Test
    public void test_eliminacion_retweets() {
    	Tweet tuit = aristarco.twittear("Que tal como te va");
    	Tweet tuit2 = eudoxo.twittear("Que frase mas vulgar");
    	
    	Retweet retuit = aristarco.retwittear(tuit2);
    	Retweet retuit2 = eudoxo.retwittear(tuit);
    
    	aristarco.eliminarTweet(tuit);
    	
    	// Comprobar que Eudoxo tenga 1 posteo (no tenga el Retweet)
    	Assertions.assertTrue(eudoxo.getPosteos().size() == 1);
    	
    	eudoxo.eliminarTweet(tuit2);
    	
    	// Comprobar que Aristarco tenga 1 posteo (no tenga el Retweet)
    	Assertions.assertTrue(aristarco.getPosteos().size() == 0);
    }
}
