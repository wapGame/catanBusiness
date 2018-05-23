package game;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class Player {

	private int minDice = 1;
	private int maxDice = 6;
	private int place = 1;

	private int playerID;
	private int money;

	private List<Card> cardList = new ArrayList<>();

	public Player(int _playerID, int _money) {
		this.playerID = _playerID;
		this.money = _money;
	}

	public void addToList(Card card) {
		cardList.add(card);
	}

	public boolean checkCard(String name) {
		for (Card card : cardList) {
			if (card.getName().equals(name)) {
				return true;
			}
		}
		return false;
	}
	
	public boolean checkMoneyStatus(int amount) {
		int tmp = (this.money - amount);

		if (tmp >= 0) {
			return true;
		} else {
			return false;
		}
	}

	public void substractMoney(int amount) {
		if (checkMoneyStatus(amount)) {
			this.money -= amount;
		} else {
			System.out.println("Not enough money");
		}
	}

	public void addMoney(int amount) {
		this.money += amount;
	}

	public void SetID(int _playerID) {
		this.playerID = _playerID;
	}

	public int GetID() {
		return this.playerID;
	}

	public void SetMoney(int _money) {
		this.money = _money;
	}

	public int GetMoney() {
		return this.money;
	}

	public int RollDice() {
		Random roll = new Random();
		int result = minDice + roll.nextInt(maxDice);
		return result;
	}

	public int WhatSpot(int rolled) {
		for (int i = 1; i <= rolled; i++) {
			place++;

			if (place > 16) {
				place = 1;
			}
		}
		return place;
	}
	public int GetPlace() {
		return place;
	}
}
