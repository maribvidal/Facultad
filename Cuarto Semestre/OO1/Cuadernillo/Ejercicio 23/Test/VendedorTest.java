package ar.edu.unlp.oo1.ejercicio23;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class VendedorTest {
	private Producto unProducto;
	
	private Vendedor unVendedor;
	private Cliente unCliente;
	
	private IFormaDeEnvio unaFormaDeEnvio;
	private IFormaDePago unaFormaDePago;
	
	private Pedido unPedido;
	
	@BeforeEach
	void setUp() {
		unProducto = new Producto("Cocucha", "Gaseosas", 4, 10);
		
		unaFormaDeEnvio = new RetiroComercio();
		unaFormaDePago = new AlContado();
		
		unCliente = new Cliente("Juan", "Perez", "Calle 1");
		unVendedor = new Vendedor("Maria", "Perez", "Calle 1");
		
		unVendedor.agregarProducto(unProducto);
	}
	
	@Test
	void testCrearPedido() {
		// Pedido exitoso
		
		unVendedor.crearPedido(unCliente, unaFormaDeEnvio, unaFormaDePago, unProducto, 10);
		
		Assertions.assertEquals(1, unCliente.contarProductorPorCategoria().size());
		Assertions.assertEquals(0, unProducto.getUnidades());
		
		// Pedido fallido
		
		unVendedor.crearPedido(unCliente, unaFormaDeEnvio, unaFormaDePago, unProducto, 1);
		
		Assertions.assertFalse(unCliente.contarProductorPorCategoria().contarItems("Gaseosas") > 10);
	}
}
