package unlp.oo2.patrones.ej5;

import java.util.ArrayList;
import java.util.List;

public class Pelicula {
	private String titulo;
	private int añoEstreno;
	private List<Pelicula> peliculasSimilares;
	private double puntaje;
	
	public Pelicula(
			String titulo, 
			int añoEstreno, 
			List<Pelicula> peliculasSimilares, 
			double puntaje) {
		this.titulo = titulo;
		this.añoEstreno = añoEstreno;
		this.peliculasSimilares = (peliculasSimilares != null 
					? peliculasSimilares 
					: new ArrayList<Pelicula>()
				);
		this.puntaje = puntaje;
	}
	
	public void agregarPeliculaSimilar(Pelicula p) {
		if (p != null) this.peliculasSimilares.add(p);
	}
	
	public double getPuntaje() { return this.puntaje; }
	public int getAñoEstreno() { return this.añoEstreno; }
	
	// Métodos para compararse
	public int compararPorAño(Pelicula p) {
		return compare(this.añoEstreno, p.getAñoEstreno());
	}
	
	public int compararPorPuntaje(Pelicula p) {
		int comparadorPuntaje = compare(this.puntaje, p.getPuntaje());
		// Si ambas pelis tienen el mismo puntaje, entonces hay que comparar por año también
		int resultado = (comparadorPuntaje != 0 ? comparadorPuntaje : this.compararPorAño(p));
		return resultado;
	}
	
	public boolean esSimilarA(Pelicula p) {
		return this.peliculasSimilares.contains(p);
	}
	
	@Override
	public String toString() {
		return this.titulo + " - " + this.getAñoEstreno();
	}
	
	// MÉTODOS PRIVADOS
	
	private int compare(int x, int y) { return (x < y) ? 1 : ((x == y) ? 0 : -1); }
	private int compare(double x, double y) { return (x < y) ? 1 : ((x == y) ? 0 : -1); }
}