package ar.edu.unlp.oo1.ejercicio12;

public abstract class Pieza {
	String material; 
	String color;
	
	public Pieza(String material, String color) { this.material = material; this.color = color; }
	
	public abstract double getSuperficie();
	public abstract double getVolumen();
}
