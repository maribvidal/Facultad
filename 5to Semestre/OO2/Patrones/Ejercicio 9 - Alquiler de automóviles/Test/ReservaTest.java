package unlp.oo2.patrones.ej9;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.time.LocalDateTime;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

/**
 * Aca escribiremos los test de unidad para cada clase 
 * 
 */
public class ReservaTest {
	
	AutoEnAlquiler auto;
	Usuario conductor;
	PoliticaCancelacionFlexible polCanFle;
	PoliticaCancelacionModerada polCanMod;
	PoliticaCancelacionEstricta polCanEst;
	Reserva reserva;
	
	@BeforeEach
	void setUp() throws Exception {
		polCanFle = new PoliticaCancelacionFlexible();
		polCanMod = new PoliticaCancelacionModerada();
		polCanEst = new PoliticaCancelacionEstricta();
		
		auto = new AutoEnAlquiler(15, 4, "Toyota", polCanFle);
		conductor = new Usuario("Franco");
		
		reserva = new Reserva(conductor, auto, 15, LocalDateTime.now().plusDays(15));
	}
	
    @Test
    public void test_inicializacion() {
    	Assertions.assertNotNull(auto.getPoliticaCancelacion());
    	
    	Assertions.assertEquals(auto, reserva.getAutoEnAlquiler());
    	Assertions.assertEquals(conductor, reserva.getConductor());
    	Assertions.assertEquals(15, reserva.getCantidadDias());
    	Assertions.assertEquals(LocalDateTime.now().plusDays(15), reserva.getFecha());
    	
    	Assertions.assertEquals(15 * 15, reserva.montoAPagar());
    }
    
    @Test
    public void test_politica_flexible() {
    	Assertions.assertEquals(15 * 15, reserva.montoAReembolsar(LocalDateTime.now()));
    	Assertions.assertEquals(15 * 15, reserva.montoAReembolsar(LocalDateTime.now().plusDays(14)));
    }
    
    @Test
    public void test_politica_moderada() {
    	auto.cambiarPoliticaCancelacion(polCanMod);
    	
    	// Falta mas de 1 semana
    	Assertions.assertEquals(15 * 15, reserva.montoAReembolsar(LocalDateTime.now()));
    	
    	// Faltan menos de 1 semana y mas de 2 días
    	Assertions.assertEquals(15 * 15 * 0.5, reserva.montoAReembolsar(LocalDateTime.now().plusDays(8)));
    	
    	// Faltan dos o menos días
    	Assertions.assertEquals(0, reserva.montoAReembolsar(LocalDateTime.now().plusDays(14)));
    }
    
    @Test
    public void test_politica_estricta() {
    	auto.cambiarPoliticaCancelacion(polCanEst);
    	Assertions.assertEquals(0, reserva.montoAReembolsar(LocalDateTime.now()));
    	Assertions.assertEquals(0, reserva.montoAReembolsar(LocalDateTime.now().plusDays(14)));
    }
}
