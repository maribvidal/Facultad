package parcial.segundaFecha;

public class Guerrero implements IRol {
	// Guerrero: (fuerza * 2) + nivel + inteligencia
	public double determinarValorBase(int nivel, Habilidad h) {
		double valor = (h.getFuerza() * 2) + nivel + h.getInteligencia();
		return valor;
	}
	
	// Guerrero: aumenta la fuerza del personaje en (nivel / 6)
	public void incrementarHabilidad(int nivel, Habilidad h) {
		double incremento = nivel / 6;
		h.aumentarFuerza(incremento);
	}
}
