<%@ page import="game.Player"%>
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

.blank {
	background: none;
	border: none;
	left: 95px;
}

#menu {
	width: 100%;
	height: 50px;
}

#submenu {
	margin: auto;
	width: 48%;
}

.table {
	background: url(media/table_bg.png) top center;
	background-size: cover;
	color: white;
	border: 2px solid black;
	width:1000px;
}

th {
	border: 2px solid black;
}

.sides {
	width: 20%;
}

.middle {
	width: 60%;
}
</style>

</head>
<body>

	<a href="/Game"><div id="banner"></div></a>

	<div id="menu">
		<div id="submenu">
			<form action="Game" method="post">
				<button type="sumbit">Play</button>
			</form>

		</div>
	</div>

	<div id="main">
		<table class="table">
			<tr>
				<th class="sides">Place</th>
				<th class="middle">Username</th>
				<th class="sides">Wins</th>
			</tr>

			<%
				ArrayList<User> rankList = (ArrayList<User>) request.getAttribute("rankList");
				if (rankList == null || rankList.isEmpty()) {
			%><tr>
				<td>Pusto</td>
				<td>Pusto</td>
			</tr>
			<%
				} else {
					int i = 1;
					for (User user : rankList) {
			%><tr>
				<td class="sides"><%=i%></td>
				<td class="middle"><%=user.getUsername()%></td>
				<td class="sides"><%=user.getRank()%></td>
			</tr>
			<%
				++i;
					}
				}
			%>
		</table>
	</div>

	<div class="footer" align="center">
		</br> I don't even know.
	</div>
</body>

</html>
