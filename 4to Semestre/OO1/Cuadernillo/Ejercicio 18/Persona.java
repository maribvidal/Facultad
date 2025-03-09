package ar.edu.unlp.oo1.ejercicio17;

public abstract class Persona {
	String nombre;
	String direccion;
	String DNI;
	
	public Persona(String nombre, String direccion, String DNI) {
		this.nombre = nombre;
		this.direccion = direccion;
		this.DNI = DNI;
	}
}
