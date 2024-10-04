package ar.edu.unlp.oo1.Ejercicio13;

public class Archivo {
	String nombre;
	
	public Archivo(String nombre) { this.nombre = nombre; }
	
	public int tamaño() {
		return nombre.length();
	}
}
