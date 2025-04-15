package unlp.oo2.patrones.ej8;

public class WifiConn implements Connection {
	private String pict;
	
	public WifiConn(String pict) {
		this.pict = pict;
	}
	
	public String sendData(String data, int crc) {
		return "Enviando datos: \n" + data + "\n" + crc; 
	}
	
	public String pict() {
		return pict;
	}
}