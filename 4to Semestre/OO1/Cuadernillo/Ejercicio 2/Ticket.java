package ar.edu.unlp.info.oo1.balanzaElectronica;

import java.time.LocalDate;

public class Ticket {
	LocalDate Fecha;
	int CantidadDeProductos;
	double PesoTotal;
	double PrecioTotal;
	
	// Constructor obligatorio
	public Ticket(int cantidadDeProductos, double pesoTotal, double precioTotal) {
		Fecha = LocalDate.now();
		CantidadDeProductos = cantidadDeProductos;
		PesoTotal = pesoTotal;
		PrecioTotal = precioTotal;
	}
	
	public double impuesto() {
		double IVA = this.PrecioTotal * 0.21;
		return IVA;
	}
	
	// Getters & Setters
	public LocalDate getFecha() { return Fecha; }
	public double getPesoTotal() { return PesoTotal; }
	public double getPrecioTotal() { return PrecioTotal; }
	public int getCantidadDeProductos() { return CantidadDeProductos; }
}
