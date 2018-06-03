package game;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Rank")
public class Rank extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	public Rank() {
		super();
	}
	
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		DatabaseController dbc = new DatabaseController();
		ArrayList<User> rankList = dbc.getRankList();
		
		request.setAttribute("rankList", rankList);

		RequestDispatcher disp = request
				.getRequestDispatcher("/WEB-INF/rank.jsp");
		disp.forward(request, response);

	}
	
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}