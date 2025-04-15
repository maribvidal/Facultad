package unlp.oo2.patrones.ej10;

import ar.info.juego.Encriptador.FeistelCipher;
import ar.info.juego.Encriptador.RC4;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

/**
 * Aca escribiremos los test de unidad para cada clase 
 * 
 */
public class MensajeroTest {
	
	String clave1 = "hola";
	String clave2 = "chau";
	
	FeistelCipher fc;
	RC4 rc4;
	
	FeistelCipherAdapter fca;
	RC4Adapter rc4a;
	Mensajero mensajero;
	
	@BeforeEach
	void setUp() throws Exception {
		fc = new FeistelCipher(clave1);
		rc4 = new RC4();
		
		fca = new FeistelCipherAdapter(clave1);
		rc4a = new RC4Adapter(clave2);
		
		mensajero = new Mensajero(fca);
		
	}
	
    @Test
    public void test_cifrador() {
    	String cadena = "Hola mundo";
    	String cadenaCifrada = fc.encode(cadena);
    	
        assertEquals(cadenaCifrada, mensajero.enviar(cadena));
        
        String cadenaDescifrada = fc.encode(cadenaCifrada);
        
        assertEquals(cadenaDescifrada, mensajero.recibir(cadenaCifrada));
        
        // Cambiar el cifrador
        mensajero.cambiarCifrador(rc4a);
        
        cadenaCifrada = rc4.encriptar(cadena, clave2);
        
        assertEquals(cadenaCifrada, mensajero.enviar(cadena));
        
        cadenaDescifrada = rc4.desencriptar(cadenaCifrada, clave2);
        
        assertEquals(cadenaDescifrada, mensajero.recibir(cadenaCifrada));
    }
}
