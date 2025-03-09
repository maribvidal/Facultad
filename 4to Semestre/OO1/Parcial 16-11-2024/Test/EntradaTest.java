package ar.edu.unlp.oo1.parcial;

import java.time.LocalDate;

import org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class EntradaTest {
	EventoPresencial unEventoPresencial;
	Sede unaSede;
	Sede otraSede;
	EventoVirtual unEventoVirtual;
	
	Entrada unaEntrada;
	Entrada otraEntrada;
	
	@BeforeEach
	void setUp() {
		unEventoPresencial = new EventoPresencial("Evento A", LocalDate.now(), "Mi gin tonic", 10, 5);
		unEventoVirtual = new EventoVirtual("Evento B", LocalDate.of(2024, 12, 24), "cyber meat", 2, 2, 5);
		
		unaSede = new Sede("Bye Henry", 5, 3);
		otraSede = new Sede("Psiquika", 1, 3);
		
		unEventoPresencial.agregarSede(unaSede);
		unEventoPresencial.agregarSede(otraSede);
		
		unaEntrada = new Entrada(unEventoPresencial, false);
		otraEntrada = new Entrada(unEventoVirtual, true);
	}
	
	@Test
	void test_constructor() {
		// La fecha de compra de la entrada debe ser igual a la fecha actual
		Assertions.assertEquals(LocalDate.now(), unaEntrada.getFechaCompra());
	}
	
	@Test
	void test_obtenerMontoRecuperable() {
		// La entrada se compró el mismo día del evento - No se pagó por seguro
		Assertions.assertEquals(0, unaEntrada.obtenerMontoRecuperable());
		
		// La entrada se compró a 31 dias del evento - Se pagó por seguro
		Assertions.assertEquals((9 * 0.5) + (9 * 0.15), otraEntrada.obtenerMontoRecuperable());
	}
	
	@Test
	void test_obtenerMontoGastado() {
		// No se pagó por seguro
		Assertions.assertEquals(17 + 15 + 3, unaEntrada.obtenerMontoGastado());
		
		// Se pagó por seguro
		Assertions.assertEquals(9 + 500, otraEntrada.obtenerMontoGastado());
	}
}
