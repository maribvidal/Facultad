package unlp.oo2.patrones.ej22;

public class Purge extends ProcessStep {
	//
	// INTERFAZ PÚBLICA
	
	@Override
	public boolean basicExecute(MixingTank tank) {
		  if (tank.upTo() == 0) {
			    return false;
			  } else {
			    tank.heatPower(0);
			    tank.mixerPower(0);
			    tank.purge();
			    try {
					delay(4);
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			    if (tank.upTo() != 0){
			      return false;
			    }
			    return true;
			  }
	}

}