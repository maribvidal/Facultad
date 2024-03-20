package tp1;

public class ej5 {
	public static int[] maxMinProm1(int[] arreglo) {
		int[] devolver = new int[3];
		int valorMax = -1;
		int valorMin = 9999;
		int valorProm = 0;
		
		for (int i = 0; i < arreglo.length; i++) {
			if (arreglo[i] > valorMax) {valorMax = arreglo[i];}
			if (arreglo[i] < valorMin) {valorMin = arreglo[i];}
			valorProm += arreglo[i];
		}
		
		valorProm = valorProm / 3;
		devolver[0] = valorMax;
		devolver[1] = valorMin;
		devolver[2] = valorProm;
		return devolver;
	}
	
	public static void main(String[] args) {
		int[] arreglo = {1, 4, 10};
		int[] nueArreglo = maxMinProm1(arreglo);
		
		for (int i = 0; i < nueArreglo.length; i++) {System.out.println(i + " = " + nueArreglo[i]);}
	}
}
