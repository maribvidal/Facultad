	private void caminoMasCortoFloyd(Vertex<String> vorigen, Vertex<String> vfinal, List<String> camAct) {
		int[][] matrizD = new int[mapaCiudades.getSize()][mapaCiudades.getSize()];
		int[][] matrizP = new int[mapaCiudades.getSize()][mapaCiudades.getSize()];
		
		//Rellenar todos los espacios con un número grande
		for (int i = 0; i < mapaCiudades.getSize(); i++) {
			Arrays.fill(matrizD[i], 9999);
			Arrays.fill(matrizP[i], -1);
		}
		
		//Las posiciones (i, i) tienen distancia 0
		for (int i = 0; i < mapaCiudades.getSize(); i++) {
			matrizD[i][i] = 0;
		}
		
		//Establecer las conexiones existentes entre aristas
		for (Vertex<String> vertice : mapaCiudades.getVertices()) {
			int posV1 = vertice.getPosition();
			for (Edge<String> arista : mapaCiudades.getEdges(vertice)) {
				int posV2 = arista.getTarget().getPosition();
				matrizD[posV1][posV2] = arista.getWeight();
				matrizP[posV1][posV2] = posV2;
			}
		}
		
		//Algoritmo de Floyd (O(n^3))
		for (int k = 0; k < mapaCiudades.getSize(); k++) {
			for (int i = 0; k < mapaCiudades.getSize(); i++) {
				for (int j = 0; k < mapaCiudades.getSize(); j++) {
					if (matrizD[i][j] > matrizD[i][k] + matrizD[k][j]) {
						matrizD[i][j] = matrizD[i][k] + matrizD[k][j];
						matrizP[i][j] = k;
					}
				}
			}
		}
		
		//Encontrar camino
		if (matrizD[vorigen.getPosition()][vfinal.getPosition()] != 9999) {
			Vertex<String> vertAct;
			int posNue = vorigen.getPosition();
			while (posNue != vfinal.getPosition() && posNue != -1) {
				vertAct = mapaCiudades.getVertex(posNue);
				camAct.add(vertAct.getData());
				posNue = matrizP[posNue][vfinal.getPosition()];
				if (posNue == -1) {camAct = new LinkedList<String>();}
			}
			if (posNue != -1) {
				camAct.add(mapaCiudades.getVertex(posNue).getData());
			}
		}
	}
