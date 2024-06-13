//ENUNCIADO:
//Implemente en la clase Parcial el método RESOLVER que recibe un árbol binario de enteros positivos y un número entero
//y devuelve un camino que cumple con la siguiente condición: la cantidad de números pares que contenga dicho camino debe
//ser mayor o igual al parámetro "min". Si existen varios caminos que cumplen la condición, el método debe devolver el
//primer camino que encuentre
//
//Public ListaGenerica<integer> resolver(ArbolBinario<integer> ab, int min)
//
//Tenga en cuenta que
//  - Debe recorrer la estructura solo 1 vez para resolverlo
//  - Debe respetar la clase y el método indicado
//  - Puede definir todos los métodos y variables auxiliares que considere necesarios
//  - Todo método que no esté definido en las sinopsis de clases debe ser implementado

package tp2.ejercicio1;

import java.util.*;

public class Parcial {
	public boolean esPar(int n) {
		return (n % 2 == 0);
	}
	
	public List<Integer> resolver(BinaryTree<Integer> ab, int min) {
		List<Integer> listaDevuelta = new LinkedList<Integer>();
		if (!ab.isEmpty())
			resolver(ab, min, new LinkedList<Integer>(), listaDevuelta);
		return listaDevuelta;
	}
	
	private boolean resolver(BinaryTree<Integer> nodoActual, int cuantosParesFaltan, List<Integer> camAct, List<Integer> camMax) {
    //Voy a usar una variable caminoEncontrado para que deje de buscar cuando se haya encontrado un camino
		boolean caminoEncontrado = false;
		int valorNodo = nodoActual.getData();
		camAct.add(valorNodo);
		
		//Si el valor es par, restarle a la variable contadora que llevamos
		if (esPar(valorNodo)) {cuantosParesFaltan--;}
		
		//Si ya se alcanzó el mínimo de enteros pares, y el nodo actual es una hoja, entonces guardar el camino
		if (nodoActual.isLeaf() && cuantosParesFaltan <= 0) {
			camMax.clear();
			camMax.addAll(camAct);
			return true;
		}
		
		//Recorrido pre-orden
		if (nodoActual.hasLeftChild())
			caminoEncontrado = resolver(nodoActual.getLeftChild(), cuantosParesFaltan, camAct, camMax);
		if (nodoActual.hasRightChild() && !caminoEncontrado)
			caminoEncontrado = resolver(nodoActual.getRightChild(), cuantosParesFaltan, camAct, camMax);
		
		//Principio de autonomía (cada nodo se agrega y se saca solo)
		camAct.remove(camAct.size() - 1);
		return caminoEncontrado;
	}
	
	public static void main(String[] args) {
		BinaryTree<Integer> arbol = new BinaryTree<Integer>(7);
		
		//NIVEL 1
		BinaryTree<Integer> hijoIzq = new BinaryTree<Integer>(56);
		BinaryTree<Integer> hijoDer = new BinaryTree<Integer>(25);
		
		//NIVEL 2
		BinaryTree<Integer> nodo3 = new BinaryTree<Integer>(38);
		BinaryTree<Integer> nodo4 = new BinaryTree<Integer>(31);
		BinaryTree<Integer> nodo5 = new BinaryTree<Integer>(5);
		BinaryTree<Integer> nodo6 = new BinaryTree<Integer>(6);
		
		//NIVEL 3
		BinaryTree<Integer> nodo7 = new BinaryTree<Integer>(87);
		BinaryTree<Integer> nodo8 = new BinaryTree<Integer>(77);
		BinaryTree<Integer> nodo9 = new BinaryTree<Integer>(94);
		
		//NIVEL 4
		BinaryTree<Integer> nodo10 = new BinaryTree<Integer>(16);
		BinaryTree<Integer> nodo11 = new BinaryTree<Integer>(2);
		
		//NIVEL 5
		BinaryTree<Integer> nodo12 = new BinaryTree<Integer>(43);
		BinaryTree<Integer> nodo13 = new BinaryTree<Integer>(1);
		
		//NIVEL 6
		BinaryTree<Integer> nodo14 = new BinaryTree<Integer>(9);
		BinaryTree<Integer> nodo15 = new BinaryTree<Integer>(10);
		
		//REALIZAR CONEXIONES
		nodo12.addLeftChild(nodo14);
		nodo12.addRightChild(nodo15);
		
		nodo10.addRightChild(nodo12);
		nodo11.addLeftChild(nodo13);
		
		nodo8.addLeftChild(nodo10);
		nodo9.addRightChild(nodo11);
		
		nodo3.addLeftChild(nodo7);
		nodo3.addRightChild(nodo8);
		nodo4.addRightChild(nodo9);
		
		hijoIzq.addLeftChild(nodo3);
		hijoIzq.addRightChild(nodo4);
		hijoDer.addLeftChild(nodo5);
		hijoDer.addRightChild(nodo6);
		
		arbol.addLeftChild(hijoIzq);
		arbol.addRightChild(hijoDer);
		
		//PROBAR CÓDIGO
		Parcial parcial = new Parcial();
		List<Integer> listaPares1 = parcial.resolver(arbol, 2);
		List<Integer> listaPares2 = parcial.resolver(arbol, 3);
		System.out.println("Dado el siguiente árbol y siendo min=2 retornará el camino formado por: " + listaPares1);
		System.out.println("Dado el siguiente árbol y siendo min=3 retornará el camino formado por: " + listaPares2);
	}
}
