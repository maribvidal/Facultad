package ar.edu.unlp.info.oo1.Ejercicio23;

public class Producto {
	private String nombre;
	private String categoria;
	private double precio;
	private int unidades;
	
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
