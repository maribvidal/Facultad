package unlp.oo2.patrones.ej13;

public class SandwichSinTACCBuilder extends SandwichBuilder {
	//
	public SandwichSinTACCBuilder() {
		super();
	}
	
	// INTERFAZ PÚBLICA
	
	public void colocarPan() {
		this.agregarComponenteSandwich(new Componente("Pan de chipa", 150));
	}
	public void colocarAderezo() {
		this.agregarComponenteSandwich(new Componente("Salsa tártara", 18));
	}
	public void colocarPrincipal() {
		this.agregarComponenteSandwich(new Componente("Carne pollo", 250));
	}
	public void colocarAdicional() {
		this.agregarComponenteSandwich(new Componente("Verduras grilladas", 200));
	}
}