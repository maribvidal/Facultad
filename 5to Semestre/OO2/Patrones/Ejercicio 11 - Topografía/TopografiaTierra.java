package unlp.oo2.patrones.ej11;

public class TopografiaTierra extends Topografia {
	public double calcularProporcionAgua() { return 0; }
	
	// DOUBLE DISPATCH
	
	@Override public boolean esIgualA(Topografia t) { return t.esIgualA(this); }
	
	public boolean esIgualA(TopografiaAgua t) { return false; }
	public boolean esIgualA(TopografiaTierra t) { return true; }
	public boolean esIgualA(TopografiaPantano t) { return false; }
	public boolean esIgualA(TopografiaMixta t) { return false; }
}