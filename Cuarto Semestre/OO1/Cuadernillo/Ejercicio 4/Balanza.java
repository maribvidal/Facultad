package ar.edu.unlp.info.oo1.balanzaElectronica;

import java.util.ArrayList;
import java.util.List;

public class Balanza {
	List<Producto> Productos = new ArrayList<Producto>();
	int CantidadDeProductos = 0;
	// La variable de PesoTotal y PrecioTotal ya no son necesarias
	// porque se puede sacar el total de cada cosa con los streams
	
	// Métodos
	public void ponerEnCero() {
		CantidadDeProductos = 0;
		// Resetear la balanza
		Productos.clear();
	}
	
	public void agregarProducto(Producto producto) {
		Productos.add(producto);
		CantidadDeProductos++;
	}
	
	public Ticket emitirTicket() {		
		//Calcular totales del peso y precio
		double PesoTotal = this.getPesoTotal();
		double PrecioTotal = this.getPrecioTotal();
		
		// Generar ticket
		return (new Ticket(this.CantidadDeProductos, PesoTotal, PrecioTotal));
	}
	
	// Getters & Setters
	public double getPesoTotal() { 
		return this.getProductos().stream().mapToDouble(producto -> producto.getPeso()).sum();
	}
	public double getPrecioTotal() { 
		return this.getProductos().stream().mapToDouble(producto -> producto.getPrecio()).sum();
	}
	public int getCantidadDeProductos() { return CantidadDeProductos; }
	public List<Producto> getProductos() { return Productos; }
}
