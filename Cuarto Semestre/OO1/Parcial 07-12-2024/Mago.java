package parcial.segundaFecha;

public class Mago implements IRol {
	// Mago: (inteligencia + nivel) * 2
	public double determinarValorBase(Personaje p) {
		double valor = (p.getInteligencia() + p.getNivel()) * 2;
		return valor;
	}
	
	// Mago: aumenta la inteligencia del personaje en (3/2 * nivel)
	public void incrementarHabilidad(Personaje p) {
		double incremento = (3/2 * p.getNivel());
		p.aumentarInteligencia(incremento);
	}
}
