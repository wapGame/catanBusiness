package game;

import java.io.Serializable;

public class User implements Serializable {
	
	static final long serialVersionUID = 12345L;
	private String username;
	private String password;
	private int rank;

	public User() {
		// TODO Auto-generated constructor stub
	}

	public String getUsername() {
		return username;
	}
	
	public void setRank(int rank) {
		this.rank = rank;
	}
	public int getRank() {
		return rank;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
		
	}
}