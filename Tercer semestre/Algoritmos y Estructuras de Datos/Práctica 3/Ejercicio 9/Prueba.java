package tp3;

public class Prueba {
	public static void main(String[] args) {
		//Creación del árbol
		GeneralTree<Integer> arbol = new GeneralTree<Integer>(12);
		GeneralTree<Integer> primerHijo = new GeneralTree<Integer>(12);
		GeneralTree<Integer> segundoHijo = new GeneralTree<Integer>(25);
		segundoHijo.addChild(new GeneralTree<Integer>(25));
		GeneralTree<Integer> tercerHijo = new GeneralTree<Integer>(35);
		GeneralTree<Integer> cuartoHijo = new GeneralTree<Integer>(12);
		GeneralTree<Integer> sextoHijo = new GeneralTree<Integer>(35);
		sextoHijo.addChild(new GeneralTree<Integer>(35));
		tercerHijo.addChild(sextoHijo);
		GeneralTree<Integer> novenoHijo = new GeneralTree<Integer>(33);
		novenoHijo.addChild(new GeneralTree<Integer>(35));
		novenoHijo.addChild(new GeneralTree<Integer>(83));
		novenoHijo.addChild(new GeneralTree<Integer>(90));
		novenoHijo.addChild(new GeneralTree<Integer>(33));
		cuartoHijo.addChild(new GeneralTree<Integer>(14));
		cuartoHijo.addChild(new GeneralTree<Integer>(12));
		cuartoHijo.addChild(novenoHijo);
		primerHijo.addChild(tercerHijo);
		primerHijo.addChild(cuartoHijo);
		arbol.addChild(primerHijo);
		arbol.addChild(segundoHijo);
		
		//Probar código
		System.out.println(ParcialArboles.esDeSeleccion(arbol));
	}
}
