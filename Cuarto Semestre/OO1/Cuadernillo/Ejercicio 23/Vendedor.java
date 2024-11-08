package ar.edu.unlp.info.oo1.Ejercicio23;

import java.util.ArrayList;
import java.util.List;

public class Vendedor extends Persona {
	private List<Producto> productosEnVenta;
	
	public Vendedor(String nombre, String apellido, String direccion) {
		this.nombre = nombre;
		this.apellido = apellido;
		this.direccion = direccion;
		this.productosEnVenta = new ArrayList<Producto>();
	}
	
	public Pedido crearPedido(Cliente cliente, IFormaDeEnvio formaDeEnvio, IFormaDePago formaDePago, Producto prod, int cantSolicitada) { 
		Pedido nuevoPedido = null;
		
		if (prod.getUnidades() >= cantSolicitada ) {
			nuevoPedido = new Pedido(prod, formaDeEnvio, formaDePago, cantSolicitada);
			prod.setUnidades (prod.getUnidades() - cantSolicitada);
			cliente.agregarPedido(nuevoPedido);
		}
			
		return nuevoPedido;
	}
}
