package ar.edu.info.oo1.ej5_figuras;

public class Circulo extends Cuerpo2D {
	double radio = 0;
	double PI = Math.PI;
	
	public double getRadio() { return this.radio; }
	public void setRadio(double radio) { this.radio = radio; }
	public double getDiametro() { return this.radio * 2; }
	public void setDiametro(double diametro) { this.setRadio(diametro / 2); }
	
	public double getArea() { return PI * Math.pow(getRadio(), 2); }
	public double getPerimetro() { return PI * getDiametro(); }
}
