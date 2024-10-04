package ar.edu.unlp.oo1.ejercicio12;

public class Cilindro extends Pieza {
	int radio; 
	int altura;
	
	// Constructor
	public Cilindro(String material, String color, int radio, int altura) { 
		super(material, color);
		
		this.radio = radio; 
		this.altura = altura; 
	}
	
	// Métodos implementados
	public double getSuperficie() {
		return (2 * Math.PI * this.radio * (this.altura + 2) * Math.PI * Math.pow(this.radio, 2));
	}
	public double getVolumen() {
		return (Math.PI * Math.pow(this.radio, 2) * this.altura);
	}
}
