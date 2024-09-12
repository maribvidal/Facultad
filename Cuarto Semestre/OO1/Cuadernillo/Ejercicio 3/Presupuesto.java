package ar.edu.info.oo1.ej3_presupuestos;

import java.time.LocalDate;
import java.util.List;
import java.util.ArrayList;

public class Presupuesto {
	String cliente;
	LocalDate fecha;
	List<Item> items;
	
	// Constructor
	public Presupuesto(String cliente) {
		this.cliente = cliente;
		this.fecha = LocalDate.now();
		this.items = new ArrayList<Item>();
	}
	
	// Getters & Setters
	public LocalDate getFecha() { return this.fecha; }
	public String getCliente() { return this.cliente; }
	
	public void agregarItem(Item item) {
		items.add(item);
	}
	
	public double calcularTotal() {
		// Obtenemos un "stream" de items, y de él obtenemos la suma de todos los costos
		double suma = items.stream().mapToDouble(item -> item.costo()).sum();
		return suma;
	}
}
