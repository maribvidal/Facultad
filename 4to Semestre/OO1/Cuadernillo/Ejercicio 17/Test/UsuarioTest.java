package ar.edu.unlp.oo1.ejercicio17;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.time.LocalDate;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class UsuarioTest {
	DateLapse periodo1;
	DateLapse periodo2;
	DateLapse periodo3;
	Propiedad unaPropiedad;
	Usuario carlos;
	
	@BeforeEach
	void setUp() {
		unaPropiedad = new Propiedad("Casa Curutchet", "Avenida 53 N°320", 10);
		periodo1 = new DateLapse(LocalDate.now().plusDays(5), LocalDate.now().plusDays(10));
		periodo2 = new DateLapse(LocalDate.now().plusDays(15), LocalDate.now().plusDays(30));
		carlos = new Usuario("Carlos", "Groove Street", "23423423");
	}
	
	@Test
	void testRealizarReserva() {
		Assertions.assertTrue(carlos.realizarReserva(unaPropiedad, periodo1));
		Assertions.assertEquals(1, unaPropiedad.obtenerOcupaciones().size());
		Assertions.assertFalse(carlos.realizarReserva(unaPropiedad, periodo1));
	}
	
	@Test
	void testCancelarReserva() {
		carlos.realizarReserva(unaPropiedad, periodo1);
		
		Assertions.assertTrue(carlos.cancelarReserva(carlos.obtenerReservas().get(0)));
		Assertions.assertEquals("[]", carlos.obtenerReservas().toString());
	}
}
