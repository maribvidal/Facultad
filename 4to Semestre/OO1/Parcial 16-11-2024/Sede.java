package ar.edu.unlp.oo1.parcial;

// Cada sede tiene nombre del lugar, precio de estadía por día y 
// cantidad de días de la estadía

public class Sede {
	private String nombreLugar;
	private double precioEstadiaDia;
	private int cantidadDiasEstadia;
	
	public Sede(String nomL, double precioD, int cantD) {
		this.nombreLugar = nomL;
		this.precioEstadiaDia = precioD;
		this.cantidadDiasEstadia = cantD;
	}
	
	// Cada sede tiene un precio total que es el precio de
	// estadía por día multiplicado por la cantidad de días
	// del mismo
	public double obtenerPrecioTotal() { return (this.precioEstadiaDia * this.cantidadDiasEstadia); }
}
