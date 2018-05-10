package game;

import java.util.Random;

public class Player {

	private int minDice = 1;
	private int maxDice = 6;
	private int place = 1;
	
	private int playerID;
	private int money;
	
	public Player(int _playerID, int _money) {
		this.playerID = _playerID;
		this.money = _money;
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
		place += rolled;
		if(place <= 16) {
			place = 1;
		}
		return place;
	}
}
