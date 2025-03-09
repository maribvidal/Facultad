import java.util.*;

public class Test {

	public static void main(String[] args) {
		Map<Jugador, Integer> mapa = new HashMap<Jugador, Integer>();
		
		Jugador messi = new Jugador("Lionel", "Messi");
		Jugador bati = new Jugador("Gabriel", "Batistuta");
		Jugador kun = new Jugador("Kun", "Aguero");
		
		mapa.put(messi, 111);
		mapa.put(bati, 56);
		mapa.put(kun, 42);
		
		mapa.remove(kun);
		
		mapa.put(messi, 112);
		
		System.out.println(mapa);
		
		mapa.put(bati, 57);
			
		System.out.println(mapa);
		
		int totGoles = 0;
		
		totGoles = mapa.values().stream().mapToInt(in -> (int) in).sum();
		System.out.println(totGoles);
	}
}
