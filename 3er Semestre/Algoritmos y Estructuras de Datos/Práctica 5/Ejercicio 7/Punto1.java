	private void caminoMasCortoDijkstra(Vertex<String> vorigen, Vertex<String> vfinal, List<String> camAct) {
		int cantVertices = mapaCiudades.getSize();
		int[][] matrizDijkstra = new int[cantVertices][3];
		
		//Inicializar matriz
		for (int i = 0; i < cantVertices; i++) {
			matrizDijkstra[i][0] = 9999;
			matrizDijkstra[i][1] = 0;
			matrizDijkstra[i][2] = 0;
		}
		
		//Tratar el vértice origen
		matrizDijkstra[vorigen.getPosition()][0] = 0;
		matrizDijkstra[vorigen.getPosition()][1] = -1; //Esto lo hago para obtener fácilmente el primer String del camino
		
		int distMin;
		int posMin = 0;
		boolean matrizProcesada = false;
		List<Edge<String>> adyacentesActuales;
		Vertex<String> verticeActual;
		
		while (!matrizProcesada) {
			//Elegir un vértice
			distMin = 9999;
			for (int i = 0; i < cantVertices; i++) {
				if (distMin > matrizDijkstra[i][0] && matrizDijkstra[i][2] == 0) {
					distMin = matrizDijkstra[i][0];
					posMin = i;
				}
			}
			
			//Si distMin sigue siendo 9999 al salir del for, es porque todas las posiciones están procesadas
			if (distMin == 9999) {matrizProcesada = true;}
			
			if (!matrizProcesada) {
				verticeActual = mapaCiudades.getVertex(posMin);
				matrizDijkstra[verticeActual.getPosition()][2] = 1;
			
				//Procesar sus adyacentes no procesados
				adyacentesActuales = mapaCiudades.getEdges(verticeActual);
				for (Edge<String> ady : adyacentesActuales) {
					//Dw > Dv + C(v, w)
					Vertex<String> verticeDestino = ady.getTarget();
					if (matrizDijkstra[verticeDestino.getPosition()][0] > matrizDijkstra[matrizDijkstra[verticeDestino.getPosition()][1]][0] + ady.getWeight()) {
						matrizDijkstra[verticeDestino.getPosition()][0] = matrizDijkstra[matrizDijkstra[verticeDestino.getPosition()][1]][0] + ady.getWeight();
						matrizDijkstra[verticeDestino.getPosition()][1] = verticeActual.getPosition();
					}
				}
			}
		}
		
		//Obtener camino y devolverlo
		int pos = vfinal.getPosition();
		while (pos != -1) {
			verticeActual = mapaCiudades.getVertex(pos);
			camAct.add(0, verticeActual.getData());
			pos = matrizDijkstra[pos][1];
		}
	}
