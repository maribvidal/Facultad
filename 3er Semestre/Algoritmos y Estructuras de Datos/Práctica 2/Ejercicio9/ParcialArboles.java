package tp2.ejercicio1;

public class ParcialArboles {
	public BinaryTree<SumaDiferencia> sumAndDif(BinaryTree<Integer> arbol) {
		BinaryTree<SumaDiferencia> nuevoArbol = null;
		if (!arbol.isEmpty()) {nuevoArbol = ObtenerArbolSD(arbol, 0, 0);}
		return nuevoArbol;
	}
	
	private BinaryTree<SumaDiferencia> ObtenerArbolSD(BinaryTree<Integer> arbol, int acuSum, int valorPadre) {
		BinaryTree<SumaDiferencia> paraRetornar = new BinaryTree<SumaDiferencia>();
		int valorArbol = arbol.getData();
		
		//Utilizar recorrido pre-orden
		SumaDiferencia sd = new SumaDiferencia(valorArbol + acuSum, valorArbol - valorPadre);
		paraRetornar.setData(sd);
		if (arbol.hasLeftChild()) {paraRetornar.addLeftChild(ObtenerArbolSD(arbol.getLeftChild(), valorArbol + acuSum, valorArbol));}
		if (arbol.hasRightChild()) {paraRetornar.addRightChild(ObtenerArbolSD(arbol.getRightChild(), valorArbol + acuSum, valorArbol));}
		
		return paraRetornar;
	}
	
	public static void main(String[] args) {
		//Crear un arbol
		BinaryTree<Integer> arbolSencillo = new BinaryTree<Integer>(20);
		BinaryTree<Integer> aSHijoIzq = new BinaryTree<Integer>(5);
		BinaryTree<Integer> aSHijoIzqDer = new BinaryTree<Integer>(10);
		aSHijoIzqDer.addLeftChild(new BinaryTree<Integer>(1));
		aSHijoIzq.addLeftChild(new BinaryTree<Integer>(-5));
		aSHijoIzq.addRightChild(aSHijoIzqDer);
		
		BinaryTree<Integer> aSHijoDer = new BinaryTree<Integer>(30);
		BinaryTree<Integer> aSHijoDerIzq = new BinaryTree<Integer>(50);
		BinaryTree<Integer> aSHijoDerIzqDer = new BinaryTree<Integer>(4);
		aSHijoDerIzqDer.addRightChild(new BinaryTree<Integer>(6));
		aSHijoDerIzq.addRightChild(aSHijoDerIzqDer);
		aSHijoDer.addRightChild(new BinaryTree<Integer>(-9));
		aSHijoDer.addLeftChild(aSHijoDerIzq);
		
		arbolSencillo.addLeftChild(aSHijoIzq);
		arbolSencillo.addRightChild(aSHijoDer);
		ParcialArboles parcialArb = new ParcialArboles();
		BinaryTree<SumaDiferencia> arbolCompuesto = parcialArb.sumAndDif(arbolSencillo);
	}
}
