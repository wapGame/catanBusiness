package game;

import java.util.concurrent.TimeUnit;
import java.util.Date;

public class Timer {
	
	private Date startDate;
	private Date currentTime;
	
	public long getAmountOfStartSeconds() {
		long tmpTime = startDate.getTime() / 1000;
		return tmpTime;
	}
	
	public void setAmountOfStartSeconds() {
		startDate = new Date();
	}
	
	public long getAmountOfCurrentSeconds() {
		long tmpTime = currentTime.getTime() / 1000;
		return tmpTime;
	}
	
	public void setAmountOfCurrentSeconds() {
		currentTime = new Date();
	}
	
	public long timeElapsed() {
		long tmp = getAmountOfCurrentSeconds() - getAmountOfStartSeconds();
		return tmp;
	}
	
	public boolean checkIfElapsed(long seconds) { 
		if(timeElapsed() >= seconds) {
			return true;
		} else {
			return false;
		}
	}
	
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
