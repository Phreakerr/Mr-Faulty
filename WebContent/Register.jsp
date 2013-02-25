<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="../../stylesheet.css" type="text/css">
<link href='http://fonts.googleapis.com/css?family=Rationale|Roboto|Roboto+Condensed:400,300' rel='stylesheet' type='text/css'>
<title>Mr Faulty - Register</title>
</head>
<body>
	<div class = "topBar">
		<p class = "textLogo">Mr Faulty</p>
	</div>

	<div class = "sidebar">
		<img class = "sidebarLogo" src = "/Mr_Faulty/faulty logo.png">
		<hr />
		<a href="/Mr_Faulty/Faulty/" class = "sidebarText"><p class = "sidebarText">Back to Home</p></a>
		<hr />
	</div>
	
	<div class = "mainPage">
		<h1 class = "mainPageHeader">Register new Account:</h1>
		<br />
		<hr />
		
		<form action="/Mr_Faulty/Faulty/SubmitRegistration/" method="post">
		<table class = "regForm">
		<tr>
		<td>
		<p class="blackBodyText">Username:</p>
		</td>
		<td>
		<input type = "text" name = "username" class ="rounded">
		</td>
		</tr>
		
		<tr>
		<td>
		<p class="blackBodyText">Password:</p>
		</td>
		<td>
		<input type = "password" name = "password1" class ="rounded">
		</td>
		</tr>
		
		<tr>
		<td>
		<p class="blackBodyText">Confirm password:</p>
		</td>
		<td>
		<input type = "password" name = "password2" class ="rounded">
		</td>
		<td>
		<button type = "submit" class = "button" style='float:left'> Submit </button>
		</td>
		</tr>
		
		</table>
		
		</form>
	</div>
</body>
</html>