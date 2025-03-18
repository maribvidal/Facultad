package unlp.oo2.ejercicio1;

import java.util.List;
import java.util.stream.Collectors;
import java.util.ArrayList;

public class Usuario {
    private String screenName;
    private List<IPost> posteos;

    public Usuario(String screenName) {
        this.screenName = screenName;
        this.posteos = new ArrayList<IPost>();
    }

    // METODOS PUBLICOS

    public String getScreenName() {
        return this.screenName;
    }
    
    public List<IPost> getPosteos() {
    	return this.posteos;
    }

	public Tweet twittear(String contenido) {
		Tweet tweet = new Tweet();
		
		if (tweet.establecerTexto(contenido)) {
			posteos.add(tweet);
			return tweet;
		}
		
		return null;
	}

    public Retweet retwittear(Tweet tweet) {
		Retweet retweet = tweet.hacerRetweet(this);
        posteos.add(retweet);
        return retweet;
	}
	
	public void eliminarTweet(Tweet tweet) {
        tweet.obtenerListaUsuariosQueRetwitearon().stream().forEach(u -> {
            u.eliminarReferencias(tweet);
        });
        
        this.posteos.remove(tweet);
	}
	
	public void eliminarRetweet(Retweet retweet) {
		this.posteos.remove(retweet);
	}

    // METODOS PRIVADOS

    private void eliminarReferencias(Tweet tweet) {
        // Para optimizar un poco
        boolean tieneAlgunaReferencia = this.posteos.stream().anyMatch(p -> p.getTexto() == tweet.getTexto());
        if (tieneAlgunaReferencia) {
        	// Por alguna razón, tengo que convertir la lista en ArrayList explícitamente
            List<IPost> nuevaLista = this.posteos.stream().filter(p -> p.getTexto() != tweet.getTexto()).collect(Collectors.toCollection(ArrayList::new));
            this.posteos = nuevaLista;
        }
    }
}
