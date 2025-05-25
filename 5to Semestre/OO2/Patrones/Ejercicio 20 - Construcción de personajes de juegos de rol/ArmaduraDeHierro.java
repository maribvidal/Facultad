package unlp.oo2.patrones.ej20;

public class ArmaduraDeHierro extends Armadura {
	//
	public int calcularDaño(Martillo martilo) { return 5; }
	public int calcularDaño(Espada espada) { return 5; }
	public int calcularDaño(Baston baston) { return 1; }
	public int calcularDaño(Arco arco) { return 3; }
}