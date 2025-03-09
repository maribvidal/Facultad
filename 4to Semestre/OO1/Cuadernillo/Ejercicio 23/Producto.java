package ar.edu.unlp.oo1.ejercicio23;

public class Producto {
	private String nombre;
	private String categoria;
	private double precio;
	private int unidades;
	
	public Producto(String nombre, String categoria, double precio, int unidades) {
		this.nombre = nombre;
		this.categoria = categoria;
		this.precio = precio;
		this.unidades = unidades;
	}
	
	public int getUnidades() {
		return this.unidades;
	}
	public void setUnidades(int num) {
		this.unidades = num;
	}
	public String getCategoria() {
		return this.categoria;
	}
	public double getPrecio() {
		return this.precio;
	}
}
