package unlp.oo2.patrones.ej14;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.time.LocalDate;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class AlquilerTest {
	final LocalDate ALQU_FECHA_COMIENZO = LocalDate.of(2025, 1, 1);
	final LocalDate ALQU_FECHA_FIN = LocalDate.of(2025, 7, 1);
	final LocalDate ALQU2_FECHA_FIN = LocalDate.now();
	final double ALQU_COSTO_MENSUAL = 50;
	
	final int MESES_RESTANTES = 2; // Hasta la fecha
	
	final double ALQU_LIQUIDEZ = 0.9; 
	final double ALQU_VALOR = (MESES_RESTANTES * ALQU_COSTO_MENSUAL);
	final double ALQU2_VALOR = 0;
	final double ALQU_VALOR_PRENDARIO = (ALQU_VALOR * ALQU_LIQUIDEZ);
	
	Alquiler alqu, alqu2;
	
	@BeforeEach
	void setUp() throws Exception {
		alqu = new Alquiler(ALQU_FECHA_COMIENZO, ALQU_FECHA_FIN, ALQU_COSTO_MENSUAL);
		alqu2 = new Alquiler(ALQU_FECHA_COMIENZO, ALQU2_FECHA_FIN, ALQU_COSTO_MENSUAL);
	}
	
	@Test
	public void test_inicializacion() {
		Assertions.assertEquals(ALQU_FECHA_COMIENZO, alqu.obtenerComienzo());
		Assertions.assertEquals(ALQU_FECHA_FIN, alqu.obtenerFin());
		Assertions.assertEquals(ALQU_COSTO_MENSUAL, alqu.obtenerCostoPorMagnitud());
	}
	
	@Test
	public void test_calcular_liquidez() {
		Assertions.assertEquals(ALQU_LIQUIDEZ, alqu.calcularLiquidez());
	}
	
	@Test
	public void test_calcular_valor() {
		Assertions.assertEquals(ALQU_VALOR, alqu.calcularValor());
	}
	
	@Test
	public void test_calcular_valor_fecha_fin_pasada() {
		Assertions.assertEquals(ALQU2_VALOR, alqu2.calcularValor());
	}	

	@Test
	public void test_calcular_valor_prendario() {
		Assertions.assertEquals(ALQU_VALOR_PRENDARIO, alqu.calcularValorPrendario());
	}
}
