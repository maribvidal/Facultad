package ar.edu.info.oo1.ej5_figuras;

public class Cuadrado extends Cuerpo2D {
	double lado = 0;
	
	public double getLado() { return this.lado; }
	public void setLado(double lado) { this.lado = lado; }

	public double getArea() { return getLado() * getLado(); }
	public double getPerimetro() { return getLado() * 4; }
}
