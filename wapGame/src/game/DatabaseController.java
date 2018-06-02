package game;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class DatabaseController {

	public void setRankingList(String user, boolean win) {

		if (user.equals("AI")){
			return;
		}
		Connection connection;
		PreparedStatement statement;

		String dbURL = DBInfo.getDBURL();
		String dbuser = DBInfo.getUser();
		String dbpassword = DBInfo.getPassword();

		try {

			Class.forName(DBInfo.getDriver());
		} catch (ClassNotFoundException e) {
			System.out.println("Error. Driver class not found: " + e);
		}

		try {
			connection = DriverManager.getConnection(dbURL, dbuser, dbpassword);
		} catch (SQLException e) {
			System.out.println("Error. Connection problem: " + e);
			return;
		}

		try {
			int userRank = userRank(user);
			if (userRank == -100) {
				statement = connection.prepareStatement("INSERT INTO rank (username, rank) VALUES (?,?)");
				statement.setString(1, user);
				if (win) {
					statement.setInt(2, 2);
				} else {
					statement.setInt(2, -1);
				}
			} else {				
				statement = connection.prepareStatement("UPDATE rank SET rank = ? WHERE username = ?");				
				if (win) {
					statement.setInt(1, userRank + 2);
				} else {
					statement.setInt(1, userRank - 1);
				}
				statement.setString(2, user);
			}
		} catch (SQLException e) {
			System.out.println("Error. Can not create the statement: " + e);
			return;
		}

		try {

			statement.executeUpdate();
		} catch (SQLException e) {
			System.out.println("Error. Problem with executeUpdate: " + e);
			return;
		}

		try {
			connection.close();
		} catch (SQLException e) {
			System.out.println("Error. Problem with closing connection: " + e);
			return;
		}
	}

	public int userRank(String user) {

		ArrayList<User> rankList = this.getRankList();
		for (User u : rankList) {
			if (u.getUsername().equals(user)) {
				return u.getRank();
			}
		}
		return -100;
	}

	public ArrayList<User> getRankList() {

		ArrayList<User> rankList = new ArrayList<User>();

		Connection connection;
		Statement statement;
		ResultSet result = null;

		String dbURL = DBInfo.getDBURL();
		String dbuser = DBInfo.getUser();
		String dbpassword = DBInfo.getPassword();

		try {

			Class.forName(DBInfo.getDriver());
		} catch (ClassNotFoundException e) {
			System.out.println("Error. Driver class not found: " + e);
		}

		try {
			connection = DriverManager.getConnection(dbURL, dbuser, dbpassword);
		} catch (SQLException e) {
			System.out.println("Error. Connection problem: " + e);
			return rankList;
		}

		try {
			statement = connection.createStatement();
		} catch (SQLException e) {
			System.out.println("Error. Can not create the statement: " + e);
			return rankList;
		}

		String searchString = "SELECT * FROM rank ORDER BY `rank` DESC";
		try {
			result = statement.executeQuery(searchString);
		} catch (SQLException e) {
			System.out.println("Error. Problem with executeUpdate: " + e);
			return rankList;
		}

		try {
			while (result.next()) {
				User user = new User();

				user.setUsername(result.getString("username"));

				user.setRank(result.getInt("rank"));

				rankList.add(user);
			}
		} catch (SQLException e) {
			System.out.println("Error. Problem reading data: " + e);
			return rankList;
		}

		try {
			connection.close();
		} catch (SQLException e) {
			System.out.println("Error. Problem with closing connection: " + e);
			return rankList;
		}

		return rankList;
	}

}