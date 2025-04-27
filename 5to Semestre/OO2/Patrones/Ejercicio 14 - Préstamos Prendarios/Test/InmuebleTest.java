package unlp.oo2.patrones.ej14;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.time.LocalDate;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class InmuebleTest {
	final String INMU_DIRECCION = "Calle 420 esq. 69";
	final int INMU_SUPERFICIE = 150;
	final double INMU_COSTO_M2 = 15;
	
	final double INMU_LIQUIDEZ = 0.2; 
	final double INMU_VALOR = (INMU_SUPERFICIE * INMU_COSTO_M2);
	final double INMU_VALOR_PRENDARIO = (INMU_VALOR * INMU_LIQUIDEZ);
	
	Inmueble inmu;
	
	@BeforeEach
	void setUp() throws Exception {
		inmu = new Inmueble(INMU_DIRECCION, INMU_SUPERFICIE, INMU_COSTO_M2);
	}
	
	@Test
	public void test_inicializacion() {
		Assertions.assertEquals(INMU_DIRECCION, inmu.obtenerDireccion());
		Assertions.assertEquals(INMU_SUPERFICIE, inmu.obtenerSuperficie());
		Assertions.assertEquals(INMU_COSTO_M2, inmu.obtenerCostoPorMagnitud());
	}
	
	@Test
	public void test_calcular_liquidez() {
		Assertions.assertEquals(INMU_LIQUIDEZ, inmu.calcularLiquidez());
	}
	
	@Test
	public void test_calcular_valor() {
		Assertions.assertEquals(INMU_VALOR, inmu.calcularValor());
	}
	
	@Test
	public void test_calcular_valor_prendario() {
		Assertions.assertEquals(INMU_VALOR_PRENDARIO, inmu.calcularValorPrendario());
	}
}
