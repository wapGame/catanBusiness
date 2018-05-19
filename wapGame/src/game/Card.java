package game;

public class Card {

	private String name;
	private int cost;
	
	public Card(String _name, int _cost) {
		name = _name;
		cost = _cost;
	}
	
	public String getName() {
		return name;
	}
	
	public int getCost() {
		return cost;
	}
}
