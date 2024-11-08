package ar.edu.unlp.info.oo1.Ejercicio23;

import java.util.ArrayList;
import java.util.List;

public class Cliente extends Persona {
	private List<Pedido> pedidosSolicitados;
	
	public Cliente(String nombre, String apellido, String direccion) {
		this.nombre = nombre;
		this.apellido = apellido;
		this.direccion = direccion;
		this.pedidosSolicitados = new ArrayList<Pedido>();
	}
	public CategoriaMap contarProductorPorCategoria () { 
		CategoriaMap bolsa = new CategoriaMap();
		
		this.pedidosSolicitados.stream().forEach(pedido -> {
			// Por cada pedido...
			bolsa.add(pedido.getCategoria());
		});
		
		return bolsa;
	}
	
	public void agregarPedido(Pedido pedido) {
		this.pedidosSolicitados.add(pedido);
	}
}
