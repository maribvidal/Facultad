package unlp.oo2.patrones.ej2;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

/**
 * Aca escribiremos los test de unidad para cada clase 
 * 
 */
public class EmpleadoPlantaTest {
	
	EmpleadoPlanta empleado, empleado2, empleado3;
	
	@BeforeEach
	void setUp() throws Exception {
		empleado = new EmpleadoPlanta(false, 0, 1);
		empleado2 = new EmpleadoPlanta(true, 0, 2);
		empleado3 = new EmpleadoPlanta(true, 2, 3);
	}
	
    @Test
    public void test_calcularSueldoBasico() {
        assertEquals(50000 + (0 + 0 + 2000 * 1) + (50000 * 0.13 + 2000 * 0.05), empleado.obtenerSueldo());
        assertEquals(50000 + (5000 + 2000 * 0 + 2000 * 2) + (50000 * 0.13 + (5000 + 2000 * 2) * 0.05), empleado2.obtenerSueldo());
		assertEquals(50000 + (5000 + 2000 * 2 + 2000 * 3) + (50000 * 0.13 + ((5000 + 2000 * 2 + 2000 * 3)) * 0.05), empleado3.obtenerSueldo());
    }
}
