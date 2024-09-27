package ar.edu.unlp.oo1.ejercicio10;

public class JobSchedulerLIFO extends JobScheduler {
	public JobDescription next() {
		JobDescription nextJob = jobs.get(jobs.size() - 1);
		this.unschedule(nextJob);
		return nextJob;
	}
}
