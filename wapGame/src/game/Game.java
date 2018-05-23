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

	public Game() {
		super();
	}

	public void Rzut(HttpSession session) {

		Player player1 = (Player) session.getAttribute("player1");
		player1.WhatSpot(player1.RollDice());

		Player player2 = (Player) session.getAttribute("player2");
		player2.WhatSpot(player2.RollDice());
		player2.setAI(true);

		session.setAttribute("player1", player1);
		session.setAttribute("player2", player2);
	}

	public void Buy(HttpSession session) {

		Card[] card = (Card[]) session.getAttribute("card");
		Player player1 = (Player) session.getAttribute("player1");

		player1.substractMoney(card[player1.GetPlace()].getCost());
		player1.addToList(card[player1.GetPlace()]);

		card[player1.GetPlace()].setToBuyed();

		System.out.println("Player1 - buy " + card[player1.GetPlace()].getName());

		session.setAttribute("card", card);
		session.setAttribute("player1", player1);

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		String login = (String) session.getAttribute("login");

		if (login == "true") {

			System.out.println("login == true");
			RequestDispatcher disp = request.getRequestDispatcher("/WEB-INF/game.jsp");
			disp.forward(request, response);

		} else {
			System.out.println("login == false");
			// RequestDispatcher disp = request.getRequestDispatcher("index.html");
			// disp.forward(request, response);
			response.sendRedirect("index.html");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (request.getParameter("endturn") != null) {
			Rzut(session);
		} else if (request.getParameter("buy") != null) {
			Buy(session);
		}

		doGet(request, response);
	}

}