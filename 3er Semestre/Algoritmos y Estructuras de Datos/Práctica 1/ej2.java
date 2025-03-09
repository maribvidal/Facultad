package tp1;

import java.util.Scanner;

public class ej2 {
	public static int[] primerosValores(int n) {
		int[] arreglo = new int [n];
		for (int i = 1; i <= n; i++) {
			arreglo[i - 1] = i * n;
		}
		return arreglo;
	}
	
    public static void main(String[] args){
    	Scanner s = new Scanner(System.in);
    	int num = 1;
    	int[] nueArreglo;
    	while (num > 0) {
    		System.out.println("Ingrese un número");
    		num = s.nextInt();
    		nueArreglo = primerosValores(num);
    	
    		for (int i = 0; i < nueArreglo.length; i++) {
    			System.out.print(nueArreglo[i] + " ");
    		}
    		System.out.println();
    		
    	}
    }
}
