package unlp.oo2.patrones.ej8;

public class CuatroGConnection {
	private String symb;
	
	public CuatroGConnection(String symb) {
		this.symb = symb;
	}
	
	public String transmit(String data, int crc) {
		return "Transmitiendo datos: \n" + data + "\n" + crc; 
	}
	
	public String getSymb() { return this.symb; }
}