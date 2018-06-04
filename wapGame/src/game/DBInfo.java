package game;

public class DBInfo {
	
	static String host = "jws-app-mysql"; 
	
	static String DBname = "lllc";
	static int port = 3306;
	static String mySQLdbURL = "jdbc:mysql://" + host + ":" + port + "/"
			+ DBname;

	static String user = "user";
	static String password = "password";
	
	static String driver = "com.mysql.jdbc.Driver";

	public DBInfo() {

	}

	static String getDBURL() {
		return mySQLdbURL;
	}

	public static String getUser() {
		return user;
	}

	public static String getPassword() {
		return password;
	}

	public static String getDriver() {
		return driver;
	}
	
}