package unlp.oo2.patrones.ej8;

public class Dispositivo {
	private Connection connection;
	private ICRCCalculator crcCalculator;
	private Ringer ringer;
	private Display display;
	
	public Dispositivo(Connection connection, ICRCCalculator crcCalculator, Ringer ringer, Display display) {
		this.connection = connection;
		this.crcCalculator = crcCalculator;
		this.ringer = ringer;
		this.display = display;
	}
	
	public String sendData(String data) {
		int crc = (int) crcCalculator.crcFor(data);
		return connection.sendData(data, crc);
	}
	
	// Métodos que nos piden implementar
	public void conectarCon(Connection nuevaConexion) {
		this.connection = nuevaConexion;
		System.out.println(display.showBanner(connection.pict()));
		ringer.ring();
	}
	
	public void configurarCRC(ICRCCalculator nuevaCalculadora) {
		this.crcCalculator = nuevaCalculadora;
	}
}