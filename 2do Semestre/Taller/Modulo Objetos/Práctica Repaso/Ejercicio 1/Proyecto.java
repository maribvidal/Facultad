package repaso_ej1;

public class Proyecto {
    private String nombre;
    private int codigo;
    private String director;
    
    private Investigador [] vec_investigadores = new Investigador [50];
    private int vec_dimL = 0;

    public Proyecto(String nombre, int codigo, String director) {
        this.setNombre(nombre);
        this.setCodigo(codigo);
        this.setDirector(director);
    }

    //Getters
    public String getNombre() {
        return nombre;
    }
    public int getCodigo() {
        return codigo;
    }
    public String getDirector() {
        return director;
    }

    //Setters
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }
    public void setDirector(String director) {
        this.director = director;
    }
    
    //Otros métodos
    public void agregarInvestigador(Investigador unInvestigador) {
        if (this.vec_dimL < 50) {
            this.vec_investigadores[this.vec_dimL] = unInvestigador;
            this.vec_dimL++;
        } else {
            System.out.println("ERROR: No pueden entrar mas elementos en el vector");
        }
    }
    
    public double dineroTotalOtorgado() {
        //devolver el monto total otorgado en subsidios del proyecto (tener en cuenta
        //todos los subsidios otorgados de todos los investigadores)
        double aux = 0;
        
        for (int i = 0; i < this.vec_dimL; i++)
            aux += this.vec_investigadores[i].getDineroOtorgado();
        
        return aux;
    }
    
    public void otorgarTodos(String nombreCompleto) {
        Investigador inv = null;
        String aux = "";
        int i = 0;
        
        while (i < this.vec_dimL && !aux.equals(nombreCompleto)) {
            aux = this.vec_investigadores[i].getNombre();
            if (aux.equals(nombreCompleto)) //Si aux y el nombre pasado por parámetro coinciden
                inv = this.vec_investigadores[i]; //Guardar objeto
            i++;
        }
        
        if (inv != null) {
            inv.otorgarSubsidios();
        } else {
            System.out.println("ERROR: No se pudo encontrar dicho investigador");
        }
    }
    
    @Override
    public String toString() {
        String infoInv;
        String aux = "[PROYECTO: " + this.getNombre() + " || CODIGO: " + this.getCodigo() + " || NOMBRE DEL DIRECTOR: " + this.getDirector() + "]\n";
        aux = aux + "[TOTAL DEL DINERO OTORGADO AL PROYECTO: " + this.dineroTotalOtorgado() + "]\n";
        for (int i = 0; i < this.vec_dimL; i++) {
            infoInv = "(NOMBRE DEL INVESTIGADOR: " + this.vec_investigadores[i].getNombre() +
                      ", CATEGORÍA: " + this.vec_investigadores[i].getCategoria() +
                      ", ESPECIALIDAD: " + this.vec_investigadores[i].getEspecialidad() + 
                      ", DINERO TOTAL DE SUS SUBSIDIOS OTORGADOS: " + this.vec_investigadores[i].getDineroOtorgado() + ")";
            aux = aux + infoInv + "\n";
        }
        return aux;
    }
}
