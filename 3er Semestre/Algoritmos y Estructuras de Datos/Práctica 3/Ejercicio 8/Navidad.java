package tp3;

import java.util.*;

public class Navidad<T> {
	GeneralTree<T> Abeto;
	
	public Navidad (GeneralTree<T> abeto) {
		Abeto = abeto;
	}
	
	public String esAbetoNavideño() {
		String output = (!Abeto.isEmpty() && esUnAbeto(Abeto)) ? "Yes" : "No";
		return output;
	}
	private boolean esUnAbeto(GeneralTree<T> vertice) {
		boolean devolverValor = true;
		
		//El único caso que nos interesa es si no es una hoja, ya que solo
		//nos interesa saber la cantidad de hijos hoja de los nodos no-hoja
		if (!vertice.isLeaf()) {
			//Contar la cantidad de hijos hoja que tiene, si tiene menos 3 ni fijarse
			List<GeneralTree<T>> listaHijos = vertice.getChildren();
			if (listaHijos.size() > 2)
			{
				//Recorrer aquellos hijos que no sean hojas
				for (GeneralTree<T> hijo : listaHijos) {
					if (!hijo.isLeaf())
						devolverValor = devolverValor && esUnAbeto(hijo);
				}
			}
			else {
				devolverValor = false;
			}
		}
		
		return devolverValor;
	}
}
