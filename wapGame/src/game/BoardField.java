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

	public void checkField(Player player1, Player player2, Card card) {
		int payment = (card.getCost() / 4);
		
		if (player1.checkCard(card.getName())) {
			System.out.println("You have it - do nothing");
		} else if (player2.checkCard(card.getName())) {
			if(player1.checkMoneyStatus(payment)) {
				player1.substractMoney(payment);
				player2.addMoney(payment);				
				System.out.println("Another player have it - you pay");
			}
		} else {
			if(player1.checkMoneyStatus(card.getCost())) {
				player1.substractMoney(card.getCost());
				player1.addToList(card);				
				System.out.println("Nobody have it yet - you buy");
			}
		}
		System.out.println("Player: " + player1.GetID() + " Money: " + player1.GetMoney());
		System.out.println();
	}

}
