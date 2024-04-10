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
	
	//Ejercicio 8
	public static boolean esPrefijo(BinaryTree<Integer> arbol1, BinaryTree<Integer> arbol2) {
		boolean prefijo = true;
		
		//Arboles y colas
		BinaryTree<Integer> A1 = null;
		BinaryTree<Integer> A2 = null;
		Queue<BinaryTree<Integer>> cola1 = new Queue<BinaryTree<Integer>>();
		cola1.enqueue(arbol1);
		cola1.enqueue(null);
		Queue<BinaryTree<Integer>> cola2 = new Queue<BinaryTree<Integer>>();
		cola2.enqueue(arbol2);
		cola2.enqueue(null);
		
		//Asumiendo que el arbol1 es el prefijo, haremos que el while sea con la cola2
		while (!cola2.isEmpty() && prefijo) {
			A1 = cola1.dequeue();
			A2 = cola2.dequeue();
			if (A2 != null) {
				System.out.println("A1: " + A1.getData() + " / A2: " + A2.getData());
				//Comprobar si son iguales, o si A1 es igual a -1 (está vacío)
				if (A1.getData() == A2.getData() || A1.getData() == -1) {
					//Encolar hijos
					if (A2.hasLeftChild()) {
						cola2.enqueue(A2.getLeftChild());
						//Comprobar si el arbol1 tiene hijo. Caso contrario, encolarle un "-1"
						if (!A1.hasLeftChild())
							cola1.enqueue(new BinaryTree<Integer>(-1));
						else
							cola1.enqueue(A1.getLeftChild());
					}
					if (A2.hasRightChild()) {
						cola2.enqueue(A2.getRightChild());
						if (!A1.hasRightChild()) 
							cola1.enqueue(new BinaryTree<Integer>(-1));
						else
							cola1.enqueue(A1.getRightChild());
					}
				} else {
					prefijo = false;
				}
			} else if (!cola2.isEmpty()) {
				//Avanzar al siguiente nivel
				cola2.enqueue(null);
				cola1.enqueue(null);
			}
		}
		
		return prefijo;
	}
}
