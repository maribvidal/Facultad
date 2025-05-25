package unlp.oo2.patrones.ej20;

public class Arco extends Arma {
	public int obtenerDaño(Armadura armadura) {
		return armadura.calcularDaño(this);
	}
}