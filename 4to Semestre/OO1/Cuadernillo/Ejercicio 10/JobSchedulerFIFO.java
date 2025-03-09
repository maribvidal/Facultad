package ar.edu.unlp.oo1.ejercicio10;

public class JobSchedulerFIFO extends JobScheduler {
	public JobDescription next() {
		JobDescription nextJob = jobs.get(0);
		this.unschedule(nextJob);
		return nextJob;
	}
}
