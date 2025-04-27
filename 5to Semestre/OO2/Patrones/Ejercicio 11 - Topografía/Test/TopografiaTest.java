package unlp.oo2.patrones.ej11;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class TopografiaTest {
	TopografiaAgua topoAgua;
	TopografiaTierra topoTierra;
	TopografiaMixta topoMixta1;
	TopografiaMixta topoMixta2;
	
	@BeforeEach
	void setUp() throws Exception {
		topoAgua = new TopografiaAgua();
		topoTierra = new TopografiaTierra();
		topoMixta1 = new TopografiaMixta();
		topoMixta2 = new TopografiaMixta();
	}
	
    @Test
    public void test_inicializacion_mixta() {
    	// La topografía mixta no debería retornar ningún valor al principio
    	Assertions.assertEquals(0, topoMixta1.calcularProporcionAgua(), 0.0000001);
    }
    
    @Test
    public void test_agregarComponente_mixta() {
    	topoMixta1.agregarComponente(topoAgua);
    	topoMixta1.agregarComponente(topoTierra);
    	topoMixta1.agregarComponente(topoAgua);
    	topoMixta1.agregarComponente(topoAgua);
    	
    	RuntimeException thrown2 = Assertions.assertThrows(
    			RuntimeException.class,
    			() -> topoMixta1.agregarComponente(new TopografiaAgua()),
    			"No pueden agregarse mas de 4 objetos"
    		);
    }
    
    @Test
    public void test_calcularProporcionAgua() {
    	Assertions.assertEquals(1, topoAgua.calcularProporcionAgua(), 0.0000001);
    	Assertions.assertEquals(0, topoTierra.calcularProporcionAgua(), 0.0000001);
    	
    	topoMixta1.agregarComponente(topoAgua);
    	topoMixta1.agregarComponente(topoTierra);
    	
    	Assertions.assertEquals(0.25, topoMixta1.calcularProporcionAgua(), 0.0000001);
    	
    	topoMixta1.agregarComponente(new TopografiaAgua());
    	
    	Assertions.assertEquals(0.5, topoMixta1.calcularProporcionAgua(), 0.01);
    	
    	topoMixta1.agregarComponente(topoMixta2);
    	
    	topoMixta2.agregarComponente(new TopografiaAgua());
    	topoMixta2.agregarComponente(new TopografiaTierra());
    	
    	Assertions.assertEquals(0.5625, topoMixta1.calcularProporcionAgua(), 0.0000001);
    }
    
    @Test
    public void test_es_igual_a_agua() {
    	TopografiaAgua topoAgua2 = new TopografiaAgua();
    	Assertions.assertTrue(topoAgua.esIgualA(topoAgua2));
    	Assertions.assertFalse(topoAgua.esIgualA(topoTierra));
    	Assertions.assertFalse(topoAgua.esIgualA(topoMixta1));
    }
    
    @Test
    public void test_es_igual_a_tierra() {
    	TopografiaTierra topoTierra2 = new TopografiaTierra();
    	Assertions.assertTrue(topoTierra.esIgualA(topoTierra2));
    	Assertions.assertFalse(topoTierra.esIgualA(topoAgua));
    	Assertions.assertFalse(topoTierra.esIgualA(topoMixta1));
    }
    
    @Test
    public void test_es_igual_a_mixta() {
    	TopografiaMixta topoMixta3 = new TopografiaMixta();
    	
    	topoMixta1.agregarComponente(topoAgua);
    	topoMixta1.agregarComponente(topoTierra);
    	topoMixta1.agregarComponente(topoAgua);
    	topoMixta1.agregarComponente(topoAgua);
    	
    	topoMixta2.agregarComponente(new TopografiaAgua());
    	topoMixta2.agregarComponente(new TopografiaTierra());
    	topoMixta2.agregarComponente(new TopografiaAgua());
    	topoMixta2.agregarComponente(new TopografiaAgua());
    	
    	topoMixta3.agregarComponente(new TopografiaAgua());
    	topoMixta3.agregarComponente(new TopografiaAgua());
    	topoMixta3.agregarComponente(new TopografiaTierra());
    	topoMixta3.agregarComponente(new TopografiaAgua());
    	
    	Assertions.assertTrue(topoMixta1.esIgualA(topoMixta2));
    	Assertions.assertFalse(topoMixta1.esIgualA(topoMixta3));
    }
}
