package unlp.oo2.patrones.ej4;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.lang.RuntimeException;
import java.time.LocalDate;

/**
 * Aca escribiremos los test de unidad para cada clase 
 * 
 */
public class ToDoItemTest {
	
	ToDoItem item1, item2, item3, item4;
	
	@BeforeEach
	void setUp() throws Exception {
		item1 = new ToDoItem();
		item2 = new ToDoItem("Framework");
		item3 = new ToDoItem("Patrones");
		item4 = new ToDoItem("Refactoring");
	}
	
    @Test
    public void test_tareaSinInicializar() {
    	RuntimeException thrown = Assertions.assertThrows(
    			RuntimeException.class,
    			() -> item1.start(),
    			"Se esperaba que tirara una excepción pero no ocurrió"
    		);
    	
    	Assertions.assertTrue(item2.getEstado().getClass() == PendingItem.class);
    }
    
    @Test
    public void test_start() {
    	item1.cambiarEstado(new FinishedItem());
    	item2.start();
    	item3.cambiarEstado(new InProgressItem());
    	item4.cambiarEstado(new PausedItem());
    	Assertions.assertTrue(item2.getEstado().getClass() == InProgressItem.class);
    	Assertions.assertTrue(item1.getEstado().getClass() == FinishedItem.class);
    	Assertions.assertTrue(item3.getEstado().getClass() == InProgressItem.class);
    	Assertions.assertTrue(item4.getEstado().getClass() == PausedItem.class);
    }
    
    @Test
    public void test_togglePause() {
    	item1.cambiarEstado(new PausedItem());
    	item3.cambiarEstado(new InProgressItem());
    	item4.cambiarEstado(new FinishedItem());
    	
    	item1.togglePause();
    	
    	RuntimeException thrown = Assertions.assertThrows(
    			RuntimeException.class,
    			() -> item2.togglePause()
    		);
    	
    	item3.togglePause();
    	
    	RuntimeException thrown2 = Assertions.assertThrows(
    			RuntimeException.class,
    			() -> item4.togglePause()
    		);
    	
    	Assertions.assertTrue(item1.getEstado().getClass() == InProgressItem.class);
    	Assertions.assertTrue(item3.getEstado().getClass() == PausedItem.class);
    }
    
    @Test
    public void test_finish() {
    	item1.cambiarEstado(new PausedItem());
    	item3.cambiarEstado(new InProgressItem());
    	item4.cambiarEstado(new FinishedItem());
    	
    	item1.finish();
    	item2.finish();
    	item3.finish();
    	item4.finish();
    	
    	Assertions.assertTrue(item1.getEstado().getClass() == FinishedItem.class);
    	Assertions.assertTrue(item2.getEstado().getClass() == PendingItem.class);
    	Assertions.assertTrue(item3.getEstado().getClass() == FinishedItem.class);
    	Assertions.assertTrue(item4.getEstado().getClass() == FinishedItem.class);	
    }
    
    @Test
    public void test_workedTime() {
    	item2.cambiarEstado(new PausedItem());
    	item2.start();
    	item2.finish();
    	
    	Assertions.assertNotNull(item2.workedTime());
    	
    	RuntimeException thrown = Assertions.assertThrows(
    			RuntimeException.class,
    			() -> item1.workedTime()
    		);
    }
    
    @Test
    public void test_comentarios() {
    	item2.addComment("Pepe");
    	item2.addComment("Pepe");
    	
    	item4.cambiarEstado(new FinishedItem());
    	item4.addComment("Pepe");
    	
    	Assertions.assertEquals(2, item2.getComentarios().size());
    	Assertions.assertEquals(0, item4.getComentarios().size());
    }
}
