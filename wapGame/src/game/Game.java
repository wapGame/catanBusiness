package game;

import java.io.IOException;
import java.util.Date;

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
		Card[] card = (Card[]) session.getAttribute("card");
		Player player1 = (Player) session.getAttribute("player1");
		Player player2 = (Player) session.getAttribute("player2");

		player1.WhatSpot(player1.RollDice());
		checkField(player1, player2, card[player1.GetPlace()]);
		player1.rolled = true;
		session.setAttribute("card", card);
		session.setAttribute("player1", player1);
		session.setAttribute("player2", player2);
	}

	public void EndTurn(HttpSession session) {
		Card[] card = (Card[]) session.getAttribute("card");
		Player player1 = (Player) session.getAttribute("player1");
		Player player2 = (Player) session.getAttribute("player2");
		player2.WhatSpot(player2.RollDice());
		int position2 = player2.GetPlace();
		

		if (!card[position2].isBuyed && player2.checkMoneyStatus(card[position2].getCost())) {			
			player2.substractMoney(card[position2].getCost());
			player2.addToList(card[position2]);
			card[position2].setToBuyed(2);
			System.out.println("Player2 - buy " + card[position2].getName());
		}
		
		checkField(player2, player1, card[position2]);
		
		player1.rolled = false;
		session.setAttribute("card", card);
		session.setAttribute("player1", player1);
		session.setAttribute("player2", player2);
	}

	public void Buy(HttpSession session) {

		Card[] card = (Card[]) session.getAttribute("card");
		Player player1 = (Player) session.getAttribute("player1");

		player1.substractMoney(card[player1.GetPlace()].getCost());
		player1.addToList(card[player1.GetPlace()]);

		card[player1.GetPlace()].setToBuyed(1);

		System.out.println("Player1 - buy " + card[player1.GetPlace()].getName());

		session.setAttribute("card", card);
		session.setAttribute("player1", player1);

	}
	
	public void checkField(Player player1, Player player2, Card card) {
		int payment = (card.getCost() / 4);

		if (player1.checkCard(card.getName())) {
			System.out.println("You have it - do nothing");
			return;
		} else if (player2.checkCard(card.getName())) {
			if (player1.checkMoneyStatus(payment)) {
				player1.substractMoney(payment);
				player2.addMoney(payment);
				System.out.println("Player" + player2.GetID() + " have " + card.getName() + " - Player"
						+ player1.GetID() + " pay");
				return;
			} else {
				DatabaseController dbc = new DatabaseController();
				player1.substractMoney(payment);
				player1.setBankrupt();
				if (player1.saved == false) {
					dbc.setRankingList(player1.getUsername(), false);
					System.out.println("Added to rank");
					player1.saved = true;
				}
				if (player2.saved == false) {
					dbc.setRankingList(player2.getUsername(), true);
					System.out.println("Added to rank");
					player2.saved = true;
				}
				return;
			}
		}
		System.out.println("Player: " + player1.GetID() + " Money: " + player1.GetMoney());
		System.out.println();
		return;
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
			EndTurn(session);
		} else if (request.getParameter("buy") != null) {
			Buy(session);
		} else if (request.getParameter("roll") != null) {
			Rzut(session);
		} else if (request.getParameter("howto") != null) {
			response.sendRedirect("howto.html");
		}

		doGet(request, response);
	}

}