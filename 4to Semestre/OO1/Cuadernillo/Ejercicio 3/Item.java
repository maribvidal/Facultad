package ar.edu.info.oo1.ej3_presupuestos;

public class Item {
	String detalle;
	int cantidad;
	double costoUnitario;
	
	// Constructor
	public Item(String detalle, int cantidad, double costoUnitario) {
		this.detalle = detalle;
		this.cantidad = cantidad;
		this.costoUnitario = costoUnitario;
	}
	
	// Getters & Setters
	public double getCostoUnitario() { return this.costoUnitario; }
	
	public double costo() {
		return cantidad * costoUnitario;
	}
}
