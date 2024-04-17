package tp3;

import java.util.*;

public class RecorridosAG {
	//Método que retorna una lista con los elementos impares del árbol “a” 
	//que sean mayores al valor “n” pasados como parámetros, recorrido en preorden
	public List<Integer> numerosImparesMayoresQuePreOrden(GeneralTree<Integer> a, int n) {
		List<Integer> listaRetornada = null;
		if (!a.isEmpty()) {
			listaRetornada = new LinkedList<Integer>();
			obtenerElemImparesPreOrden(listaRetornada, a, n);
		}
		return listaRetornada;
	}
	private void obtenerElemImparesPreOrden(List<Integer> lista, GeneralTree<Integer> a, int n) {
		//Recorrido pre-orden
		//Preguntar por el nodo raíz
		if (a.getData() % 2 != 0 && a.getData() > n) {
			lista.add(a.getData());
		}
		//Recorrer sus hijos
		if (!a.isLeaf()) { //Si el árbol no es una hoja
			for (GeneralTree<Integer> hijo : a.getChildren()) { //Recorrer sus hijos
				obtenerElemImparesPreOrden(lista, hijo, n);
			}
		}
	}
	
	//Método que retorna una lista con los elementos impares del árbol “a” 
	//que sean mayores al valor “n” pasados como parámetros, recorrido en inorden
	public List<Integer> numerosImparesMayoresQueInorden(GeneralTree<Integer> a, int n) {
		List<Integer> listaRetornada = null;
		if (!a.isEmpty()) { //Para asegurarnos que el árbol no esté vacío
			listaRetornada = new LinkedList<Integer>();
			obtenerElemImparesInOrden(listaRetornada, a, n);
		}
		return listaRetornada;
	}
	private void obtenerElemImparesInOrden(List<Integer> lista, GeneralTree<Integer> a, int n) {
		List<GeneralTree<Integer>> arbolHijos = null;
		//Preguntar por el primer hijo
		if (!a.isLeaf()) {
			arbolHijos = a.getChildren();
			obtenerElemImparesInOrden(lista, arbolHijos.remove(0), n); //Obtener primer hijo
		}
		
		//Preguntar por la raíz
		if (a.getData() % 2 != 0 && a.getData() > n) {
			lista.add(a.getData());
		}
		
		//Preguntar por los demás hijos, si es que tiene o le quedan
		if (arbolHijos != null && arbolHijos.size() > 0) {
			for (GeneralTree<Integer> hijo : arbolHijos) {
				obtenerElemImparesInOrden(lista, hijo, n);
			}
		}
	}
	
	//Método que retorna una lista con los elementos impares del árbol “a” 
	//que sean mayores al valor “n” pasados como parámetros, recorrido en postorden
	public List<Integer> numerosImparesMayoresQuePostorden(GeneralTree<Integer> a, int n) {
		List<Integer> listaRetornada = null;
		if (!a.isEmpty()) {
			listaRetornada = new LinkedList<Integer>();
			obtenerElemImparesPostorden(listaRetornada, a, n);
		}
		return listaRetornada;
	}
	private void obtenerElemImparesPostorden(List<Integer> lista, GeneralTree<Integer> a, int n) {
		if (!a.isLeaf()) {
			for (GeneralTree<Integer> hijo : a.getChildren()) {
				obtenerElemImparesPostorden(lista, hijo, n);
			}
		}
		if (a.getData() % 2 != 0 && a.getData() > n) {
			lista.add(a.getData());
		}
	}
	
	//Método que retorna una lista con los elementos impares del árbol “a”
	//que sean mayores al valor “n” pasados como parámetros, recorrido por niveles
	public List<Integer> numerosImparesMayoresQuePorNiveles(GeneralTree <Integer> a, Integer n) {
		List<Integer> listaRetornada = null;
		GeneralTree<Integer> arbolAux = null;
		
		//Si el árbol es vacío, ni siquiera molestarse
		if (!a.isEmpty()) {
			listaRetornada = new LinkedList<Integer>();
			Queue<GeneralTree<Integer>> cola = new Queue<GeneralTree<Integer>>();
			cola.enqueue(a);
			while (!cola.isEmpty()) {
				arbolAux = cola.dequeue();
				if (arbolAux.getData() % 2 != 0 && arbolAux.getData() > n) {
					listaRetornada.add(arbolAux.getData());
				}
				for (GeneralTree<Integer> hijo : arbolAux.getChildren()) {
					cola.enqueue(hijo);
				}
			}
		}
		
		return listaRetornada;
	}
}
