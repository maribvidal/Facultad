package unlp.oo2.ejercicio1;

import java.util.List;
import java.util.ArrayList;

// Esta clase actua como repositorio   
// y administrador de usuarios

public class Twitter {
    private List<Usuario> usuariosRegistrados;

    public Twitter() {
		this.usuariosRegistrados = new ArrayList<Usuario>();
	}
	
	// METODOS PUBLICOS

	public Usuario registrarUsuario(String screenName) {
		Usuario usuario = null;
		
		if (!this.nombreExistente(screenName)) {
			usuario = new Usuario(screenName);
			this.usuariosRegistrados.add(usuario);
		}
		
		return usuario;
	}
	
	// METODOS PRIVADOS

	private boolean nombreExistente(String screenName) {
        boolean existe = this.usuariosRegistrados.stream().anyMatch(usu -> usu.getScreenName() == screenName);
		return existe;
	}
}
