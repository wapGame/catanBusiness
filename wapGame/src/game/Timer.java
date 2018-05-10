package game;

import java.util.concurrent.TimeUnit;

public class Timer {
	
	public long WaitForSeconds(long timeInSeconds, int numOfIterations) {
		long secondsPassed = 0;
		for(int i = 1; i <= numOfIterations; i++) {
		try {
			TimeUnit.SECONDS.sleep(timeInSeconds);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		secondsPassed = (i * timeInSeconds);
		}
		return secondsPassed;
	}
	
	public long WaitForMinutes(long timeInMinutes, int numOfIterations) {
		long minutesPassed = 0;
		for(int i = 1; i <= numOfIterations; i++) {
		try {
			TimeUnit.MINUTES.sleep(timeInMinutes);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		minutesPassed = (i * timeInMinutes);
		}
		return minutesPassed;
	}
}
