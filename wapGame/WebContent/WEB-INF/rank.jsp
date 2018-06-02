<%@ page import="game.Player"%>
<%@ page import="game.BoardField"%>
<%@ page import="game.Card"%>
<%@ page import="game.User"%>
<%@ page import="java.util.ArrayList"%>

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

	<a href="/Game"><div id="banner"></div></a>

	<table border=1>
		<tr>
			<th>Username</th>
			<th>Rank</th>
		</tr>

		<%
			ArrayList<User> rankList = (ArrayList<User>) session.getAttribute("rankList");
			for (User user : rankList) {
		%><tr>
			<td>
				<%
					user.getUsername();
				%>
			</td>
			<td>
				<%
					user.getRank();
				%>
			</td>
		</tr>
		<%
			}
		%>
	</table>








	<div class="footer" align="center">
		</br> I don't even know.
	</div>

</body>

</html>
