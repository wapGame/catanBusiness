<%@ page import="game.Player"%>
<%@ page import="game.Card"%>
<%@ page import="game.Timer"%>
<%@ page import="game.DatabaseController"%>
<%@ page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
<meta charset="utf-8">
<title>WebAppGame</title>

<style>
* {
	font: 28px Courier New;
}

body {
	background: url(media/bg.jpg) top center;
	background-size: cover;
}

#banner {
	width: 100%;
	height: 200px;
	background: url(media/logo.png) center;
	background-repeat: no-repeat;
}

#menu {
	width: 100%;
	height: 1000px;
}

#main {
	width: 1000px;
	background: #6c6f70;
	opacity: 0.9;
	margin: auto;
	align: center;
}

.footer {
	
}

.btn {
	opacity: 0.9;
	background: #6c6f70;
	background-image: linear-gradient(to bottom, #6c6f70, #424242);
	text-shadow: 1px 1px 3px #666666;
	box-shadow: 5px 5px 10px #666666;
	color: #ffffff;
	text-decoration: bold;
}

.btn:hover {
	opacity: 0.7;
	background: #cccccc;
	background-image: linear-gradient(to bottom, #cccccc, #757575);
	text-decoration: none;
}

.table {
	background: url(media/table_bg.png) top center;
	background-size: cover;
	opacity: 0.9;
	width: 1000px;
	height: 1000px;
}

th {
	border: 2px solid black;
	width: 200px;
	height: 200px;
	position: relative;
	color: gold;
	top-margin: 150px;
	text-align: center;
}

.blank {
	background: none;
	border: none;
}

.pawn {
	width: 100px;
	height: 100px;
	opacity: 1;
	display: block;
	position: absolute;
	z-index: 1;
}

#pawnOrange {
	content: url(media/pawn1.png);
	margin-left: auto;
	top: 0px;
	left: 0px;
}

#pawnBlue {
	content: url(media/pawn2.png);
	margin-right: auto;
	top: 0px;
	left: 95px;
}

#coin {
	background: url(media/coin.png) left center;
	background-repeat: no-repeat;
	text-align: right;
	font-weight: bold;
}

.Orange {
	background-color: rgba(255, 127, 80, 0.7);
}

.Blue {
	background-color: rgba(0, 191, 255, 0.7);
}

.background {
	top: 0;
	left: 0;
	z-index: 0;
	height: 200px;
	width: 200px;
}

.vill {
	background: url(media/card2.png) top center;
	background-repeat: no-repeat;
}

.vill2 {
	background: url(media/card3.png) top center;
	background-repeat: no-repeat;
}

.town {
	background: url(media/card1.png) top center;
	background-repeat: no-repeat;
}

.town2 {
	background: url(media/card4.png) top center;
	background-repeat: no-repeat;
}

.start {
	background: url(media/start.png) top center;
	background-repeat: no-repeat;
}

.direction {
	background: url(media/direction.png) top center;
	background-repeat: no-repeat;
}

#menu {
	width: 100%;
	height: 200px;
}

#submenu {
	margin: auto;
	width: 48%;
}

.console {
	background-color: white;
	border: 2px solid black;
	opacity: 1;
	width: 400px;
	height: 200px;
}

.dice {
	width: 200px;
	height: 200px;
	opacity: 1;
}
</style>

</head>
<body>
	<a href="Game"><div id="banner"></div></a>


	<%
		Player player1 = (Player) session.getAttribute("player1");
		int diceRoll1 = player1.GetLastRollDice();
		int position1 = player1.GetPlace();

		Player player2 = (Player) session.getAttribute("player2");
		int position2 = player2.GetPlace();

		Timer timer = (Timer) session.getAttribute("timer");
		timer.setAmountOfCurrentSeconds();

		DatabaseController dbc = new DatabaseController();
		Card[] card = (Card[]) session.getAttribute("card");
	%>

	<div>
		Time left:
		<%
		if ((300 - timer.timeElapsed() <= 0)) {
	%>
		0 seconds
		<%
		} else {
	%>
		<%=(300 - timer.timeElapsed())%>
		seconds
		<%
			}
		%>

	</div>

	<div id="main">
		<table class="table">
			<tr>
				<th class="vill"><img src="media/<%=card[5].getBackgroung()%>"
					class="background" /> <%
 	if (position1 == 5) {
 %> <img class="pawn" id="pawnOrange" /> <%
 	}
 	if (position2 == 5) {
 %> <img class="pawn" id="pawnBlue" /> <%
 	}
 %></th>
				<th class="vill"><img src="media/<%=card[6].getBackgroung()%>"
					class="background" /> <%
 	if (position1 == 6) {
 %> <img class="pawn" id="pawnOrange" /> <%
 	}
 	if (position2 == 6) {
 %> <img class="pawn" id="pawnBlue" /> <%
 	}
 %></th>

				<th class="vill"><img src="media/<%=card[7].getBackgroung()%>"
					class="background" /> <%
 	if (position1 == 7) {
 %> <img class="pawn" id="pawnOrange" /> <%
 	}
 	if (position2 == 7) {
 %> <img class="pawn" id="pawnBlue" /> <%
 	}
 %></th>
				<th class="vill"><img src="media/<%=card[8].getBackgroung()%>"
					class="background" /> <%
 	if (position1 == 8) {
 %> <img class="pawn" id="pawnOrange" /> <%
 	}
 	if (position2 == 8) {
 %> <img class="pawn" id="pawnBlue" /> <%
 	}
 %></th>
				<th class="town"><img src="media/<%=card[9].getBackgroung()%>"
					class="background" /> <%
 	if (position1 == 9) {
 %> <img class="pawn" id="pawnOrange" /> <%
 	}
 	if (position2 == 9) {
 %> <img class="pawn" id="pawnBlue" /> <%
 	}
 %></th>
			</tr>
			<tr>
				<th class="vill"><img src="media/<%=card[4].getBackgroung()%>"
					class="background" /> <%
 	if (position1 == 4) {
 %> <img class="pawn" id="pawnOrange" /> <%
 	}
 	if (position2 == 4) {
 %> <img class="pawn" id="pawnBlue" /> <%
 	}
 %></th>
				<th class="blank"></th>
				<th class="blank">
					<%
						if (timer.checkIfElapsed(10)) {
					%> <%
 	}
 %> <%
 	if (player1.bankrupt) {
 %> <b>Gracz <%=player1.getUsername()%> zbankrutował. Przegrana!!
				</b> <%
 	} else if (player2.bankrupt) {
 %><b>Gracz <%=player1.getUsername()%> wygrywa!! Gracz 2
						zbankrutował.
				</b> <%
 	} else if (timer.checkIfElapsed(300)) {
 		if (player1.GetMoney() > player2.GetMoney()) {
 			if (player1.saved == false) {
 				dbc.setRankingList(player1.getUsername(), true);
 				player1.saved = true;
 			}
 %> <b>Gracz <%=player1.getUsername()%> wygrywa!!
				</b> <%
 	} else if (player2.GetMoney() > player1.GetMoney()) {
 			if (player1.saved == false) {
 				dbc.setRankingList(player1.getUsername(), false);
 				player1.saved = true;
 			}
 %> <b>Gracz <%=player2.getUsername()%> wygrywa!!
				</b> <%
 	} else {
 %> <b>Remis!!</b> <%
 	}
 	}

 	else {
 		if (player1.wantExchange == true) {

 			List<Card> cardList1 = player1.getCardList();
 			List<Card> cardList2 = player2.getCardList();
 %> <br />
					<form action="Game" method="post">
						<select name="exc1">
							<%
								for (Card c : cardList1) {
							%>
							<option value=<%=c.getName()%>><%=c.getName()%></option>
							<%
								}
							%>
						</select> <br /> on <br /> <select name="exc2">
							<%
								for (Card c : cardList2) {
							%>
							<option value=<%=c.getName()%>><%=c.getName()%></option>
							<%
								}
							%>
						</select> <br /> <br />
						<button type="submit" class="btn" >TRY</button>
					</form> <%
 	} else {
 %>
					<form action="Game" method="post">
						<%
							if (!(position1 == 1 && position2 == 1)) {
										if (player1.rolled == true) {
						%>
						<button type="submit" class="btn" name="endturn">End Turn</button>
						<%
							}
										if (player1.rolled == false) {
						%>
						<button type="submit" class="btn" name="roll">Roll</button>
						<button type="submit" class="btn" name="wantex">Exchange</button>
						<%
							} else if (position1 != 1 && !card[position1].isBuyed()
												&& player1.GetMoney() >= card[position1].getCost()) {
						%>
						<button type="submit" class="btn" name="buy">Buy</button>
						<%
							}
									} else {
						%>
						<button type="submit" class="btn" name="roll">ROLL</button>
						<%
							}
						%>

					</form> <%
 	}
 	}
 %>
				</th>
				<th class="blank"></th>
				<th class="town"><img src="media/<%=card[10].getBackgroung()%>"
					class="background" /> <%
 	if (position1 == 10) {
 %> <img class="pawn" id="pawnOrange" /> <%
 	}
 	if (position2 == 10) {
 %> <img class="pawn" id="pawnBlue" /> <%
 	}
 %></th>
			</tr>
			<tr>
				<th class="vill"><img src="media/<%=card[3].getBackgroung()%>"
					class="background" /> <%
 	if (position1 == 3) {
 %> <img class="pawn" id="pawnOrange" /> <%
 	}
 	if (position2 == 3) {
 %> <img class="pawn" id="pawnBlue" /> <%
 	}
 %></th>
				<th class="blank"></th>
				<th class="blank" id="coin">
					<%
						out.println(player1.GetMoney());
					%>
				</th>
				<th class="blank"></th>
				<th class="town"><img src="media/<%=card[11].getBackgroung()%>"
					class="background" /> <%
 	if (position1 == 11) {
 %> <img class="pawn" id="pawnOrange" /> <%
 	}
 	if (position2 == 11) {
 %> <img class="pawn" id="pawnBlue" /> <%
 	}
 %></th>
			</tr>
			<tr>
				<th class="vill"><img src="media/<%=card[2].getBackgroung()%>"
					class="background" /> <%
 	if (position1 == 2) {
 %> <img class="pawn" id="pawnOrange" /> <%
 	}
 	if (position2 == 2) {
 %> <img class="pawn" id="pawnBlue" /> <%
 	}
 %></th>
				<th class="blank" colspan="2" class="console">
					<%
						// Zrobić konsole, madafaka
					%>
				</th>
				<th class="blank">
					<%
						if (diceRoll1 == 1) {
					%> <img src="media/dice1.png" class="dice" /> <%
 	} else if (diceRoll1 == 2) {
 %> <img src="media/dice2.png" class="dice" /> <%
 	} else if (diceRoll1 == 3) {
 %> <img src="media/dice3.png" class="dice" /> <%
 	} else if (diceRoll1 == 4) {
 %> <img src="media/dice4.png" class="dice" /> <%
 	} else if (diceRoll1 == 5) {
 %> <img src="media/dice5.png" class="dice" /> <%
 	} else if (diceRoll1 == 6) {
 %> <img src="media/dice6.png" class="dice" /> <%
 	} else {
 %> <img src="media/imgLogo.png" class="dice" /> <%
 	}
 %>
				</th>
				<th class="town"><img src="media/<%=card[12].getBackgroung()%>"
					class="background" /> <%
 	if (position1 == 12) {
 %> <img class="pawn" id="pawnOrange" /> <%
 	}
 	if (position2 == 12) {
 %> <img class="pawn" id="pawnBlue" /> <%
 	}
 %></th>
			</tr>
			<tr>
				<th class="start">
					<%
						if (position1 == 1) {
					%> <%
 	
 %> <img class="pawn" id="pawnOrange" /> <%
 	}
 	if (position2 == 1) {
 %> <img class="pawn" id="pawnBlue" /> <%
 	}
 %>
				</th>
				<th class="town"><img src="media/<%=card[16].getBackgroung()%>"
					class="background" /> <%
 	if (position1 == 16) {
 %> <img class="pawn" id="pawnOrange" /> <%
 	}

 	if (position2 == 16) {
 %> <img class="pawn" id="pawnBlue" /> <%
 	}
 %></th>
				<th class="town"><img src="media/<%=card[15].getBackgroung()%>"
					class="background" /> <%
 	if (position1 == 15) {
 %> <%
 	
 %> <img class="pawn" id="pawnOrange" /> <%
 	}

 	if (position2 == 15) {
 %> <img class="pawn" id="pawnBlue" /> <%
 	}
 %></th>
				<th class="town"><img src="media/<%=card[14].getBackgroung()%>"
					class="background" /> <%
 	if (position1 == 14) {
 %> <%
 	
 %> <img class="pawn" id="pawnOrange" /> <%
 	}

 	if (position2 == 14) {
 %> <img class="pawn" id="pawnBlue" /> <%
 	}
 %></th>
				<th class="town"><img src="media/<%=card[13].getBackgroung()%>"
					class="background" /> <%
 	if (position1 == 13) {
 %> <img class="pawn" id="pawnOrange" /> <%
 	}
 	if (position2 == 13) {
 %> <img class="pawn" id="pawnBlue" /> <%
 	}
 %></th>
			</tr>
		</table>
	</div>

	<div id="menu">
		<div id="submenu">
			<form action="Game" method="post">
				<button class="btn" type="submit" name="howto">How to Play</button>

				<button class="btn" type="submit" name="logout">Log Out</button>

				<button class="btn" type="submit" name="rank">See Rankings</button>
			</form>

		</div>
	</div>


	<div class="footer" align="center">
		</br> WAP Project, UEP 2018
	</div>

</body>

</html>
