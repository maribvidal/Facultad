package unlp.oo2.patrones.ej3;

import java.util.List;

public class MediaPlayer {
	private List<Media> archivos;
	
	public void agregarArchivo(Media media) {
		archivos.add(media);
	}
}