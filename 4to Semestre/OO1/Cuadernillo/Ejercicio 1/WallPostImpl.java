package ar.edu.unlp.oo1.ejercicio1.impl;

import ar.edu.unlp.oo1.ejercicio1.WallPost;

/**
 * Completar esta clase de acuerdo a lo especificado en el cuadernillo
 *
 */
public class WallPostImpl implements WallPost {

    // Variables de instancia (por defecto son privadas)
    String Text = "Undefined post";
    int Likes = 0;
    boolean Featured;

    // Comportamiento (métodos)
    public String getText() { return this.Text; }
    public void setText(String text) { this.Text = text; }

    public int getLikes() { 
        return this.Likes; 
    }
    public void like() {
        this.Likes++;
    }
    public void dislike() {
        if (this.Likes > 0)
            this.Likes--;
    }

    public boolean isFeatured() { return this.Featured; }
    public void toggleFeatured() { this.Featured = !this.Featured; }

	/*
	 * Este mensaje se utiliza para que una instancia de Wallpost se muestre de forma adecuada
	 */
    @Override
    public String toString() {
        return "WallPost {" +
            "text: " + getText() +
            ", likes: '" + getLikes() + "'" +
            ", featured: '" + isFeatured() + "'" +
            "}";
    }
}
