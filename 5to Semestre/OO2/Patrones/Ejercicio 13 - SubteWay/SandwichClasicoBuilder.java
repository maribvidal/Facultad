package unlp.oo2.patrones.ej13;

public class SandwichClasicoBuilder extends SandwichBuilder {
	//
	public SandwichClasicoBuilder() {
		super();
	}
	
	// INTERFAZ PÚBLICA
	
	public void colocarPan() { 
		this.agregarComponenteSandwich(new Componente("Pan brioche", 100));
	}
	public void colocarAderezo() {
		this.agregarComponenteSandwich(new Componente("Mayonesa", 20));
	}
	public void colocarPrincipal() {
		this.agregarComponenteSandwich(new Componente("Carne ternera", 300));
	}
	public void colocarAdicional() {
		this.agregarComponenteSandwich(new Componente("Tomate", 80));
	}
}