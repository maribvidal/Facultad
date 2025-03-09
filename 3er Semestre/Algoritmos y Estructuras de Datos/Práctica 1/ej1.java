package tp1;

public class Calc {
	//Métodos
	public static void numerosEntreA(int a, int b) {
		for (int i = a; i <= b; i++) {
			System.out.print(i + " ");
		}
	}
	
	public static void numerosEntreB(int a, int b) {
		int i = 0;
		while (i <= b) {
			System.out.print(i + " ");
			i++;
		}
	}
	
	public static void numerosEntreC(int a, int b) {
		if (a <= b) {
			System.out.print(a + " ");
			numerosEntreC(a + 1, b);
		}
	}
	
	//Programa principal
	public static void main(String[] args) {
		System.out.println("Inciso A");
		numerosEntreA(1, 50);
		System.out.println("\nInciso B");
		numerosEntreB(1, 75);
		System.out.println("\nInciso C");
		numerosEntreC(1, 20);
	}
}
