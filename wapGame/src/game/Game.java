package game;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Game")
public class Game extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	public static Player player1 = new Player(1, 1000); 
	
	
	
	public Game() {
		super();
	}

	
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {		
		
		request.setAttribute("player1", player1);
		
		
		HttpSession session = request.getSession();
		Object login = session.getAttribute("login");
			
		if (login == "true") {
			
			System.out.println("login == true");
			RequestDispatcher disp = request.getRequestDispatcher("/WEB-INF/game.jsp");
			disp.forward(request, response);	

		} else {
			System.out.println("login == false");
			//RequestDispatcher disp = request.getRequestDispatcher("index.html");
			//disp.forward(request, response);
			response.sendRedirect("index.html");
		}		
			
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
			doGet(request, response);
	}

}