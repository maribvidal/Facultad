package tp2.ejercicio1;

public class btPrueba {
	public static void main(String[] args) {
		//Declaramos un arbol
		BinaryTree<Integer> arbolNum = new BinaryTree<Integer>();
		BinaryTree<Integer> hijoIzq = new BinaryTree<Integer>();
		BinaryTree<Integer> hijoIzqIzq = new BinaryTree<Integer>();
		BinaryTree<Integer> hijoIzqDer = new BinaryTree<Integer>();
		BinaryTree<Integer> hijoDer = new BinaryTree<Integer>();
		BinaryTree<Integer> hijoDerDer = new BinaryTree<Integer>();
		System.out.println(arbolNum.isEmpty());
		
		//Lo inicializamos
		arbolNum.setData(1);
		System.out.println(arbolNum.isEmpty() + " - Data: " + arbolNum.getData());
		
		//Le agregamos hijos
		hijoIzq.setData(2);
		hijoDer.setData(3);
		arbolNum.addLeftChild(hijoIzq);
		arbolNum.addRightChild(hijoDer);
		System.out.println(arbolNum.isLeaf() + " - Hijo izquierdo: " + arbolNum.getLeftChild().getData());
		
		//Le agregamos hijos al hijo izquierdo
		hijoIzqIzq.setData(4);
		hijoIzqDer.setData(5);
		hijoDerDer.setData(6);
		hijoIzq.addLeftChild(hijoIzqIzq);
		hijoIzq.addRightChild(hijoIzqDer);
		hijoDer.addRightChild(hijoDerDer);
		
		//Le preguntamos al árbol cuantas hojas tiene (debería dar 3)
		System.out.println("Este árbol binario tiene " + arbolNum.contarHojas() + " hojas");
	}
};
