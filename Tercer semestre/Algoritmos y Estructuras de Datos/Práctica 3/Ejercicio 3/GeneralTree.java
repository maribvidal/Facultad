package tp3;

import java.util.LinkedList;
import java.util.List;

public class GeneralTree<T>{

	private T data;
	private List<GeneralTree<T>> children = new LinkedList<GeneralTree<T>>(); 

	public GeneralTree() {
		
	}
	public GeneralTree(T data) {
		this.data = data;
	}

	public GeneralTree(T data, List<GeneralTree<T>> children) {
		this(data);
		this.children = children;
	}	
	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

	public List<GeneralTree<T>> getChildren() {
		return this.children;
	}
	
	public void setChildren(List<GeneralTree<T>> children) {
		if (children != null)
			this.children = children;
	}
	
	public void addChild(GeneralTree<T> child) {
		this.getChildren().add(child);
	}

	public boolean isLeaf() {
		return !this.hasChildren();
	}
	
	public boolean hasChildren() {
		return !this.children.isEmpty();
	}
	
	public boolean isEmpty() {
		return this.data == null && !this.hasChildren();
	}

	public void removeChild(GeneralTree<T> child) {
		if (this.hasChildren())
			children.remove(child);
	}
	
	//devuelve la altura del árbol, es decir, la longitud del camino más largo desde el nodo raíz hasta una hoja.
	public int altura() {	 
		return (!this.isEmpty()) ? this.obtenerAltura() : 0;
	}
	private int obtenerAltura() {
		int altura = 0;
		if (!this.isLeaf()) {
			for (GeneralTree<T> hijo : this.getChildren()) {
				altura = Math.max(altura, hijo.obtenerAltura());
			}
			altura++;
		}
		return altura;
	}
	
	//devuelve la profundidad o nivel del dato en el árbol. El nivel de un nodo es la longitud del único camino de la raíz al nodo.
	public int nivel(T dato){
		int nivel = 0;
		boolean nodoEncontrado = false;
		GeneralTree<T> arbolAux = null;
		Queue<GeneralTree<T>> cola = new Queue<GeneralTree<T>>();
		cola.enqueue(this);
		cola.enqueue(null);
		while (!cola.isEmpty() && !nodoEncontrado) {
			arbolAux = cola.dequeue();
			if (arbolAux != null) {
				if (arbolAux.getData() == dato) {nodoEncontrado = true;}
				else {
					for (GeneralTree<T> hijo : arbolAux.getChildren())
						cola.enqueue(hijo);
				}
			} else if (!cola.isEmpty()) {
				nivel++;
				cola.enqueue(null);
			}
		}
		
		//Si el nodo no fue encontrado es porque no existía
		if (!nodoEncontrado) nivel = -1;
		
		return nivel;
	  }

	//la amplitud (ancho) de un árbol se define como la cantidad de nodos
	//que se encuentran en el nivel que posee la mayor cantidad de nodos.
	public int ancho(){
		int cantidadNodosMaxima = -1;
		int cantidadNodosActual = 0;
		GeneralTree<T> arbolAux = null;
		Queue<GeneralTree<T>> cola = new Queue<GeneralTree<T>>();
		cola.enqueue(this);
		cola.enqueue(null); //Vamos a tener que distinguir por nivel
		while (!cola.isEmpty()) {
			arbolAux = cola.dequeue();
			if (arbolAux != null) {
				cantidadNodosActual++; //Contar la cantidad de nodos por nivel
				for (GeneralTree<T> hijo : arbolAux.getChildren())
					cola.enqueue(hijo);
			} else {
				//Comparar la cantidad de nodos actual con el máximo
				// (Pongo este control afuera ya que en el último nivel la cola está vacía)
				if (cantidadNodosActual > cantidadNodosMaxima)
					cantidadNodosMaxima = cantidadNodosActual;
				if (!cola.isEmpty()) {
					//Reiniciar contador y separar por nivel
					cantidadNodosActual = 0;
					cola.enqueue(null);
				}
			}
		}
		return cantidadNodosMaxima;
	}
}
