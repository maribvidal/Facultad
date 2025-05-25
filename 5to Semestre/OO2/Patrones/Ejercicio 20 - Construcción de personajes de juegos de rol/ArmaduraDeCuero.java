package unlp.oo2.patrones.ej20;

public class ArmaduraDeCuero extends Armadura {
	//
	public int calcularDaño(Martillo martilo) { return 6; }
	public int calcularDaño(Espada espada) { return 8; }
	public int calcularDaño(Baston baston) { return 2; }
	public int calcularDaño(Arco arco) { return 5; }
}