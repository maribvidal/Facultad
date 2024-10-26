package ar.edu.unlp.oo1.ejercicio17;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.time.LocalDate;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class PropiedadTest {
	Propiedad unaPropiedad;
	DateLapse periodo1;
	DateLapse periodo2;
	DateLapse periodo3;
	
	@BeforeEach
	void setUp() {
		unaPropiedad = new Propiedad("Casa Curutchet", "Avenida 53 N°320", 10);
		periodo1 = new DateLapse(LocalDate.now().plusDays(5), LocalDate.now().plusDays(10));
		periodo2 = new DateLapse(LocalDate.now().plusDays(6), LocalDate.now().plusDays(9));
		periodo3 = new DateLapse(LocalDate.now().plusDays(15), LocalDate.now().plusDays(30));
	}
	
	@Test
	void testConsultarDisponibilidad() {
		Assertions.assertTrue(unaPropiedad.consultarDisponibilidad(periodo1));
		
		unaPropiedad.agregarPeriodo(periodo1);
		
		Assertions.assertFalse(unaPropiedad.consultarDisponibilidad(periodo2));
	}
	
	@Test
	void testConsultarIngresosPeriodo() {
		unaPropiedad.agregarPeriodo(periodo1);
		unaPropiedad.agregarPeriodo(periodo3);
		
		Assertions.assertEquals(200, unaPropiedad.consultarIngresosPeriodo(new DateLapse(LocalDate.now(), LocalDate.now().plusDays(31))));
	}
}
