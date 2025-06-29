package refactoring280625;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class RentaTest {
    @Test
    public void testBasicoYKilometrajeLibre() {
    	int precioPorDia = 100;
    	int precioPorKm = 5;
    	int antiguedad= 4;
    	int kilometraje = 10000;
    	
    	Vehiculo vehiculo = new Vehiculo(kilometraje, precioPorDia, precioPorKm, antiguedad);
    	Cliente cliente = new Cliente("Ana");
    	Renta renta = new Renta(vehiculo, cliente, 3);
    	
    	// Simulamos uso del vehículo
    	vehiculo.aumentarKilometraje(200);
    	double esperadoBasico = (3 * 100 + 200 * 5);
    	assertEquals(esperadoBasico, renta.calcularTotal());
    	
    	renta.setTipoRenta("KILOMETRAJE_LIBRE");
    	double esperadoLibre = 3 * 100;
    	assertEquals(esperadoLibre, renta.calcularTotal());
    }
}
