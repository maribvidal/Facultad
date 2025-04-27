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

	SandwichClasicoBuilder constructorClasico;
	SandwichVeganoBuilder constructorVegano;
	SandwichVegetarianoBuilder constructorVegetariano;
	SandwichSinTACCBuilder constructorSinTACC;
	
	Empleado empleadoSubteway;
	
	@BeforeEach
	void setUp() throws Exception {
		empleadoSubteway = new Empleado();

		constructorClasico = new SandwichClasicoBuilder();
		constructorVegano = new SandwichVeganoBuilder();
		constructorVegetariano = new SandwichVegetarianoBuilder();
		constructorSinTACC = new SandwichSinTACCBuilder();
	}
	
	@Test
	public void test_sandwich_clasico() {
		sandwich = empleadoSubteway.pedirSandwich(constructorClasico);
		Assertions.assertEquals(COSTO_ESPERADO_SANDWICH_CLASICO, sandwich.obtenerPrecio());
	}
	
	@Test
	public void test_sandwich_vegetariano() {
		sandwich = empleadoSubteway.pedirSandwich(constructorVegetariano;
		Assertions.assertEquals(COSTO_ESPERADO_SANDWICH_VEGETARIANO, sandwich.obtenerPrecio());
	}
	
	@Test
	public void test_sandwich_vegano() {
		sandwich = empleadoSubteway.pedirSandwich(constructorVegano);
		Assertions.assertEquals(COSTO_ESPERADO_SANDWICH_VEGANO, sandwich.obtenerPrecio());
	}
	
	@Test
	public void test_sandwich_sin_tacc() {
		sandwich = empleadoSubteway.pedirSandwich(constructorSinTACC);
		Assertions.assertEquals(COSTO_ESPERADO_SANDWICH_SIN_TACC, sandwich.obtenerPrecio());
	}
}
