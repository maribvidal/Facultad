package tp2.ejercicio1;

public class SumaDiferencia {
	private int suma = 0;
	private int diferencia = 0;
	
	public SumaDiferencia(int suma, int diferencia) {
		this.suma = suma;
		this.diferencia = diferencia;
	}
	
	public int getSuma() {return this.suma;}
	public void setSuma(int valor) {this.suma = valor;}
	public int getDiferencia() {return this.diferencia;}
	public void setDiferencia(int valor) {this.diferencia = valor;}
}
