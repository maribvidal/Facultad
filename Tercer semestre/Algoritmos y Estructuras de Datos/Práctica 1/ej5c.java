package practica4;

public class ej5c {
	static int valorMax = -1;
	static int valorMin = 9999;
	static int valorProm = 0;
	static int[] arreglo = {1, 2, 3, 4, 5, 6}; //Arreglo que se va a pasar
	static int[] devolver = new int[3];
	
	public static void maxMinProm1() {
		for (int i = 0; i < arreglo.length; i++) {
			if (arreglo[i] > valorMax) {valorMax = arreglo[i];}
			if (arreglo[i] < valorMin) {valorMin = arreglo[i];}
			valorProm += arreglo[i];
		}
		
		valorProm = valorProm / arreglo.length;
		devolver[0] = valorMax;
		devolver[1] = valorMin;
		devolver[2] = valorProm;
	}
	
	public static void main(String[] args) {
		maxMinProm1();
		for (int i = 0; i < devolver.length; i++) {System.out.println(i + " = " + devolver[i]);}
	}
}
