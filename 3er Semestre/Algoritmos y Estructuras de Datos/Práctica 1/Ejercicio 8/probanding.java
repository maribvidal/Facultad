package tp1.ejercicio8;

public class ej8test {
	public static void main(String[] args) {
		//Crear una cola de tipo genérico Integer
		Queue<Integer> colaNumerica = new Queue<Integer>();
		
		//Encolar todos los numeros naturales del 1 al 10 inclusive
		for (int i = 1; i <= 10; i++)
			colaNumerica.enqueue(i);
		
		//Imprimir cola junto a su tamaño
		System.out.println(colaNumerica.toString() + " / Tamaño: " + colaNumerica.size());
		
		//Remover el último elemento
		int ultElem = colaNumerica.dequeue();
		
		//Imprimir el último elemento y la cola
		System.out.println("Ha salido un elemento de la cola: " + ultElem);
		System.out.println(colaNumerica.toString() + " / Tamaño: " + colaNumerica.size());
		
		//Descolar todos los elementos de la cola
		while (!colaNumerica.isEmpty()) {
			ultElem = colaNumerica.dequeue();
			System.out.println(colaNumerica.size() + " / Ha salido un elemento de la cola: " + ultElem);
		}
		
		//Preguntar si está vacía
		System.out.println(colaNumerica.isEmpty());
	}
}
