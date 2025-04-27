package unlp.oo2.patrones.ej14;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class AutomovilTest {
	final int AUTO_AÑOS_ANTIGUEDAD = 6;
	final int AUTO2_AÑOS_ANTIGUEDAD = 11;
	final double AUTO_COSTO_0KM = 5000;
	final String AUTO_MODELO = "BMW"; 
	final int AUTO_KILOMETRAJE = 2000;
	
	final double AUTO_LIQUIDEZ = 0.7; 
	final double AUTO_VALOR = 2000; 
	final double AUTO2_VALOR = 0;
	final double AUTO_VALOR_PRENDARIO = (AUTO_LIQUIDEZ * AUTO_VALOR);
	
	Automovil auto, auto2;
	
	@BeforeEach
	void setUp() throws Exception {
		auto = new Automovil(AUTO_MODELO, AUTO_KILOMETRAJE, AUTO_AÑOS_ANTIGUEDAD, AUTO_COSTO_0KM);
		auto2 = new Automovil(AUTO_MODELO, AUTO_KILOMETRAJE, AUTO2_AÑOS_ANTIGUEDAD, AUTO_COSTO_0KM);
	}
	
	@Test
	public void test_inicializacion() {
		Assertions.assertEquals(AUTO_MODELO, auto.obtenerModelo());
		Assertions.assertEquals(AUTO_AÑOS_ANTIGUEDAD, auto.obtenerAñosAntiguedad());
		Assertions.assertEquals(AUTO_COSTO_0KM, auto.obtenerCosto0KM());
		Assertions.assertEquals(AUTO_KILOMETRAJE, auto.obtenerKilometraje());
	}
	
	@Test
	public void test_calcular_liquidez() {
		Assertions.assertEquals(AUTO_LIQUIDEZ, auto.calcularLiquidez());
	}
	
	@Test
	public void test_calcular_valor() {
		Assertions.assertEquals(AUTO_VALOR, auto.calcularValor());
	}
	
	@Test
	public void test_calcular_valor_antiguedad_mayor_a_10() {
		Assertions.assertEquals(AUTO2_VALOR, auto2.calcularValor());
	}
	
	@Test
	public void test_calcular_valor_prendario() {
		Assertions.assertEquals(AUTO_VALOR_PRENDARIO, auto.calcularValorPrendario());
	}
}
