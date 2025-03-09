package ar.edu.unlp.oo1.ejercicio23;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class PedidoTest {
	private IFormaDeEnvio unaFormaDeEnvio;
	private IFormaDeEnvio otraFormaDeEnvio;
	private IFormaDeEnvio terceraFormaDeEnvio;
	
	private IFormaDePago unaFormaDePago;
	private IFormaDePago otraFormaDePago;
	
	private Producto unProducto;
	private Producto otroProducto;
	
	private Pedido unPedido;
	private Pedido otroPedido;
	private Pedido tercerPedido;
	
	@BeforeEach
	void setUp() {
		unaFormaDeEnvio = new RetiroComercio();
		otraFormaDeEnvio = new RetiroSucursalCorreo();
		terceraFormaDeEnvio = new ExpressDomicilio();
		
		unaFormaDePago = new AlContado();
		otraFormaDePago = new SeisCuotas();
		
		unProducto = new Producto("Mediahora", "Golosinas", 50, 100);
		otroProducto = new Producto("Samsung", "Celulares", 800, 30);
		
		unPedido = new Pedido(unProducto, unaFormaDeEnvio, unaFormaDePago, 5);
		otroPedido = new Pedido(otroProducto, otraFormaDeEnvio, otraFormaDePago, 2);
		tercerPedido = new Pedido(unProducto, terceraFormaDeEnvio, unaFormaDePago, 0);
	}
	
	@Test
	void testCalcularCostoTotal() {
		// Probar con forma de envio "Retirar en el comercio" y forma de pago "Al contado"
		Assertions.assertEquals(50 * 5, unPedido.calcularCostoTotal());
		
		// Probar con forma de envio "Retirar en sucursal del correo" y forma de pago "6 cuotas"
		Assertions.assertEquals((3000 + (800 * 2) * 1.2), otroPedido.calcularCostoTotal());
		
		// Probar con forma de envio "Express a domicilio" y forma de pago "Al contado"
		Assertions.assertEquals(50, tercerPedido.calcularCostoTotal());
	}
}
