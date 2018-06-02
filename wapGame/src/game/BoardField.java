package game;

import java.util.ArrayList;
import java.util.List;

public class BoardField {

	private Player player;
	private Card card;

	public Player getPlayer() {
		return player;
	}

	public Card getCard() {
		return card;
	}

	public boolean checkField(Player player1, Player player2, Card card) {
		int payment = (card.getCost() / 4);

		if (player1.checkCard(card.getName())) {
			System.out.println("You have it - do nothing");
			return false;
		} else if (player2.checkCard(card.getName())) {
			if (player1.checkMoneyStatus(payment)) {
				player1.substractMoney(payment);
				player2.addMoney(payment);
				System.out.println("Player" + player2.GetID() + " have " + card.getName() + " - Player"
						+ player1.GetID() + " pay");
				return false;
			}
			else {
				DatabaseController dbc = new DatabaseController();
				player1.substractMoney(payment);
				player1.setBankrupt();				
				dbc.setRankingList(player1.getUsername(),true);
				dbc.setRankingList(player2.getUsername(),false);
				return true;
			}
		}
		System.out.println("Player: " + player1.GetID() + " Money: " + player1.GetMoney());
		System.out.println();
		return false;
	}

}
