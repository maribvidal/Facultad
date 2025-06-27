package refactoring290624;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

/**
 * Aca escribiremos los test de unidad para cada clase 
 * 
 */
public class PagoTest {
	
	Pago pagoEfectivo1, pagoEfectivo2, pagoTarjeta;
	List<Producto> productos1, productos2;
	
	@BeforeEach
	void setUp() throws Exception {
		productos1 = new ArrayList<Producto>();
		productos2 = new ArrayList<Producto>();
		
		for (int i = 0; i <= 5; i++) {
			productos1.add(new Producto(100 * i, 0.21));
		}
		
		productos2.add(new Producto(50000, 0.21));
		productos2.add(new Producto(50000, 0.21));
		
		pagoEfectivo1 = new PagoEfectivo(productos1);
		pagoTarjeta = new PagoTarjeta(productos1);
		pagoEfectivo2 = new PagoEfectivo(productos2);
	}
	
    @Test
    public void test_pago_efectivo() {
    	Assertions.assertEquals(100 + (21) + 200 + (200 * 0.21) + 300 + (300 * 0.21) + 400 + (400 * 0.21) + 500 + (500 * 0.21), pagoEfectivo1.calcularMontoFinal());
    	Assertions.assertEquals(121000 - 2000, pagoEfectivo2.calcularMontoFinal());
    }
    
    @Test
    public void test_pago_tarjeta() {
    	Assertions.assertEquals(100 + (21) + 200 + (200 * 0.21) + 300 + (300 * 0.21) + 400 + (400 * 0.21) + 500 + (500 * 0.21) + 1000, pagoTarjeta.calcularMontoFinal());
    }
}
