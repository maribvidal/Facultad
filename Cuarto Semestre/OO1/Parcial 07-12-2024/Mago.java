package parcial.segundaFecha;

public class Mago implements IRol {
	// Mago: (inteligencia + nivel) * 2
	public double determinarValorBase(int nivel, Habilidad h) {
		double valor = (h.getInteligencia() + nivel) * 2;
		return valor;
	}
	
	// Mago: aumenta la inteligencia del personaje en (3/2 * nivel)
	public void incrementarHabilidad(int nivel, Habilidad h) {
		double incremento = (3/2 * nivel);
		h.aumentarInteligencia(incremento);
	}
}
