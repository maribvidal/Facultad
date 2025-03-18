package unlp.oo2.ejercicio1;

public class Retweet implements IPost {
    private Tweet tweetOrigen;
    private Usuario retweetUsuario;

    public Retweet(Tweet tweetOrigen, Usuario retweetUsuario) {
        this.tweetOrigen = tweetOrigen;
        this.retweetUsuario = retweetUsuario;
    }

    public String getTexto() {
        return this.tweetOrigen.getTexto();
    }

    public Usuario getRetweetUsuario() {
        return this.retweetUsuario;
    }
}
