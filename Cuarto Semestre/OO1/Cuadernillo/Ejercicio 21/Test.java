import java.util.*;

public class Test {

	public static void main(String[] args) {
		Map<String, Integer> mapa = new TreeMap<String, Integer>();
		
		mapa.put("Lionel Messi", 111);
		mapa.put("Gabriel Batistuta", 56);
		mapa.put("Kun Aguero", 42);
		
		mapa.remove("Kun Aguero");
		
		mapa.put("Lionel Messi", 112);
		
		System.out.println(mapa);
		
		mapa.put("Gabriel Batistuta", 57);
			
		System.out.println(mapa);
		
		int totGoles = 0;
		
		totGoles = mapa.values().stream().mapToInt(in -> (int) in).sum();
		System.out.println(totGoles);
	}
}
