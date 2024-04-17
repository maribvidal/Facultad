package tp3;

public class AreaEmpresa {
	public String IdentificadorArea;
	public int TardanzaMsj;
	
	public AreaEmpresa(String identificadorArea, int tardanzaMsj) {
		IdentificadorArea = identificadorArea;
		TardanzaMsj = tardanzaMsj;
	}
	
	public int getTardanza() {
		return TardanzaMsj;
	}
}
