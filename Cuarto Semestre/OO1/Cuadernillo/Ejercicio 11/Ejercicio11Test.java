package ar.edu.unlp.oo1.ejercicio11;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.time.LocalDate;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class Ejercicio11Test {
	Inversor mariano = new Inversor("Mariano");
	Inversor tobias = new Inversor("Tobias");
	InversionEnAcciones meli = new InversionEnAcciones("meli");
	PlazoFijo ahorro = new PlazoFijo(LocalDate.of(2024, 9, 17));

	@BeforeEach
	void setUp() {
		meli.setCantidad(5);
		meli.setValorUnitario(1000);
		
		ahorro.setMontoDepositado(3000);
		ahorro.setPorcentajeDeInteresDiario(0.01);
		
		mariano.agregarInversion(meli);
		mariano.agregarInversion(ahorro);
		
		tobias.agregarInversion(meli);
		tobias.agregarInversion(meli);
		tobias.agregarInversion(meli);
	}
	
    @Test
    public void testInversionEnAcciones() {
        assertEquals(5000, meli.valorActual());
    }
    
    @Test
    public void testPlazoFijo() {
        assertEquals(3300, ahorro.valorActual());
    }
    
    @Test
    public void testInversor() {
        assertEquals(15000, tobias.valorActual());
        assertEquals(8300, mariano.valorActual());
    }
}
