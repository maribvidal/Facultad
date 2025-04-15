package unlp.oo2.patrones.ej6;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.beans.Transient;
import java.time.LocalDate;
import java.util.List;

/* Escriba un test para inscribir a un usuario en la excursión 
“Dos días en kayak bajando el Paraná”, con cupo mínimo de 1 persona y cupo máximo 2, 
con dos personas ya inscriptas. Implemente todos los mensajes que considere necesarios. */

public class ExcursionTest {
	
	Usuario aronnax, conseil, ned;
	Excursion kayakParana;
	
	@BeforeEach
	void setUp() throws Exception {
		kayakParana = new Excursion("Dos días en kayak bajando el Paraná",
					LocalDate.now(), LocalDate.now().plusDays(2),
					"Sturla Viajes", 5000, 1, 2);
		
		aronnax = new Usuario("Pierre", "Aronnax", "perronax@gmail.com");
		conseil = new Usuario("Conseil", "", "consejo@gmail.com");
		ned = new Usuario("Ned", "Land", "nedflanders@gmail.com");
	}
	
    @Test
    public void test_inicializacion() {
		Assertions.assertNotNull(kayakParana.obtenerMailInscriptos());
		Assertions.assertNotNull(kayakParana.getInscriptos());
		Assertions.assertNotNull(kayakParana.getListaEspera());
		Assertions.assertEquals(0, kayakParana.cantidadInscriptos());
		Assertions.assertEquals("EXCURSION Dos días en kayak bajando el Paraná / COSTO 5000.0\n/ FECHAS del " + LocalDate.now() + " al " + LocalDate.now().plusDays(2) + "\n/PUNTO DE ENCUENTRO Sturla Viajes" +
								"\nCANT. USUARIOS FALTANTES PARA ALCANZAR EL CUPO MÍNIMO: 1",
								kayakParana.obtenerInformacion());
		Assertions.assertFalse(kayakParana.seAlcanzoCupoMinimo());
		Assertions.assertFalse(kayakParana.seAlcanzoCupoMaximo());
		Assertions.assertTrue(kayakParana.getEstado().getClass() == EstadoProvisorio.class);
    }

	@Test
	public void test_paso_estado_provisorio_a_definitivo() {
		Assertions.assertEquals(1, kayakParana.cantidadInscriptosFaltantesCupoMinimo());

		kayakParana.inscribir(aronnax);

		Assertions.assertTrue(kayakParana.getEstado().getClass() == EstadoDefinitivo.class);
		Assertions.assertEquals(1, kayakParana.cantidadInscriptos());
		Assertions.assertTrue(kayakParana.seAlcanzoCupoMinimo());
		Assertions.assertEquals(0, kayakParana.cantidadInscriptosFaltantesCupoMinimo());
		Assertions.assertEquals("EXCURSION Dos días en kayak bajando el Paraná / COSTO 5000.0\n/ FECHAS del " + LocalDate.now() + " al " + LocalDate.now().plusDays(2) + "\n/PUNTO DE ENCUENTRO Sturla Viajes" +
								"\nMAILS INSCRIPTOS: [perronax@gmail.com]\nCANT. USUARIOS FALTANTES PARA ALCANZAR EL CUPO MÁXIMO: 1",
								kayakParana.obtenerInformacion());
	}

	@Test
	public void test_paso_estado_definitivo_a_lleno() {
		kayakParana.inscribir(aronnax);
		
		Assertions.assertEquals(1, kayakParana.cantidadInscriptosFaltantesCupoMaximo());

		kayakParana.inscribir(conseil);

		Assertions.assertTrue(kayakParana.getEstado().getClass() == EstadoLleno.class);
		Assertions.assertEquals(2, kayakParana.cantidadInscriptos());
		Assertions.assertTrue(kayakParana.seAlcanzoCupoMaximo());
		Assertions.assertEquals(0, kayakParana.cantidadInscriptosFaltantesCupoMaximo());
		Assertions.assertEquals("EXCURSION Dos días en kayak bajando el Paraná / COSTO 5000.0\n/ FECHAS del " + LocalDate.now() + " al " + LocalDate.now().plusDays(2) + "\n/PUNTO DE ENCUENTRO Sturla Viajes",
								kayakParana.obtenerInformacion());
	}

	@Test
	public void test_estado_lleno() {
		kayakParana.inscribir(aronnax);
		kayakParana.inscribir(conseil);
		
		kayakParana.inscribir(ned);

		Assertions.assertEquals(2, kayakParana.cantidadInscriptos());
		Assertions.assertEquals(1, kayakParana.getListaEspera().size());
	}
}
