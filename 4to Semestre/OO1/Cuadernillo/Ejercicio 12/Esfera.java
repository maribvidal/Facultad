package ar.edu.unlp.oo1.ejercicio12;

public class Esfera extends Pieza {
	int radio;
	
	// Constructor
	public Esfera(String material, String color, int radio) {
		super(material, color);
		
		this.radio = radio; 
	}
	
	// Métodos implementados
	public double getSuperficie() {
		return (4/3 * Math.PI * Math.pow(this.radio, 2));
	}
	public double getVolumen() {
		return (4/3 * Math.PI * Math.pow(this.radio, 3));
	}
}
