package unlp.oo2.patrones.ej22;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class PurgeTest {
	Purge pasoProceso;
	MockMixingTank tanque, tanque2;
	I2CDriver driver, driver2;
	
	@BeforeEach
	void setUp() throws Exception {
		this.tanque = new MockMixingTank(50, 20);
		this.tanque2 = new MockMixingTank(0, 20);
		this.pasoProceso = new Purge();
		this.driver = new I2CDriver(100, 2000, this.tanque, this.pasoProceso);
		this.driver2 = new I2CDriver(100, 2000, this.tanque2, this.pasoProceso);
	}
	
	@Test
	void test_start_sequence_exitoso() {
		driver.sendStartSeq();
		
		// Observar como se modificó el tanque según
		// lo que se esperaba que hiciera el LightMix
		Assertions.assertEquals(0, tanque.getHeatPower());
		Assertions.assertEquals(0, tanque.getMixerPower());
		// Revisar que el volumen haya bajado
		Assertions.assertEquals(0, tanque.upTo());
	}
	
	@Test
	void test_start_sequence_fallo() {
		driver2.sendStartSeq();
		
		// Revisar que el volumen siga exactamente igual
		Assertions.assertEquals(0, tanque2.upTo());
	}
	
	@Test
	void test_stop_sequence() {
		driver.sendStartSeq();
		driver.sendStopSeq();
		
		Assertions.assertTrue(this.pasoProceso.isDone());
	}
}