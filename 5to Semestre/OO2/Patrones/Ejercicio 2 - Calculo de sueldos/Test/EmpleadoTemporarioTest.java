package unlp.oo2.patrones.ej2;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

/**
 * Aca escribiremos los test de unidad para cada clase 
 * 
 */
public class EmpleadoTemporarioTest {
	
	EmpleadoTemporario empleado, empleado2, empleado3;
	
	@BeforeEach
	void setUp() throws Exception {
		empleado = new EmpleadoTemporario(false, 0, 5);
		empleado2 = new EmpleadoTemporario(true, 0, 6);
		empleado3 = new EmpleadoTemporario(true, 2, 7);
	}
	
    @Test
    public void test_calcularSueldoBasico() {
        assertEquals(20000 + (5 * 300) + 0 + (2000 * 0) + ((20000 + (5 * 300)) * 0.13 + 0 * 0.05), empleado.obtenerSueldo());
        assertEquals(20000 + (6 * 300) + 5000 + (2000 * 0) + ((20000 + (6 * 300)) * 0.13 + 5000 * 0.05), empleado2.obtenerSueldo());
		assertEquals(20000 + (7 * 300) + 5000 + (2000 * 2) + ((20000 + (7 * 300)) * 0.13 + (5000 + (2000 * 2)) * 0.05), empleado3.obtenerSueldo());
    }
}
