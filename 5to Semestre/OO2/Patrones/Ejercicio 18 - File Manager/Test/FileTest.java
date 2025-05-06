package unlp.oo2.patrones.ej18;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class FileTest {
	final String ARCHIVO_NOMBRE = "TEST";
	final String ARCHIVO_EXTENSION = ".txt";
	final int ARCHIVO_TAMAÑO = 64;
	final LocalDate ARCHIVO_FECHA_CREACION = LocalDate.now().minusDays(5);
	final LocalDate ARCHIVO_FECHA_MODIFICACION = ARCHIVO_FECHA_CREACION.plusDays(4);
	
	List<String> archivo_permisos;
	
	FileOO2 archivo;
	IFile archivoExtension, archivoFechaCreacionExtension, archivoTamañoPermisosExtension;
	
	@BeforeEach
	void setUp() throws Exception {
		archivo_permisos = new ArrayList<String>();
		
		archivo_permisos.add("Write");
		archivo_permisos.add("Read");
		archivo_permisos.add("Append");
		
		archivo = new FileOO2(ARCHIVO_NOMBRE,
								ARCHIVO_EXTENSION,
								ARCHIVO_TAMAÑO,
								ARCHIVO_FECHA_CREACION,
								ARCHIVO_FECHA_MODIFICACION,
								archivo_permisos
							);
		
		archivoExtension = new DecoratorExtension(archivo);
		archivoFechaCreacionExtension = new DecoratorExtension(
					new DecoratorFechaCreacion(archivo)
				);
		archivoTamañoPermisosExtension = new DecoratorExtension(
				new DecoratorPermisos(
						new DecoratorTamaño(archivo)
				)
			);
	}
	
	@Test
	public void test_inicializacion() {
		Assertions.assertEquals(archivo, archivo.getFile());
		
		Assertions.assertEquals(archivo, archivoExtension.getFile(), 
				"ERROR: el Decorator archivoExtension no tiene un FileOO2 dentro");
		Assertions.assertEquals(archivo, archivoFechaCreacionExtension.getFile(), 
				"ERROR: el Decorator archivoFechaCreacionExtension no tiene un FileOO2 dentro");
		Assertions.assertEquals(archivo, archivoTamañoPermisosExtension.getFile(), 
				"ERROR: el Decorator archivoTamañoPermisosExtension no tiene un FileOO2 dentro");
	}
	
	@Test
	public void test_prettyPrint() {
		Assertions.assertEquals(ARCHIVO_NOMBRE, archivo.prettyPrint());
		
		Assertions.assertEquals(ARCHIVO_NOMBRE + " - " + ARCHIVO_EXTENSION, archivoExtension.prettyPrint(),
				"ERROR: el Decorator archivoExtension no está imprimiendo su nombre como debería");
		Assertions.assertEquals(ARCHIVO_NOMBRE + " - " + ARCHIVO_FECHA_CREACION.toString() + " - " + ARCHIVO_EXTENSION, archivoFechaCreacionExtension.prettyPrint(),
				"ERROR: el Decorator archivoFechaCreacionExtension no está imprimiendo su nombre como debería");
		Assertions.assertEquals(ARCHIVO_NOMBRE + " - " + String.valueOf(ARCHIVO_TAMAÑO) + " - " + archivo_permisos.toString() + " - " + ARCHIVO_EXTENSION, archivoTamañoPermisosExtension.prettyPrint(),
				"ERROR: el Decorator archivoTamañoPermisosExtension no está imprimiendo su nombre como debería");
	}
}
