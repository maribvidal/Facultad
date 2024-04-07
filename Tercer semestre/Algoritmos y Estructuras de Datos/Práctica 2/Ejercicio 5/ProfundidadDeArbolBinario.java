package tp2.ejercicio1;

public class ProfundidadDeArbolBinario {
	BinaryTree<Integer> arbolBinario;
	
	public ProfundidadDeArbolBinario(BinaryTree<Integer> arb) {
		this.arbolBinario = arb;
	}
	
	public int sumaElementosProfundidad(int p) {
		int suma = 0;
		int nivel = 0;
		BinaryTree<Integer> arbolAux = null;
		Queue<BinaryTree<Integer>> cola = new Queue<BinaryTree<Integer>>();
		cola.enqueue(arbolBinario);
		cola.enqueue(null);
		while (!cola.isEmpty() && (nivel <= p)) {
			arbolAux = cola.dequeue();
			if (arbolAux != null) {
				if (nivel == p)
					suma += arbolAux.getData();
				if (arbolAux.hasLeftChild()) {cola.enqueue(arbolAux.getLeftChild());}
				if (arbolAux.hasRightChild()) {cola.enqueue(arbolAux.getRightChild());}
			} else if (!cola.isEmpty()) {
				cola.enqueue(null);
				nivel++;
			}
		}
		
		if (nivel < p || p < 0)
			System.out.println("No se pudieron encontrar elementos de dicha profundidad");
		
		return suma;
	}
}
