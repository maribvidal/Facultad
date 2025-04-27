package unlp.oo2.patrones.ej13;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class SandwichTest {
	final int COSTO_ESPERADO_SANDWICH_CLASICO = 500;
	final int COSTO_ESPERADO_SANDWICH_VEGETARIANO = 420;
	final int COSTO_ESPERADO_SANDWICH_VEGANO = 620;
	final int COSTO_ESPERADO_SANDWICH_SIN_TACC = 618;
	
	Sandwich sandwich;
	
	Empleado empleadoSubteway;
	
	@BeforeEach
	void setUp() throws Exception {
		empleadoSubteway = new Empleado();
	}
	
	@Test
	public void test_sandwich_clasico() {
		sandwich = empleadoSubteway.pedirSandwichClasico();
		Assertions.assertEquals(COSTO_ESPERADO_SANDWICH_CLASICO, sandwich.obtenerPrecio());
	}
	
	@Test
	public void test_sandwich_vegetariano() {
		sandwich = empleadoSubteway.pedirSandwichVegetariano();
		Assertions.assertEquals(COSTO_ESPERADO_SANDWICH_VEGETARIANO, sandwich.obtenerPrecio());
	}
	
	@Test
	public void test_sandwich_vegano() {
		sandwich = empleadoSubteway.pedirSandwichVegano();
		Assertions.assertEquals(COSTO_ESPERADO_SANDWICH_VEGANO, sandwich.obtenerPrecio());
	}
	
	@Test
	public void test_sandwich_sin_tacc() {
		sandwich = empleadoSubteway.pedirSandwichSinTACC();
		Assertions.assertEquals(COSTO_ESPERADO_SANDWICH_SIN_TACC, sandwich.obtenerPrecio());
	}
}
