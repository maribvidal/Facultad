package ar.edu.unlp.oo1.Ejercicio13;

import org.junit.jupiter.api.*;

public class ClienteDeCorreoTest {
	ClienteDeCorreo unClienteDeCorreo;
	Carpeta unaCarpeta;
	Carpeta otraCarpeta;
	Email unEmail;
	Archivo unArchivo;
	Archivo otroArchivo;
	Archivo tercerArchivo;
	
	@BeforeEach
	void setUp() {
		unClienteDeCorreo = new ClienteDeCorreo();

		unEmail = new Email("Reportes 2023", "Listado de reportes médicos de la empresa del último año");
		
		unArchivo = new Archivo("Encefalograma");
		otroArchivo = new Archivo("Audiometria");
		tercerArchivo = new Archivo("Hemograma");
		
		unEmail.adjuntos().add(unArchivo);
		unEmail.adjuntos().add(otroArchivo);
		unEmail.adjuntos().add(tercerArchivo);
		
		unaCarpeta = new Carpeta("Reportes");
		otraCarpeta = new Carpeta("Temporal");
	}
	
	@Test
	void ClienteDeCorreoTestGeneral() {
		unClienteDeCorreo.recibir(unEmail);
		Assertions.assertEquals(102, unClienteDeCorreo.espacioOcupado());
		Assertions.assertNotNull(unClienteDeCorreo.buscar("Reportes"));
	}
}
