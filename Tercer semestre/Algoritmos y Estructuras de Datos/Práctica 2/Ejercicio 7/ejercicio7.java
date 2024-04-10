package tp2.ejercicio1;

public class ejercicio7 {
	public static void main(String[] args) {
		BinaryTree<Integer> Arbol = new BinaryTree<Integer>(2);
		BinaryTree<Integer> HijoIzq = new BinaryTree<Integer>(7);
		BinaryTree<Integer> HijoDer = new BinaryTree<Integer>(-5);
		BinaryTree<Integer> HijoDerIzq = new BinaryTree<Integer>(19);
		BinaryTree<Integer> HijoDerIzqDer = new BinaryTree<Integer>(4);
		HijoDerIzqDer.addRightChild(new BinaryTree<Integer>(18));
		HijoDerIzq.addRightChild(HijoDerIzqDer);
		HijoDer.addLeftChild(HijoDerIzq);
		Arbol.addRightChild(HijoDer);
		BinaryTree<Integer> HijoIzqIzq = new BinaryTree<Integer>(23);
		BinaryTree<Integer> HijoIzqDer = new BinaryTree<Integer>(6);
		HijoIzqIzq.addLeftChild(new BinaryTree<Integer>(-3));
		HijoIzqDer.addLeftChild(new BinaryTree<Integer>(55));
		HijoIzqDer.addRightChild(new BinaryTree<Integer>(11));
		HijoIzq.addLeftChild(HijoIzqIzq);
		HijoIzq.addRightChild(HijoIzqDer);
		Arbol.addLeftChild(HijoIzq);
		
		ParcialArboles ArbolParcial = new ParcialArboles(Arbol);
		System.out.println("Ver si el nodo 7 tiene mas subarboles con hijos únicos del lado izquierdo que del derecho");
		System.out.println(ArbolParcial.isLeftTree(-3));
	}
}
