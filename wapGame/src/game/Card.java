package game;

public class Card {

	private String name;
	private int cost;
	public boolean isBuyed = false;
	private int boughtBy = 0;

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

	public boolean isBuyed() {
		return this.isBuyed;
	}

	public void setToBuyed(int boughtBy) {
		this.boughtBy = boughtBy;
		this.isBuyed = true;
	}

	public String getBackgroung() {
		if (boughtBy == 1) {
			return "pawn1_bg.png";
		} else if (boughtBy == 2) {
			return "pawn2_bg.png";
		} else {
			return "default_bg.png";
		}
	}

	public int boughtBy() {
		return boughtBy;
	}
}
