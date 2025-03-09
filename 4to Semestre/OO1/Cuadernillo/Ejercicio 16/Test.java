package ar.edu.unlp.oo1.ejercicio16;

public class Test {
	public static void main(String[] args) {
		EvenNumberSet numbers = new EvenNumberSet();
		// inicialmente el Set está vacío => []
		numbers.add(1); // No es par, entonces no se agrega => []
		numbers.add(2); // Es par, se agrega al set => [2]
		numbers.add(4); // Es par, se agrega al set => [2, 4]
		numbers.add(2); // Es par, pero ya está en el set, no se agrega => [2, 4]
		
		System.out.println(numbers.size());
		System.out.println(numbers.contains(1));
		System.out.println(numbers.contains(2));
	}
}
