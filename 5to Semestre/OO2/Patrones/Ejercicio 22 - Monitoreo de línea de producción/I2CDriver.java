package unlp.oo2.patrones.ej22;

public class I2CDriver {
	private int SCL;
	private int SDL;
	private MixingTank tank;
	private ProcessStep processStep;
	//
	public I2CDriver(int SCL, int SDL, MixingTank tank, ProcessStep processStep) {
		this.SCL = SCL;
		this.SDL = SDL;
		this.tank = tank;
		this.processStep = processStep;
	}
	
	// INTERFAZ PÚBLICA
	
	public boolean sendStartSeq() {
		this.processStep.execute(tank);
		return true;
	}
	
	public boolean sendAddress(String address) { return true; } 
	public boolean sendCommand(String command) { return true; }
	
	public boolean sendStopSeq() {
		if (processStep.isDone())
			processStep.setSuccess();
		else
			processStep.setFailure();
		return true;
	}
}