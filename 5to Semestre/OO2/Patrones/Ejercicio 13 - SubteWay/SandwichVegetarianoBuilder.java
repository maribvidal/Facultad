package unlp.oo2.patrones.ej13;

public class SandwichVegetarianoBuilder extends SandwichBuilder {
	//
	public SandwichVegetarianoBuilder() {
		super();
	}
	
	// INTERFAZ PÚBLICA
	
	public void colocarPan() {
		this.agregarComponenteSandwich(new Componente("Pan con semillas", 120));
	}
	public void colocarAderezo() {
		// No lleva aderezo
	}
	public void colocarPrincipal() {
		this.agregarComponenteSandwich(new Componente("Provoleta grillada", 200));
	}
	public void colocarAdicional() {
		this.agregarComponenteSandwich(new Componente("Berenjenas escabeche", 100));
	}
}