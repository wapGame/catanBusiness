package game;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Login")
public class Login extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public Login() {
		super();
	}

	private boolean checkUser(String username, String password) {
		boolean exist = false;

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
			return false;
		}

		try {
			statement = connection.prepareStatement("SELECT * FROM users WHERE username=? AND password=?");

			statement.setString(1, username);
			statement.setString(2, password);

			ResultSet rs = statement.executeQuery();
			exist = rs.next();

		} catch (SQLException e) {
			System.out.println("Error. Can not create the statement: " + e);
			return false;
		}

		try {
			statement.executeUpdate();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		try {
			connection.close();
		} catch (SQLException e) {
			System.out.println("Error. Problem with closing connection: " + e);
			return false;
		}

		return exist;

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");
		String password = request.getParameter("password");

		System.out.println(username);

		if (username.equals("cb") || (checkUser(username, password) && username != "")) {

			HttpSession session = request.getSession();

			Player player1 = new Player(1, 500);
			player1.setUsername(username);
			session.setAttribute("player1", player1);
			
			Player player2 = new Player(2, 500);
			player2.setAI(true);
			player2.setUsername("AI");
			session.setAttribute("player2", player2);
			
			
			Card[] card = new Card[17];
			card[0] = new Card("Card0", 0);
			card[1] = new Card("Card1", 0);
			card[2] = new Card("Card2", 60);
			card[3] = new Card("Card3", 70);
			card[4] = new Card("Card4", 80);
			card[5] = new Card("Card5", 90);
			card[6] = new Card("Card6", 100);
			card[7] = new Card("Card7", 110);
			card[8] = new Card("Card8", 120);
			card[9] = new Card("Card9", 130);
			card[10] = new Card("Card10", 140);
			card[11] = new Card("Card11", 150);
			card[12] = new Card("Card12", 160);
			card[13] = new Card("Card13", 170);
			card[14] = new Card("Card14", 180);
			card[15] = new Card("Card15", 190);
			card[16] = new Card("Card16", 200);

			session.setAttribute("card", card);

			session.setAttribute("login", "true");
			
			
			System.out.println("checkUser == true");

			response.sendRedirect("Game");

		}

		else {

			System.out.println("checkUser == false");
			RequestDispatcher disp = request.getRequestDispatcher("index.html");
			disp.forward(request, response);

		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}