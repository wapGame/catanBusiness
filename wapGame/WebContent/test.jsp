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
}

.blank {
	background: none;
	border: none;
}

</style>

</head>
<body>

<%! Player player1 = new Player(1, 400); %>
<%int diceRoll1 = player1.RollDice(); %>
 
	<div id="banner">
	</div>

	<div id="main">
	<table class="table">
		<tr>
			<th id="5">x</th>
			<th id="6"></th>
			<th id="7"></th>
			<th id="8"></th>
			<th id="9"></th>
		</tr>
		<tr>
			<th id="4"></th>
			<th class="blank"></th>
			<th class="blank"></th>
			<th class="blank"></th>
			<th id="10"></th>
		</tr>
		<tr>
			<th id="3"></th>
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
			<th id="11"></th>
		</tr>
		<tr>
			<th id="2"></th>
			<th class="blank"></th>
			<th class="blank"></th>
			<th class="blank"></th>
			<th id="12"></th>
		</tr>
		<tr>
			<th id="1"></th>
			<th id="16"></th>
			<th id="15"></th>
			<th id="14"></th>
			<th id="13"></th>
		</tr>
	</table>
	</div>

	<div class="footer" align="center"> </br> I don't even know. </div>
</body>

</html>