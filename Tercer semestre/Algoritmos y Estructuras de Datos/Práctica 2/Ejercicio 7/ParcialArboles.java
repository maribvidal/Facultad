package tp2.ejercicio1;

public class ParcialArboles {
	BinaryTree<Integer> _parcialArbol;
	
	public ParcialArboles(BinaryTree<Integer> parcialArbol) {
		_parcialArbol = parcialArbol;
	}
	
	public boolean isLeftTree(int num) {
		//Si el árbol con raíz "num" no cuenta con una de sus ramas, considere que en esa rama hay -1 árboles con único hijo
		int arbolesIzq = -1;
		int arbolesDer = -1;
		BinaryTree<Integer> nodoRaiz = EncontrarNodo(num);
		
		//Si el nodo ha sido encontrado
		if (nodoRaiz != null) {
			if (nodoRaiz.hasLeftChild()) {arbolesIzq = CantidadSubarboles(nodoRaiz.getLeftChild());}
			if (nodoRaiz.hasRightChild()) {arbolesDer = CantidadSubarboles(nodoRaiz.getRightChild());}
		}
		
		return (arbolesIzq > arbolesDer);
	}
	
	private BinaryTree<Integer> EncontrarNodo(int valorRaiz) {
		BinaryTree<Integer> nodoActual = null;
		boolean encontrado = false;
		Queue<BinaryTree<Integer>> cola = new Queue<BinaryTree<Integer>>();
		
		//Hacer un recorrido por niveles
		cola.enqueue(_parcialArbol);
		//Mientras el arbol esté vacío Y el nodo aún no haya sido encontrado
		while (!cola.isEmpty() && !encontrado) {
			nodoActual = cola.dequeue();
			if (nodoActual != null) {
				//Comprobar si es el nodo que estamos buscando
				if (nodoActual.getData() == valorRaiz) {
					encontrado = true;
				} else {
					//Anexar sus hijos (si es que tienen)
					if (nodoActual.hasLeftChild()) {cola.enqueue(nodoActual.getLeftChild());}
					if (nodoActual.hasRightChild()) {cola.enqueue(nodoActual.getRightChild());}
				}
			} else if (!cola.isEmpty()) {
				//Para controlar por nivel
				cola.enqueue(null);
			}
		}
		
		return nodoActual;
	}
	
	private int CantidadSubarboles(BinaryTree<Integer> arb) {
		int cantidad = 0;
		
		//Revisar los hijos
		if (!arb.isLeaf()) {
			if (arb.hasLeftChild() && !arb.hasRightChild()) {
				cantidad = 1 + CantidadSubarboles(arb.getLeftChild());
			} else if (!arb.hasLeftChild() && arb.hasRightChild()) {
				cantidad = 1 + CantidadSubarboles(arb.getRightChild());
			} else {
				cantidad += CantidadSubarboles(arb.getLeftChild());
				cantidad += CantidadSubarboles(arb.getRightChild());
			}
		}
		
		return cantidad;
	}
}
