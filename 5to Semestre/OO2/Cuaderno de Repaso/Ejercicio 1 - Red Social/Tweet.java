package unlp.oo2.ejercicio1;

import java.util.List;
import java.util.ArrayList;

public class Tweet implements IPost {
    private String texto;
    private List<Retweet> retweets;

    public Tweet() {
        this.retweets = new ArrayList<Retweet>();
    }

    // METODOS PUBLICOS

    // Para asegurarse de que la longitud sea correcta, y de
    // paso le delego el comportamiento a esta clase
    public boolean establecerTexto(String texto) {
		int longitud = texto.length();
		
		// Los mensajes pueden tener hasta 280 carácteres
		if (longitud < 1 || longitud > 280)
			return false;
		
		this.setTexto(texto);
		return true;
	}

    // Hacer que cada Tweet conozca sus Retweets así
    // se evita involucrar a la clase Twitter para el
    // borrado de Tweets
    public Retweet hacerRetweet(Usuario usuario) {
        Retweet retweet = new Retweet(this, usuario);
        retweets.add(retweet);
        return retweet;
    }

    public String getTexto() {
        return this.texto; 
    }

    public List<Usuario> obtenerListaUsuariosQueRetwitearon() {
        List<Usuario> lista = this.retweets.stream().map(r -> r.getRetweetUsuario()).toList();
        return lista;
    }

    // METODOS PRIVADOS

    private void setTexto(String texto) {
        this.texto = texto;
    }
}
