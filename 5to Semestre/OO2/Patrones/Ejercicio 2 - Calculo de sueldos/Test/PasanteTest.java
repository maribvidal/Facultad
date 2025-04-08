package unlp.oo2.patrones.ej2;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

/**
 * Aca escribiremos los test de unidad para cada clase 
 * 
 */
public class PasanteTest {
	
	Pasante empleado, empleado2;
	
	@BeforeEach
	void setUp() throws Exception {
		empleado = new Pasante(0);
		empleado2 = new Pasante(5);
	}
	
    @Test
    public void test_calcularSueldoBasico() {
        assertEquals(20000 + (2000 * 0) + (20000 * 0.13 + 0), empleado.obtenerSueldo());
        assertEquals(20000 + (2000 * 5) + (20000 * 0.13 + (2000 * 5) * 0.05), empleado2.obtenerSueldo());
    }
}
