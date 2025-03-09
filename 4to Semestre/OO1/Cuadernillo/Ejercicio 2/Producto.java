package ar.edu.unlp.info.oo1.balanzaElectronica;

public class Producto {
	double Peso = 0;
	double PrecioPorKilo = 0;
	String Descripcion;
	
	// Métodos
	public double getPrecio() { 
		return (Peso * PrecioPorKilo);
	}
	
	// Getters & Setters
	public String getDescripcion() { return Descripcion; }
	public double getPeso() { return Peso; }
	public double getPrecioPorKilo() { return PrecioPorKilo; }
	public void setPeso(double peso) { Peso = peso; }
	public void setPrecioPorKilo(double precioPorKilo) { PrecioPorKilo = precioPorKilo; }
	public void setDescripcion(String descripcion) { Descripcion = descripcion; }
}
