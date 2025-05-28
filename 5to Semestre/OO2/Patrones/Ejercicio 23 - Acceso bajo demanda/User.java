package ar.edu.unlp.oo2.persitencia;

import java.util.ArrayList;
import java.util.List;

public class User implements PersistableUser {
	
	private String username;
	
	private String email;
	
	private List <Post> posts;

	public User (String aUsername, String anEmail) {
		this.username = aUsername;
		this.email = anEmail;
		this.posts = new ArrayList<Post>();
	}

	@Override
	public String getUsername() {
		return this.username;
	}

	@Override
	public String getEmail() {
		return this.email;
	}

	@Override
	public String toString() {
		return this.username + " - " + this.email;
	}

	@Override
	public List<Post> getPosts() {
		return this.posts;
	}

	public void addPost(Post post) {
		this.posts.add(post);
	}

	public void addPosts(List<Post> posts) {
		this.posts.addAll(posts);
	}
}
