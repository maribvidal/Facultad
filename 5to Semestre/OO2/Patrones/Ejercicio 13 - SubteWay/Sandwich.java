package unlp.oo2.patrones.ej13;

import java.util.ArrayList;
import java.util.List;

public class Sandwich {
	private List<IComponente> componentes;
	
	//
	
	public Sandwich() { this.componentes = new ArrayList<IComponente>(); }
	
	// INTERFAZ PÚBLICA
	
	public void agregarComponente(IComponente c) {
		this.componentes.add(c);
	}
	
	public int obtenerPrecio() {
		int sumatoria = this.componentes.stream()
				.mapToInt(c -> c.obtenerPrecio())
				.sum();
		
		return sumatoria;
	}
}