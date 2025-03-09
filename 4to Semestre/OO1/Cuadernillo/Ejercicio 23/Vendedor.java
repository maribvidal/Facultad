package ar.edu.unlp.oo1.ejercicio23;

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
	
	public void crearPedido(Cliente cliente, IFormaDeEnvio formaDeEnvio, IFormaDePago formaDePago, Producto prod, int cantSolicitada) { 
		if (prod.getUnidades() >= cantSolicitada) {
			Pedido nuevoPedido = new Pedido(prod, formaDeEnvio, formaDePago, cantSolicitada);
			prod.setUnidades(prod.getUnidades() - cantSolicitada);
			cliente.agregarPedido(nuevoPedido);
		}
	}
	
	public void agregarProducto(Producto producto) {
		this.productosEnVenta.add(producto);
	}
}
