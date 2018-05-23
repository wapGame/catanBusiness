<%@ page import="game.Player"%>
<%@ page import="game.BoardField"%>
<%@ page import="game.Card"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
  <meta charset="utf-8">
  <title>WebAppGame</title>

<style>
* {font: 28px Courier New;}
body {background: url(media/bg.jpg) top center;background-size:cover;}

#banner {
width:100%;
height: 200px;
background: url(media/logo.png) center;
background-repeat: no-repeat;
}

#menu {width: 100%; height: 1000px;}

#main {width:1000px;background: #6c6f70; opacity: 0.9; margin: auto; align: center;}

.footer {}

.btn {
  opacity: 0.9;
  background: #6c6f70;
  background-image: linear-gradient(to bottom, #6c6f70, #424242);
  border-radius: 28px;
  text-shadow: 1px 1px 3px #666666;
  box-shadow: 5px 5px 10px #666666;
  color: #ffffff;
  padding: 10px 20px 10px 20px;
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
        background-size:cover;
	opacity: 0.9;
	width:1000px;
	height:1000px;
}

th {
   border: 2px solid black;
   width: 200px;
   height: 200px;
   position: relative;
}

.blank {
	background: none;
	border: none;
}
	
.pawn {
	width:100px;
	height:100px;
	opacity:1;
	display: block;
	position:absolute;
	z-index:1;
}
	
	#pawnOrange {
		content:url(media/pawn1.png);
		margin-left: auto;
		top: 0px;
		left: 0px;
	}
	
	#pawnBlue {
		content:url(media/pawn2.png);
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
	background-color:rgba(255,127,80,0.7);
	}

	.Blue {
	background-color:rgba(0,191,255,0.7);
	}
	
	.background {
	position:absolute;
	top:0;
	left:0;
	z-index:0;
	}

	.vill {
	background: url(media/card2.png) top center;
	background-repeat: no-repeat;
	}
	
	.town {
	background: url(media/card1.png) top center;
	background-repeat: no-repeat;
	}
	
	#menu {
	width:100%;
	height:50px;
	}

	#submenu {
	margin: auto;
	width:48%;
	}

</style>

</head>
<body>
		
<% Player player1 = (Player)session.getAttribute("player1"); %>
<% int diceRoll1 = player2.RollDice(); %>
<% int position1 = player1.GetPlace();%>
<% out.println(position1); %>

<%! Player player2 = new Player(2, 1000); %>
<% int diceRoll2 = player2.RollDice(); %>
<% int position2 = player2.WhatSpot(diceRoll2); %>
<% out.println(position2); %>



<%! BoardField field = new BoardField(); %>

<%! Card card1 = new Card("Card1", 50); %>
<%! Card card2 = new Card("Card2", 60); %>
<%! Card card3 = new Card("Card3", 70); %>
<%! Card card4 = new Card("Card4", 80); %>
<%! Card card5 = new Card("Card5", 90); %>
<%! Card card6 = new Card("Card6", 100); %>
<%! Card card7 = new Card("Card7", 110); %>
<%! Card card8 = new Card("Card8", 120); %>
<%! Card card9 = new Card("Card9", 130); %>
<%! Card card10 = new Card("Card10", 140); %>
<%! Card card11 = new Card("Card11", 150); %>
<%! Card card12 = new Card("Card12", 160); %>
<%! Card card13 = new Card("Card13", 170); %>
<%! Card card14 = new Card("Card14", 180); %>
<%! Card card15 = new Card("Card15", 190); %>
<%! Card card16 = new Card("Card16", 200); %>

<%! String background = "card2.png"; %>

	<div id="banner">
	</div>

	<div id="menu">
		<div id="submenu">
			<form action="Logout" method="post">
			<button type="button">See Rankings</button>
			<button type="button">How to Play</button>
			<button type="submit" >Log Out</button>
			</form>

		</div>	
	</div>

	<div id="main">
	<table class="table">
		<tr>
			<th>
			<img src="media/card2.png" class="background"/>
			<img src="media/<%= background %>" class="background"/>
			<% if(position1 == 5) {%>
			<% if(field.checkField(player1, player2, card5)) { %>
			<% background = "pawn1_bg.png"; %>	
			<%}%>
			<img class="pawn" id="pawnOrange"/>
			<% }%>
			<% if(position2 == 5) {%>
			<% if(field.checkField(player2, player1, card5)) { %>
			<% background = "pawn2_bg.png"; %>	
			<%}%>
			<img class="pawn" id="pawnBlue"/>
			<% }%>
			</th>
			<th class="vill">
			<% if(position1 == 6) {%>
			<% field.checkField(player1, player2, card6); %>
			<img class="pawn" id="pawnOrange"/>
			<% }%>
			<% if(position2 == 6) {%>
			<% field.checkField(player2, player1, card6); %>
			<img class="pawn" id="pawnBlue"/>
			<% }%>
			</th>
			
			<th class="vill">
			<% if(position1 == 7) {%>
			<% field.checkField(player1, player2, card7); %>
			<img class="pawn" id="pawnOrange"/>
			<% }%>
			<% if(position2 == 7) {%>
			<% field.checkField(player2, player1, card7); %>
			<img class="pawn" id="pawnBlue"/>
			<% }%>
			</th>
			<th  class="vill">
			<% if(position1 == 8) {%>
			<% field.checkField(player1, player2, card8); %>
			<img class="pawn" id="pawnOrange"/>
			<% }%>
			<% if(position2 == 8) {%>
			<% field.checkField(player2, player1, card8); %>
			<img class="pawn" id="pawnBlue"/>
			<% }%>
			</th>
			<th class="town">
			<% if(position1 == 9) {%>
			<% field.checkField(player1, player2, card9); %>
			<img class="pawn" id="pawnOrange"/>
			<% }%>
			<% if(position2 == 9) {%>
			<% field.checkField(player2, player1, card9); %>
			<img class="pawn" id="pawnBlue"/>
			<% }%>
			</th>
		</tr>
		<tr>
			<th class="vill">
			<% if(position1 == 4) {%>
			<% field.checkField(player1, player2, card4); %>
			<img class="pawn" id="pawnOrange"/>
			<% }%>
			<% if(position2 == 4) {%>
			<% field.checkField(player2, player1, card4); %>
			<img class="pawn" id="pawnBlue"/>
			<% }%>
			</th>
			<th class="blank"></th>
			<th class="blank">> 
			
						<form action="Game" method="post">
			<button type="submit" name="endturn" >End Turn</button>
						</form>
			
			 </th>
			<th class="blank"></th>
			<th class="town">
			<% if(position1 == 10) {%>
			<% field.checkField(player1, player2, card10); %>
			<img class="pawn" id="pawnOrange"/>
			<% }%>
			<% if(position2 == 10) {%>
			<% field.checkField(player2, player1, card10); %>
			<img class="pawn" id="pawnBlue"/>
			<% }%>
			</th>
		</tr>
		<tr>
			<th class="vill">
			<% if(position1 == 3) {%>
			<% field.checkField(player1, player2, card3); %>
			<img class="pawn" id="pawnOrange"/>
			<% }%>
			<% if(position2 == 3) {%>
			<% field.checkField(player2, player1, card3); %>
			<img class="pawn" id="pawnBlue"/>
			<% }%>
			</th>
			<th class="blank"></th>
			<th class="blank">
			<% if(diceRoll1 == 1) { %>
			<img src="media/dice1.png" style="width:200px;height:200px;opacity:1;"/>
			<%} else if(diceRoll1 == 2) { %>
			<img src="media/dice2.png" style="width:200px;height:200px;opacity:1;"/>
			<%} else if(diceRoll1 == 3) { %>
			<img src="media/dice3.png" style="width:200px;height:200px;opacity:1;"/>
			<%} else if(diceRoll1 == 4) { %>
			<img src="media/dice4.png" style="width:200px;height:200px;opacity:1;"/>
			<%} else if(diceRoll1 == 5) { %>
			<img src="media/dice5.png" style="width:200px;height:200px;opacity:1;"/>
			<%} else if(diceRoll1 == 6) { %>
			<img src="media/dice6.png" style="width:200px;height:200px;opacity:1;"/>
			<% } else { %>
			<img src="media/imgLogo.png" style="width:200px;height:200px;opacity:1;"/>
			<%} %>
			</th>
			<th class="blank"></th>
			<th class="town">
			<% if(position1 == 11) {%>
			<% field.checkField(player1, player2, card11); %>
			<img class="pawn" id="pawnOrange"/>
			<% }%>
			<% if(position2 == 11) {%>
			<% field.checkField(player2, player1, card11); %>
			<img class="pawn" id="pawnBlue"/>
			<% }%>
			</th>
		</tr>
		<tr>
			<th class="vill">
			<% if(position1 == 2) {%>
			<% field.checkField(player1, player2, card2); %>
			<img class="pawn" id="pawnOrange"/>
			<% }%>
			<% if(position2 == 2) {%>
			<% field.checkField(player2, player1, card2); %>
			<img class="pawn" id="pawnBlue"/>
			<% }%>
			</th>
			<th class="blank"></th>
			<th class="blank" id="coin"> <% out.println("Wstawić licznik"); %> </th>
			<th class="blank"></th>
			<th class="town">
			<% if(position1 == 12) {%>
			<% field.checkField(player1, player2, card12); %>
			<img class="pawn" id="pawnOrange"/>
			<% }%>
			<% if(position2 == 12) {%>
			<% field.checkField(player2, player1, card12); %>
			<img class="pawn" id="pawnBlue"/>
			<% }%>
			</th>
		</tr>
		<tr>
			<th class="vill">
			<% if(position1 == 1) {%>
			<% field.checkField(player1, player2, card1); %>
			<img class="pawn" id="pawnOrange"/>
			<% }%>
			<% if(position2 == 1) {%>
			<% field.checkField(player2, player1, card1); %>
			<img class="pawn" id="pawnBlue"/>
			<% }%>
			</th>
			<th class="town">
			<% if(position1 == 16) {%>
			<% field.checkField(player1, player2, card16); %>
			<img class="pawn" id="pawnOrange"/>
			<% }%>
			<% if(position2 == 16) {%>
			<% field.checkField(player2, player1, card16); %>
			<img class="pawn" id="pawnBlue"/>
			<% }%>
			</th>
			<th class="town">
			<% if(position1 == 15) {%>
			<% field.checkField(player1, player2, card15); %>
			<img class="pawn" id="pawnOrange"/>
			<% }%>
			<% if(position2 == 15) {%>
			<% field.checkField(player2, player1, card15); %>
			<img class="pawn" id="pawnBlue"/>
			<% }%>
			</th>
			<th class="town">
			<% if(position1 == 14) {%>
			<% field.checkField(player1, player2, card14); %>
			<img class="pawn" id="pawnOrange"/>
			<% }%>
			<% if(position2 == 14) {%>
			<% field.checkField(player2, player1, card14); %>
			<img class="pawn" id="pawnBlue"/>
			<% }%>
			</th>
			<th class="town">
			<% if(position1 == 13) {%>
			<% field.checkField(player1, player2, card13); %>
			<img class="pawn" id="pawnOrange"/>
			<% }%>
			<% if(position2 == 13) {%>
			<% field.checkField(player2, player1, card13); %>
			<img class="pawn" id="pawnBlue"/>
			<% }%>
			</th>
		</tr>
	</table>
	</div>

	<div class="footer" align="center"> </br> I don't even know. </div>
	
</body>

</html>
