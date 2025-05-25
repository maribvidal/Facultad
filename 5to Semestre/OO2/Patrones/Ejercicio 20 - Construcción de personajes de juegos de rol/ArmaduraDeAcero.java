package unlp.oo2.patrones.ej20;

public class ArmaduraDeAcero extends Armadura {
	//
	public int calcularDaño(Martillo martilo) { return 4; }
	public int calcularDaño(Espada espada) { return 3; }
	public int calcularDaño(Baston baston) { return 1; }
	public int calcularDaño(Arco arco) { return 2; }
}