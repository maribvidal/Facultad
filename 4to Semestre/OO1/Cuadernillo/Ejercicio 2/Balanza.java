package ar.edu.unlp.info.oo1.balanzaElectronica;

public class Balanza {
	int CantidadDeProductos = 0;
	double PrecioTotal = 0;
	double PesoTotal = 0;
	
	// Métodos
	public void ponerEnCero() {
		CantidadDeProductos = 0;
		PrecioTotal = 0;
		PesoTotal = 0;
	}
	
	public void agregarProducto(Producto producto) {
		CantidadDeProductos++;
		PrecioTotal += producto.getPrecio();
		PesoTotal += producto.getPeso();
	}
	
	public Ticket emitirTicket() {
		return (new Ticket(this.CantidadDeProductos, this.PrecioTotal, this.PesoTotal));
	}
	
	// Getters & Setters
	public double getPesoTotal() { return PesoTotal; }
	public double getPrecioTotal() { return PrecioTotal; }
	public int getCantidadDeProductos() { return CantidadDeProductos; }
}
