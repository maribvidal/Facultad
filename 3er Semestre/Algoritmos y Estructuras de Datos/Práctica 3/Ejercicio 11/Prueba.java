package tp3;

public class Prueba {
	public static void main(String[] args) {
		//Raiz
		GeneralTree<Integer> raiz = new GeneralTree<Integer>(2);
		GeneralTree<Integer> primerHijo = new GeneralTree<Integer>(1);
		GeneralTree<Integer> segundoHijo = new GeneralTree<Integer>(25);
		segundoHijo.addChild(new GeneralTree<Integer>(13));
		
		GeneralTree<Integer> tercerHijo = new GeneralTree<Integer>(5);
		GeneralTree<Integer> sextoHijo = new GeneralTree<Integer>(18);
		sextoHijo.addChild(new GeneralTree<Integer>(83));
		tercerHijo.addChild(sextoHijo);
		primerHijo.addChild(tercerHijo);
		
		GeneralTree<Integer> cuartoHijo = new GeneralTree<Integer>(4);
		GeneralTree<Integer> novenoHijo = new GeneralTree<Integer>(3);
		novenoHijo.addChild(new GeneralTree<Integer>(33));
		novenoHijo.addChild(new GeneralTree<Integer>(12));
		novenoHijo.addChild(new GeneralTree<Integer>(17));
		novenoHijo.addChild(new GeneralTree<Integer>(9));
		cuartoHijo.addChild(new GeneralTree<Integer>(7));
		cuartoHijo.addChild(new GeneralTree<Integer>(11));
		cuartoHijo.addChild(novenoHijo);
		primerHijo.addChild(cuartoHijo);
		
		raiz.addChild(primerHijo);
		raiz.addChild(segundoHijo);
		
		//Probar código
		System.out.println(ParcialArboles.resolver2(raiz));
	}
}
