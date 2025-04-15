package unlp.oo2.patrones.ej7;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

/**
 * Aca escribiremos los test de unidad para cada clase 
 * 
 */
public class CalculadoraTest {
	
	Calculadora calc;
	
	@BeforeEach
	void setUp() throws Exception {
		calc = new Calculadora();
	}
	
	@Test
	public void test_inicializacion() {
		Assertions.assertTrue(calc.getEstado().getClass() == EstadoInicial.class);
		Assertions.assertEquals(0, calc.getValorActual());
		Assertions.assertEquals(0, calc.getValorAcumulado());
	}
	
    @Test
    public void test_suma() {
    	calc.setValor(5); // Establece el valor inicial 
    	calc.mas(); // Prepara para sumar 
    	calc.setValor(3); // Suma 3 al valor acumulado
    	Assertions.assertEquals("RESULTADO: 8.0", calc.getResultado());
    }
    
    @Test
    public void test_resta() {
    	calc.setValor(5);
    	calc.menos();
    	calc.setValor(3);
    	Assertions.assertEquals("RESULTADO: 2.0", calc.getResultado());
    }
    
    @Test
    public void test_multiplicacion() {
    	calc.setValor(5);
    	calc.por();
    	calc.setValor(3);
    	Assertions.assertEquals("RESULTADO: 15.0", calc.getResultado());
    }
    
    @Test
    public void test_division() {
    	calc.setValor(5);
    	calc.dividido();
    	calc.setValor(3);
    	Assertions.assertEquals("RESULTADO: 1.6666666666666667", calc.getResultado());
    }
    
    @Test
    public void test_division_por_cero() {
    	calc.setValor(0);
    	calc.dividido(); 
    	calc.setValor(0);
    	Assertions.assertEquals("RESULTADO: ERROR", calc.getResultado());
    }
}
