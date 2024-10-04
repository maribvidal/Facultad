package ar.edu.unlp.oo1.ejercicio12;

import java.util.LinkedList;
import java.util.List;

public class ReporteDeConstruccion {
	List<Pieza> piezas;
	
	public ReporteDeConstruccion() { this.piezas = new LinkedList<Pieza>(); }
	
	// Métodos
	public void agregarPieza(Pieza pieza) { this.piezas.add(pieza); }
	
	public double volumenDeMaterial(String material) {
		double total = this.piezas.stream().filter(p -> p.material == material).mapToDouble(p -> p.getVolumen()).sum();
		return total;
	}
	
	public double superficieDeColor(String color) {
		double total = this.piezas.stream().filter(p -> p.color == color).mapToDouble(p -> p.getSuperficie()).sum();
		return total;
	}
}
