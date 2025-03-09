package tp2.ejercicio1;

import java.util.*;

public class ejercicio4 {
	public static void main(String[]args) {
		BinaryTree<Integer> arbol = new BinaryTree<Integer>(10);
		BinaryTree<Integer> aRHijoIzq = new BinaryTree<Integer>(2);
		BinaryTree<Integer> aRHijoIzqIzq = new BinaryTree<Integer>(5);
		BinaryTree<Integer> aRHijoIzqDer = new BinaryTree<Integer>(4);
		BinaryTree<Integer> aRHijoDer = new BinaryTree<Integer>(3);
		BinaryTree<Integer> aRHijoDerIzq = new BinaryTree<Integer>(9);
		BinaryTree<Integer> aRHijoDerDer = new BinaryTree<Integer>(8);
		aRHijoDerIzq.addLeftChild(new BinaryTree<Integer>(12));
		aRHijoDerIzq.addRightChild(new BinaryTree<Integer>(8));
		aRHijoDerDer.addLeftChild(new BinaryTree<Integer>(2));
		aRHijoDerDer.addRightChild(new BinaryTree<Integer>(1));
		aRHijoIzqIzq.addLeftChild(new BinaryTree<Integer>(7));
		aRHijoIzqIzq.addRightChild(new BinaryTree<Integer>(8));
		aRHijoIzqDer.addLeftChild(new BinaryTree<Integer>(5));
		aRHijoIzqDer.addRightChild(new BinaryTree<Integer>(6));
		aRHijoIzq.addLeftChild(aRHijoIzqIzq);
		aRHijoIzq.addRightChild(aRHijoIzqDer);
		aRHijoDer.addLeftChild(aRHijoDerIzq);
		aRHijoDer.addRightChild(aRHijoDerDer);
		arbol.addLeftChild(aRHijoIzq);
		arbol.addRightChild(aRHijoDer);
		
		RedBinariaLlena arbolRetardos = new RedBinariaLlena(arbol);
		System.out.println(arbolRetardos.retardoReenvio());
	}
}
