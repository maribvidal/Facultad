package ar.edu.unlp.oo1.ejercicio12;

public class PrismaRectangular extends Pieza {
	int ladoMayor; 
	int ladoMenor; 
	int altura;
	
	// Constructor
	public PrismaRectangular(String material, String color, int ladoMayor, int ladoMenor, int altura) { 
		super(material, color);
		
		this.ladoMayor = ladoMayor;
		this.ladoMenor = ladoMenor;
		this.altura = altura;
	}
	
	// Métodos implementados
	public double getSuperficie() {
		return (2 * (ladoMayor * ladoMenor + ladoMayor * altura + ladoMenor * altura));
	}
	public double getVolumen() {
		return (ladoMayor * ladoMenor * altura);
	}
}
