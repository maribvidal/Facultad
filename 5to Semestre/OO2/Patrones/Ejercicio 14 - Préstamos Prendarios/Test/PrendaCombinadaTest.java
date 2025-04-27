package unlp.oo2.patrones.ej14;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.time.LocalDate;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class PrendaCombinadaTest {
	final double PREN_LIQUIDEZ = 0.5; 
	final double PREN_VALOR = (500 + 800 + 1000 * 20 + 5 * 10);
	final double PREN_VALOR_PRENDARIO = (PREN_VALOR * PREN_LIQUIDEZ);
	
	Automovil auto1, auto2;
	Inmueble inmueble1;
	Alquiler alquiler1;
	
	PrendaCombinada pren;
	
	@BeforeEach
	void setUp() throws Exception {
		auto1 = new Automovil("BMW", 1000, 5, 1000);
		auto2 = new Automovil("Renault", 1000, 2, 1000);
		inmueble1 = new Inmueble("Calle 96 esq. 24", 1000, 20);
		alquiler1 = new Alquiler(LocalDate.now(), LocalDate.now().plusMonths(5), 10);
		
		pren = new PrendaCombinada();
	}
	
	@Test
	public void test_inicializacion() {
		Assertions.assertEquals(PREN_LIQUIDEZ, pren.calcularLiquidez());
		Assertions.assertEquals(0, pren.calcularValor());
	}
	
	@Test
	public void test_calcular_valor() {
		setUpPrendas();
		Assertions.assertEquals(PREN_VALOR, pren.calcularValor());
	}

	@Test
	public void test_calcular_valor_prendario() {
		setUpPrendas();
		Assertions.assertEquals(PREN_VALOR_PRENDARIO, pren.calcularValorPrendario());
	}
	
	//
	
	private void setUpPrendas() {
		pren.agregarPrenda(auto1);
		pren.agregarPrenda(auto2);
		pren.agregarPrenda(inmueble1);
		pren.agregarPrenda(alquiler1);
	}
}
