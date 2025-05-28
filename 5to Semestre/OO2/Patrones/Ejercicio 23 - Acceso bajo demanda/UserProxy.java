package ar.edu.unlp.oo2.persitencia;

import java.util.ArrayList;
import java.util.List;

public class UserProxy implements PersistableUser {
	User sujetoReal;
	//
	public UserProxy(String aUsername, String anEmail) {
		this.sujetoReal = new User(aUsername, anEmail);
	}
	
	// INTERFAZ PÚBLICA
	
	@Override
	public String getUsername() {
		return this.sujetoReal.getUsername();
	}

	@Override
	public String getEmail() {
		return this.sujetoReal.getEmail();
	}

	@Override
	public List<Post> getPosts() {
		// Ir a buscar los posts solo cuando se pida
		if (sujetoReal.getPosts().isEmpty()) {
			sujetoReal.addPosts(new PostRepository().findPostsByUsername(this.getUsername()));
		}
		return this.sujetoReal.getPosts();
	}

}