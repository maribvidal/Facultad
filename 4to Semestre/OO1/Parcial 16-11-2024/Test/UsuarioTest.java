package ar.edu.unlp.oo1.parcial;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Assertions.*;

import java.time.LocalDate;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class UsuarioTest {
	EventoPresencial unEventoPresencial;
	Sede unaSede;
	Sede otraSede;
	
	EventoVirtual unEventoVirtual;
	EventoVirtual otroEventoVirtual;
	
	Entrada unaEntradaVieja;
	
	private Usuario unUsuario;
	private Usuario otroUsuario;
	
	@BeforeEach
	void setUp() {
		unEventoPresencial = new EventoPresencial("Evento A", LocalDate.now(), "Aquella solitaria vaca cubana", 10, 5);
		unEventoVirtual = new EventoVirtual("Evento B", LocalDate.of(2024, 12, 24), "Chlorine", 2, 2, 5);
		otroEventoVirtual = new EventoVirtual("Evento C", LocalDate.of(2018, 10, 10), "Tranz", 1, 1, 1);
		
		unaSede = new Sede("Estadio Unico", 5, 3);
		otraSede = new Sede("Twitch", 1, 3);
		
		unEventoPresencial.agregarSede(unaSede);
		unEventoPresencial.agregarSede(otraSede);
		
		unaEntradaVieja = new Entrada(otroEventoVirtual, false);
		
		unUsuario = new Usuario("Cándido");
		otroUsuario = new Usuario("Pangloss");
	}
	
	@Test
	void test_comprarEntrada() {
		// Por mas que no tenga entradas compradas la lista debe existir
		Assertions.assertNotNull(unUsuario.getEntradasCompradas());
		
		// Si se intenta comprar una entrada para un evento que ya pasó, debería retornar null
		Assertions.assertNull(unUsuario.comprarEntradaEvento(otroEventoVirtual, false));
		
		// Se compran entradas con éxito
		unUsuario.comprarEntradaEvento(unEventoPresencial, false);
		unUsuario.comprarEntradaEvento(unEventoVirtual, false);
		Assertions.assertEquals(2, unUsuario.getEntradasCompradas().size());
	}
	
	@Test
	void test_calcularMontoEntradasPeriodo() {
		// Si no tiene entradas compradas, debería retornar 0
		Assertions.assertEquals(0, otroUsuario.calcularMontoTotalEntradasPeriodo(LocalDate.of(2024, 11, 18), LocalDate.of(2024, 11, 25)));
		
		// Solo se debería calcular el monto de las entradas que estén adentro del rango
		otroUsuario.comprarEntradaEvento(unEventoPresencial, true);
		otroUsuario.comprarEntradaEvento(unEventoVirtual, false);
		Assertions.assertEquals(17 + 15 + 3 + 500 + 9, otroUsuario.calcularMontoTotalEntradasPeriodo(LocalDate.now(), LocalDate.now().plusDays(7)));
	}
	
	@Test
	void test_retornarEntradaSiguienteEvento() {
		// Si no tiene entradas compradas, debería retornar null
		Assertions.assertNull(unUsuario.obtenerEntradaSiguienteEvento());
		
		// Y lo mismo si las fechas de los eventos de las entradas ya pasaron
		otroUsuario.agregarEntrada(unaEntradaVieja);
		Assertions.assertNull(unUsuario.obtenerEntradaSiguienteEvento());
		
		// Se retorna una entrada con éxito (la próxima a partir de hoy)
		otroUsuario.comprarEntradaEvento(unEventoPresencial, true);
		otroUsuario.comprarEntradaEvento(unEventoVirtual, false);
		Assertions.assertEquals(LocalDate.of(2024, 12, 24), otroUsuario.obtenerEntradaSiguienteEvento().getFechaEvento());
	}
}
