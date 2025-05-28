package unlp.oo2.patrones.ej22;

public abstract class ProcessStep {
	private boolean result;
	
	public void execute(MixingTank tank) {
		if (this.basicExecute(tank)) {
			this.setSuccess();
		}
		else 
			this.setFailure();
	}
	
	public boolean isDone() {
		return this.result;
	}
	
	public void setFailure() {
		this.result = false;
	}
	
	public void setSuccess() {
		this.result = true;
	}
	
	// Métodos internos
	
	protected abstract boolean basicExecute(MixingTank tank);
	protected void delay(int sec) throws InterruptedException {
		Thread.sleep(sec);
	}
}