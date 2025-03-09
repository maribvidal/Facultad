package ar.edu.info.oo1.ej5_figuras;

public class Cuerpo3D {
	double altura = 0;
	Cuerpo2D caraBasal;
	
	public void setAltura(double altura) { this.altura = altura; };
	public double getAltura() { return this.altura; } ;
	public void setCaraBasal(Cuerpo2D cara) { this.caraBasal = cara; }
	//public Cuerpo2D getCaraBasal() { return this.caraBasal; }
	
	public double getVolumen() { return caraBasal.getArea() * getAltura(); }
	public double getSuperficieExterior() { 
		//2* área-cara-basal + perímetro-cara-basal * altura-del-cuerpo
		double aux = 2 * caraBasal.getArea();
		double aux2 = caraBasal.getPerimetro() * getAltura();
		return aux + aux2;
	}
}
