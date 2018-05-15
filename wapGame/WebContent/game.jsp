<%@ page import="game.Player"%>
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
	opacity: 0.9;
	width:1000px;
	height:1000px;
}

th {
   background: url(media/block_bg.png) top center;
   background-size:cover;
   border: 1px solid black;
   width: 200px;
   height: 200px;
   position: rlative;
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
}
	
	#pawnOrange {
		content:url(media/pawn1.png);
		margin-left: auto;
	}
	
	#pawnBlue {
		content:url(media/pawn2.png);
		margin-right: auto;
	}

</style>

</head>
<body>

<%! Player player1 = new Player(1, 400); %>
<% int diceRoll1 = player1.RollDice(); %>
<% int position1 = player1.WhatSpot(diceRoll1);%>
<% out.println(position1); %>

<%! Player player2 = new Player(2, 250); %>
<% int diceRoll2 = player2.RollDice(); %>
<% int position2 = player2.WhatSpot(diceRoll2); %>
<% out.println(position2); %>

 
	<div id="banner">
	</div>

	<div id="main">
	<table class="table">
		<tr>
			<th>
			<% if(position1 == 5) {%>
			<img class="pawn" id="pawnOrange"/>
			<% }%>
			<% if(position2 == 5) {%>
			<img class="pawn" id="pawnBlue"/>
			<% }%>
			</th>
			<th>
			<% if(position1 == 6) {%>
			<img class="pawn" id="pawnOrange"/>
			<% }%>
			<% if(position2 == 6) {%>
			<img class="pawn" id="pawnBlue"/>
			<% }%>
			</th>
			<th>
			<% if(position1 == 7) {%>
			<img class="pawn" id="pawnOrange"/>
			<% }%>
			<% if(position2 == 7) {%>
			<img class="pawn" id="pawnBlue"/>
			<% }%>
			</th>
			<th>
			<% if(position1 == 8) {%>
			<img class="pawn" id="pawnOrange"/>
			<% }%>
			<% if(position2 == 8) {%>
			<img class="pawn" id="pawnBlue"/>
			<% }%>
			</th>
			<th>
			<% if(position1 == 9) {%>
			<img class="pawn" id="pawnOrange"/>
			<% }%>
			<% if(position2 == 9) {%>
			<img class="pawn" id="pawnBlue"/>
			<% }%>
			</th>
		</tr>
		<tr>
			<th>
			<% if(position1 == 4) {%>
			<img class="pawn" id="pawnOrange"/>
			<% }%>
			<% if(position2 == 4) {%>
			<img class="pawn" id="pawnBlue"/>
			<% }%>
			</th>
			<th class="blank"></th>
			<th class="blank"></th>
			<th class="blank"></th>
			<th>
			<% if(position1 == 10) {%>
			<img class="pawn" id="pawnOrange"/>
			<% }%>
			<% if(position2 == 10) {%>
			<img class="pawn" id="pawnBlue"/>
			<% }%>
			</th>
		</tr>
		<tr>
			<th>
			<% if(position1 == 3) {%>
			<img class="pawn" id="pawnOrange"/>
			<% }%>
			<% if(position2 == 3) {%>
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
			<th>
			<% if(position1 == 11) {%>
			<img class="pawn" id="pawnOrange"/>
			<% }%>
			<% if(position2 == 11) {%>
			<img class="pawn" id="pawnBlue"/>
			<% }%>
			</th>
		</tr>
		<tr>
			<th>
			<% if(position1 == 2) {%>
			<img class="pawn" id="pawnOrange"/>
			<% }%>
			<% if(position2 == 2) {%>
			<img class="pawn" id="pawnBlue"/>
			<% }%>
			</th>
			<th class="blank"></th>
			<th class="blank"></th>
			<th class="blank"></th>
			<th>
			<% if(position1 == 12) {%>
			<img class="pawn" id="pawnOrange"/>
			<% }%>
			<% if(position2 == 12) {%>
			<img class="pawn" id="pawnBlue"/>
			<% }%>
			</th>
		</tr>
		<tr>
			<th>
			<% if(position1 == 1) {%>
			<img class="pawn" id="pawnOrange"/>
			<% }%>
			<% if(position2 == 1) {%>
			<img class="pawn" id="pawnBlue"/>
			<% }%>
			</th>
			<th>
			<% if(position1 == 16) {%>
			<img class="pawn" id="pawnOrange"/>
			<% }%>
			<% if(position2 == 16) {%>
			<img class="pawn" id="pawnBlue"/>
			<% }%>
			</th>
			<th>
			<% if(position1 == 15) {%>
			<img class="pawn" id="pawnOrange"/>
			<% }%>
			<% if(position2 == 15) {%>
			<img class="pawn" id="pawnBlue"/>
			<% }%>
			</th>
			<th>
			<% if(position1 == 14) {%>
			<img class="pawn" id="pawnOrange"/>
			<% }%>
			<% if(position2 == 14) {%>
			<img class="pawn" id="pawnBlue"/>
			<% }%>
			</th>
			<th>
			<% if(position1 == 13) {%>
			<img class="pawn" id="pawnOrange"/>
			<% }%>
			<% if(position2 == 13) {%>
			<img class="pawn" id="pawnBlue"/>
			<% }%>
			</th>
		</tr>
	</table>
	</div>

	<div class="footer" align="center"> </br> I don't even know. </div>
</body>

</html>
