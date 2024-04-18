package tp3;

public class Prueba {
	public static void main(String[] args) {
		//Primer sub-arbol
		GeneralTree<Integer> cuartoHijo = new GeneralTree<Integer>(1);
		cuartoHijo.addChild(new GeneralTree<Integer>(1));
		cuartoHijo.addChild(new GeneralTree<Integer>(1));
		cuartoHijo.addChild(new GeneralTree<Integer>(1));
		GeneralTree<Integer> primerHijo = new GeneralTree<Integer>(0);
		primerHijo.addChild(cuartoHijo);
		primerHijo.addChild(new GeneralTree<Integer>(1));
		
		//Segundo sub-arbol
		GeneralTree<Integer> doceavoHijo = new GeneralTree<Integer>(0);
		doceavoHijo.addChild(new GeneralTree<Integer>(1));
		GeneralTree<Integer> septimoHijo = new GeneralTree<Integer>(0);
		septimoHijo.addChild(doceavoHijo);
		GeneralTree<Integer> segundoHijo = new GeneralTree<Integer>(1);
		segundoHijo.addChild(new GeneralTree<Integer>(1));
		segundoHijo.addChild(septimoHijo);
		
		//Tercer sub-arbol
		GeneralTree<Integer> treceavoHijo = new GeneralTree<Integer>(0);
		treceavoHijo.addChild(new GeneralTree<Integer>(0));
		treceavoHijo.addChild(new GeneralTree<Integer>(0));
		GeneralTree<Integer> octavoHijo = new GeneralTree<Integer>(0);
		octavoHijo.addChild(treceavoHijo);
		GeneralTree<Integer> tercerHijo = new GeneralTree<Integer>(1);
		tercerHijo.addChild(octavoHijo);
		
		//Construir árbol
		GeneralTree<Integer> arbol = new GeneralTree<Integer>(1);
		arbol.addChild(primerHijo);
		arbol.addChild(segundoHijo);
		arbol.addChild(tercerHijo);
		
		//Probar código
		System.out.println(ParcialArboles.resolver(arbol));
	}
}
