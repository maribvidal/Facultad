package ar.edu.unlp.info.oo2.accesobd;

import static org.junit.jupiter.api.Assertions.assertEquals;
import java.util.Arrays;
import java.util.Collections;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class DatabaseProxyTest {
    private DatabaseAccess database;
    private DatabaseProxy proxy1, proxy2;
    private Sesion sesion1, sesion2;

    @BeforeEach
    void setUp() throws Exception {
        this.database = new DatabaseRealAccess();
        
        this.proxy1 = new DatabaseProxy();
        this.proxy2 = new DatabaseProxy();

        this.sesion1 = new Sesion(proxy1);
        this.sesion2 = new Sesion(proxy2);
    }
    
    @Test
    void test_iniciarSesion() {
    	sesion1.iniciarSesion("voltaire", "candido");
    	sesion2.iniciarSesion("rousseau", "emeleo");
    	
    	Assertions.assertTrue(sesion1.estaAutorizado());
    	Assertions.assertFalse(sesion2.estaAutorizado());
    }
    
    @Test
    void test_getSearchResults() {
    	sesion1.iniciarSesion("voltaire", "candido");
    	sesion2.iniciarSesion("rousseau", "emalea");
    	
        assertEquals(Arrays.asList("Spiderman", "Marvel"), proxy1.getSearchResults("select * from comics where id=1"));
        assertEquals(Collections.emptyList(), proxy2.getSearchResults("select * from comics where id=1"));
    }
    
    @Test
    void test_insertNewRow() {
    	sesion1.iniciarSesion("voltaire", "candido");
    	sesion2.iniciarSesion("rousseau", "emalea");
    	
        assertEquals(3, proxy1.insertNewRow(Arrays.asList("Patoruzú", "La flor")));
        assertEquals(0, proxy2.insertNewRow(Arrays.asList("Patoruzú", "La flor")));
    }
}