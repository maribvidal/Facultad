package unlp.oo2.patrones.ej20;

import java.util.ArrayList;
import java.util.List;

public class Personaje {
	private String nombre;
	private int vida;
	private Arma arma;
	private Armadura armadura;
	private List<Habilidad> habilidades;
	
	//
	
	public Personaje() {
		this.vida = 100;
		this.habilidades = new ArrayList<Habilidad>();
	}
	
	// INTERFAZ PÚBLICA
	
	public void enfrentar(Personaje otro) {
		// Si ninguno de los dos tiene vida, terminar con una excepción
		this.controlarSiTieneVida();
		otro.controlarSiTieneVida();
		
		// Si no, proceder con el enfrentamiento
		this.atacar(otro);
	}
	
	// Métodos pensados para el constructor
	
	public void setNombre(String nombre) { this.nombre = nombre; }
	public void setArma(Arma arma) { this.arma = arma; }
	public void setArmadura(Armadura armadura) { this.armadura = armadura; }
	public void agregarHabilidad(Habilidad habilidad) { this.habilidades.add(habilidad); }
	public int getVida() { return this.vida; }
	
	// MÉTODOS PRIVADOS
	
	protected void controlarSiTieneVida() {
		if (!this.tieneVida())
			throw new RuntimeException("El personaje no tiene vida");
	}
	
	protected Armadura obtenerArmadura() { return this.armadura; }
	protected void restarVida(int daño) { this.vida = this.vida - daño; }
	protected boolean tieneVida() { return this.vida > 0; }
	
	private void atacar(Personaje otro) {
		int calcularDaño = this.arma.obtenerDaño(otro.obtenerArmadura());
		otro.restarVida(calcularDaño);
	}
}