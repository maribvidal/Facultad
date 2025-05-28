package unlp.oo2.patrones.ej22;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class LightMixTest {
	LightMix pasoProceso;
	MockMixingTank tanque;
	I2CDriver driver;
	
	@BeforeEach
	void setUp() throws Exception {
		this.tanque = new MockMixingTank(50, 20);
		this.pasoProceso = new LightMix();
		this.driver = new I2CDriver(100, 2000, this.tanque, this.pasoProceso);
	}
	
	@Test
	void test_start_sequence() {
		driver.sendStartSeq();
		
		// Observar como se modificó el tanque según
		// lo que se esperaba que hiciera el LightMix
		Assertions.assertEquals(20, tanque.getHeatPower());
		Assertions.assertEquals(5, tanque.getMixerPower());
		// Revisar que el volumen siga siendo el mismo
		Assertions.assertEquals(50, tanque.upTo());
	}
	
	@Test
	void test_stop_sequence() {
		driver.sendStartSeq();
		driver.sendStopSeq();
		
		Assertions.assertTrue(this.pasoProceso.isDone());
	}
}
