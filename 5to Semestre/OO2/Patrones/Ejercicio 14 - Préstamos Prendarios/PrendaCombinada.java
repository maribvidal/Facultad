package unlp.oo2.patrones.ej14;

import java.util.ArrayList;
import java.util.List;

public class PrendaCombinada extends Prenda {
	private List<Prenda> componentes;
	
	//
	
	public PrendaCombinada() {
		this.componentes = new ArrayList<Prenda>();
	}
	
	// INTERFAZ PÚBLICA
	
	// Métodos relacionados con los hijos
	
	public void agregarPrenda(Prenda p) {
		if (!this.componentes.contains(p) && !this.equals(p))
			this.componentes.add(p);
	}
	
	public void quitarPrenda(Prenda p) {
		if (this.componentes.add(p))
			this.componentes.remove(p);
	}
	
	// Métodos a implementar
	
	public double calcularLiquidez() { return 0.5; }
	
	public double calcularValor() {
		double calculo = this.componentes.stream()
							.mapToDouble(p -> p.calcularValor())
							.sum();
		
		return calculo;
	}
}