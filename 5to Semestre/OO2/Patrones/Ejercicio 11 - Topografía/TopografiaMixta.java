package unlp.oo2.patrones.ej11;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.IntStream;

public class TopografiaMixta extends Topografia {
	private List<Topografia> componentes;
	
	public TopografiaMixta() {
		// Ya sabemos que la TopografiaMixta va a tener, a lo sumo, 4 elementos
		componentes = new ArrayList<Topografia>();
	}
	
	public double calcularProporcionAgua() {
		double calculo = componentes.stream()
							.mapToDouble(comp -> comp.calcularProporcionAgua())
							.sum() / 4;
		return (this.componentes.size() > 0 ? calculo : 0);
	}
	public boolean esUnCompuesto() { return true; }
	public List<Topografia> getComponentes() { return this.componentes; }
	
	public void agregarComponente(Topografia t) {
		if (this.componentes.size() > 3)
			throw new RuntimeException("No pueden agregarse mas de 4 objetos");
		
		componentes.add(t);
	}
	
	// DOUBLE DISPATCH
	
	@Override public boolean esIgualA(Topografia t) { return t.esIgualA(this); }
	
	public boolean esIgualA(TopografiaAgua t) { return false; }
	public boolean esIgualA(TopografiaTierra t) { return false; }
	public boolean esIgualA(TopografiaPantano t) { return false; }
	public boolean esIgualA(TopografiaMixta t) {
		boolean mismoTamaño = (this.componentes.size() == t.getComponentes().size());
		boolean elementosIguales = IntStream.range(0, this.componentes.size())
								.allMatch(i -> (this.componentes.get(i).calcularProporcionAgua() == t.getComponentes().get(i).calcularProporcionAgua()));
		return mismoTamaño && elementosIguales;
	}
}