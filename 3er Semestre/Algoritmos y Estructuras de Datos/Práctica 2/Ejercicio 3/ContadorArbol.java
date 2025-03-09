package tp2.ejercicio1;

import java.util.*;

public class ContadorArbol {
	private BinaryTree<Integer> arbolBinario;
	
	public ContadorArbol(BinaryTree<Integer> arbolBinario) {
		this.arbolBinario = arbolBinario;
	}
	
	public List<Integer> numerosParesIn() {
		List<Integer> nuevaLista = new LinkedList<Integer>();
		//Si el nodo está vacío, devolver null
		if (!arbolBinario.isEmpty()) {
			listaParInorden(nuevaLista, arbolBinario);
		}
		return nuevaLista;
	}
	
	public List<Integer> numerosParesPost() {
		List<Integer> nuevaLista = new LinkedList<Integer>();
		//Si el nodo está vacío, devolver null
		if (!arbolBinario.isEmpty()) {
			listaParPostorden(nuevaLista, arbolBinario);
		}
		return nuevaLista;
	}
	
	private void listaParInorden(List<Integer> lista, BinaryTree<Integer> arb) {
		//Recorrido INORDEN (Izquierda - Raiz - Derecha)
		if (arb.hasLeftChild()) {
			listaParInorden(lista, arb.getLeftChild());
		}
		//Preguntar si la data del nodo es par
		if (arb.getData() % 2 == 0) {
			lista.add(arb.getData());
		}
		//Ir a la derecha
		if (arb.hasRightChild()) {
			listaParInorden(lista, arb.getRightChild());
		}
	}
	
	private void listaParPostorden(List<Integer> lista, BinaryTree<Integer> arb) {
		//Recorrido POSTORDEN (Izquierda - Derecha - Raíz)
		if (arb.hasLeftChild()) {
			listaParPostorden(lista, arb.getLeftChild());
		}
		//Ir a la derecha
		if (arb.hasRightChild()) {
			listaParPostorden(lista, arb.getRightChild());
		}
		//Preguntar si la data del nodo es par
		if (arb.getData() % 2 == 0) {
			lista.add(arb.getData());
		}
	}
}
