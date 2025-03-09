package tp2.ejercicio1;

import java.util.*;

public class ejercicio6 {
	public static void main(String[]args) {
		BinaryTree<Integer> arbol = new BinaryTree<Integer>(1);
		BinaryTree<Integer> hijoIzq = new BinaryTree<Integer>(2);
		BinaryTree<Integer> hijoDer = new BinaryTree<Integer>(3);
		BinaryTree<Integer> hijoDerIzq = new BinaryTree<Integer>(5);
		hijoDer.addLeftChild(hijoDerIzq);
		hijoDer.addRightChild(new BinaryTree<Integer>(6));
		hijoDerIzq.addLeftChild(new BinaryTree<Integer>(7));
		hijoDerIzq.addRightChild(new BinaryTree<Integer>(8));
		hijoIzq.addLeftChild(new BinaryTree<Integer>(4));
		arbol.addRightChild(hijoDer);
		arbol.addLeftChild(hijoIzq);
		
		//arbol.imprimirPorNiveles();
		System.out.println();
		Transformacion arbolTransformado = new Transformacion(arbol);
		arbol = arbolTransformado.suma();
		arbol.imprimirPorNiveles();
	}
}
