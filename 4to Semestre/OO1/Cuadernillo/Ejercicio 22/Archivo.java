package ar.edu.unlp.info.oo1.ejercicio22_estadisticas;

public class Archivo {
	String nombre;
	
	public Archivo(String nombre) { this.nombre = nombre; }
	
	public int tamaño() {
		return nombre.length();
	}
}
