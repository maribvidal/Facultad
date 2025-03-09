package tp2.ejercicio1;



public class BinaryTree <T> {
	private T data;
	private BinaryTree<T> leftChild;   
	private BinaryTree<T> rightChild; 

	
	public BinaryTree() {
		super();
	}

	public BinaryTree(T data) {
		this.data = data;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}
	/**
	 * Preguntar antes de invocar si hasLeftChild()
	 * @return
	 */
	public BinaryTree<T> getLeftChild() {
		return leftChild;
	}
	/**
	 * Preguntar antes de invocar si hasRightChild()
	 * @return
	 */
	public BinaryTree<T> getRightChild() {
		return this.rightChild;
	}

	public void addLeftChild(BinaryTree<T> child) {
		this.leftChild = child;
	}

	public void addRightChild(BinaryTree<T> child) {
		this.rightChild = child;
	}

	public void removeLeftChild() {
		this.leftChild = null;
	}

	public void removeRightChild() {
		this.rightChild = null;
	}

	public boolean isEmpty(){
		return (this.isLeaf() && this.getData() == null);
	}

	public boolean isLeaf() {
		return (!this.hasLeftChild() && !this.hasRightChild());

	}
		
	public boolean hasLeftChild() {
		return this.leftChild!=null;
	}

	public boolean hasRightChild() {
		return this.rightChild!=null;
	}
	@Override
	public String toString() {
		return this.getData().toString();
	}

	//MÉTODO PARA CONTAR HOJAS DE UN ARBOL
	public int contarHojas() {
		//Inicializar contador en 0 en el caso de que el árbol esté vacío
		int cantHojas = 0;
		
		//Revisar primero si el árbol no está vacío
		if (!this.isEmpty()) {
			cantHojas = this.contarHojasHijo();
		}
		
		return cantHojas;
	}
	
	private int contarHojasHijo() {
		//Inicializar contador en 0 en el caso de que no sea una hoja
		int cantHojas = 0;
		
		//USAR RECORRIDO PRE-ORDEN
		if (this.isLeaf()) {
			cantHojas = 1;
		} else { //Caso contrario, tiene hijos
			if (this.hasLeftChild()) {cantHojas += this.getLeftChild().contarHojasHijo();}
			if (this.hasRightChild()) {cantHojas += this.getRightChild().contarHojasHijo();}
		}
		
		return cantHojas;
	}
		
    //DEVUELVE EL ARBOL ESPEJO DEL ARBOL RECEPTOR
    public BinaryTree<T> espejo(){
    	//Comprobar si el árbol no está vacío
    	if (!this.isEmpty()) {
    		return this.getChildMirror();
    	} else {
    		return null;
    	}
    }
    
    private BinaryTree<T> getChildMirror() {
    	//Crear un nuevo árbol binario
    	BinaryTree<T> arbolEspejo = null;
    	
    	if (!this.isEmpty()) {
    		//Crear un nuevo árbol y copiar la data de este nodo
    		arbolEspejo = new BinaryTree<T>();
    		arbolEspejo.setData(this.getData());
    		if (!this.isLeaf()) {
    			//Cambiar de lugar a los hijos
    			if (this.hasLeftChild()) {arbolEspejo.addRightChild(this.getLeftChild());}
    			if (this.hasRightChild()) {arbolEspejo.addLeftChild(this.getRightChild());}
    		}
    	}
    	
    	return arbolEspejo;
    }

	// 0<=n<=m
	public void entreNiveles(int n, int m){
		BinaryTree<T> arbolAuxiliar = null;
		Queue<BinaryTree<T>> cola = new Queue<BinaryTree<T>>();
		int nivel = 0; //Nivel inicial
		//Caso en el que se quiere empezar desde el nivel 0
		if (n == 0 && !this.isEmpty()) {System.out.println("NIVEL 0");}
		//Encolar la raíz y un null para distinguir entre los niveles
		cola.enqueue(this);
		cola.enqueue(null);
		
		while (!cola.isEmpty() && (nivel <= m)) {
			arbolAuxiliar = cola.dequeue();
			
			//Si arbAux existe
			if (arbolAuxiliar != null) {
				//Imprimir nodo si (nivel >= n) y (nivel <= m)
				if (nivel >= n && nivel <= m) {
					System.out.print(arbolAuxiliar.getData());
					if (cola.head() != null) {
						System.out.print(" - ");
					} else {
						System.out.println();
					}
				}
				//Encolar hijos (si existen)
				if (arbolAuxiliar.hasLeftChild()) {
					cola.enqueue(arbolAuxiliar.getLeftChild());
				}
				if (arbolAuxiliar.hasRightChild()) {
					cola.enqueue(arbolAuxiliar.getRightChild());
				}
			} else if (!cola.isEmpty()) {
				nivel++;
				if (nivel >= n && nivel <= m) {System.out.println("NIVEL " + nivel);}
				cola.enqueue(null);
			}
		}
   }
	
		
}
