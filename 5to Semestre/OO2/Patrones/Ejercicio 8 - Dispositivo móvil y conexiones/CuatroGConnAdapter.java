package unlp.oo2.patrones.ej8;

public class CuatroGConnAdapter implements Connection {
	private CuatroGConnection cuatroG;
	
	public CuatroGConnAdapter(CuatroGConnection cuatroG) {
		this.cuatroG = cuatroG;
	}
	
	public String sendData(String data, int crc) {
		return cuatroG.transmit(data, crc);
	}
	
	public String pict() {
		return this.cuatroG.getSymb();
	}
}