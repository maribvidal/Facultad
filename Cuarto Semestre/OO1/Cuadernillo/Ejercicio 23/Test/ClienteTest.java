package ar.edu.unlp.oo1.ejercicio23;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class ClienteTest {
	private Producto unJuego;
	private Producto otroJuego;
	private Producto unCD;
	private Producto unLibro;
	
	private Cliente unCliente;
	
	private IFormaDeEnvio unaFormaDeEnvio;
	private IFormaDePago unaFormaDePago;
	
	private Pedido unPedido;
	private Pedido otroPedido;
	private Pedido tercerPedido;
	private Pedido cuartoPedido;
	
	@BeforeEach
	void setUp() {
		unCliente = new Cliente("René", "Descartes", "Calle 13");
		
		unaFormaDeEnvio = new RetiroComercio();
		unaFormaDePago = new AlContado();
		
		unJuego = new Producto("Celeste", "Juegos", 10, 100);
		otroJuego = new Producto("Terraria", "Juegos", 15, 500);
		unCD = new Producto("In Rainbows", "CDs", 30, 50);
		unLibro = new Producto("Soy un gato", "Libros", 20, 10);
		
		unPedido = new Pedido(unJuego, unaFormaDeEnvio, unaFormaDePago, 1);
		otroPedido = new Pedido(otroJuego, unaFormaDeEnvio, unaFormaDePago, 1);
		tercerPedido = new Pedido(unCD, unaFormaDeEnvio, unaFormaDePago, 1);
		cuartoPedido = new Pedido(unLibro, unaFormaDeEnvio, unaFormaDePago, 1);
	}
	
	@Test
	void testContarProductorPorCategoria() {
		// Valor de borde - el cliente no tiene pedidos solicitados
		Assertions.assertEquals(0, unCliente.contarProductorPorCategoria().size());
		
		unCliente.agregarPedido(unPedido);
		unCliente.agregarPedido(otroPedido);
		unCliente.agregarPedido(tercerPedido);
		unCliente.agregarPedido(cuartoPedido);
		
		Assertions.assertEquals(3, unCliente.contarProductorPorCategoria().size());
		Assertions.assertEquals(2, unCliente.contarProductorPorCategoria().contarItems("Juegos"));
	}
}
