package parcial.segundaFecha;

public class Guerrero implements IRol {
	// Guerrero: (fuerza * 2) + nivel + inteligencia
	public double determinarValorBase(Personaje p) {
		double valor = (p.getFuerza() * 2) + p.getNivel() + p.getInteligencia();
		return valor;
	}
	
	// Guerrero: aumenta la fuerza del personaje en (nivel / 6)
	public void incrementarHabilidad(Personaje p) {
		double incremento = p.getNivel() / 6;
		p.aumentarFuerza(incremento);
	}
}
