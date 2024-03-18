package tp1;

public class Test {
	public static void main(String[] args) {
		Estudiante[] arrEstu = {new Estudiante(), new Estudiante()};			
		Profesor[] arrProf = {new Profesor(), new Profesor(), new Profesor()};
			
		//Modificar elementos - ESTUDIANTE
		arrEstu[0].setNombre("Eustaquio"); arrEstu[0].setApellido("Valdez"); arrEstu[0].setEmail("eusvald@gmail.com"); arrEstu[0].setDireccion("12 esq. 50"); arrEstu[0].setComision("1");
		arrEstu[1].setNombre("Raimundo"); arrEstu[1].setApellido("Valdez"); arrEstu[1].setEmail("raivald@gmail.com"); arrEstu[1].setDireccion("12 esq. 51"); arrEstu[1].setComision("2");
						
	    //Modificar elementos - PROFESOR
		arrProf[0].setNombre("Roberto"); arrProf[0].setApellido("Thomas"); arrProf[0].setEmail("robthom@gmail.com"); arrProf[0].setCatedra("FOD"); arrProf[0].setFacultad("Info");
		arrProf[1].setNombre("Pablo"); arrProf[1].setApellido("Bertoloti"); arrProf[1].setEmail("pabber@gmail.com"); arrProf[1].setCatedra("FOD"); arrProf[1].setFacultad("Info");
		arrProf[2].setNombre("GOnza"); arrProf[2].setApellido("Sape"); arrProf[2].setEmail("elgonza@gmail.com"); arrProf[2].setCatedra("Taller"); arrProf[2].setFacultad("Info");
			
		//Recorrer arreglos
		for (int i = 0; i < arrEstu.length; i++) {System.out.println(arrEstu[i].tusDatos());}
		for (int i = 0; i < arrProf.length; i++) {System.out.println(arrProf[i].tusDatos());}
	}
}
