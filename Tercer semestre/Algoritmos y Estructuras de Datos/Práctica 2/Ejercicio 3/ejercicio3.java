package tp2.ejercicio1;

import java.util.*;

public class ejercicio3 {
	public static void main(String[]args) {
		//Crear un nuevo arbol binario
		BinaryTree<Integer> arbol = new BinaryTree<Integer>(1);
		arbol.setData(1);
		//NIVEL 1
		BinaryTree<Integer> hijoIzq = new BinaryTree<Integer>(2);
		BinaryTree<Integer> hijoDer = new BinaryTree<Integer>(3);
		//NIVEL 3
		BinaryTree<Integer> hijoIzqIzq = new BinaryTree<Integer>(4);
		BinaryTree<Integer> hijoIzqDer = new BinaryTree<Integer>(5);
		BinaryTree<Integer> hijoDerIzq = new BinaryTree<Integer>(6);
		BinaryTree<Integer> hijoDerDer = new BinaryTree<Integer>(7);
		
		//Establecer relaciones raiz-hijo
		hijoDerDer.addRightChild(new BinaryTree<Integer>(9));
		hijoIzqIzq.addRightChild(new BinaryTree<Integer>(8));
		hijoIzq.addLeftChild(hijoIzqIzq);
		hijoIzq.addRightChild(hijoIzqDer);
		hijoDer.addLeftChild(hijoDerIzq);
		hijoDer.addRightChild(hijoDerDer);
		arbol.addLeftChild(hijoIzq);
		arbol.addRightChild(hijoDer);
		
		//Crear lista y retornar los nodos pares del arbol
		ContadorArbol contArb = new ContadorArbol(arbol);
		List<Integer> listaPar = new LinkedList<Integer>();
		listaPar = contArb.numerosParesPost();
		
		//Leer lista
		int i = 0;
		while (!listaPar.isEmpty()) {
			System.out.println("LONGITUD " + listaPar.size() + " / Elemento n°" + i++ + ": " + listaPar.remove(0));
		}
	}
}
