<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="../stylesheet.css" type="text/css">
<link href='http://fonts.googleapis.com/css?family=Rationale|Roboto|Roboto+Condensed:400,300' rel='stylesheet' type='text/css'>
<title>Mr Faulty</title>
</head>
<body>
	<div class = "background">
		<div class = "topBar">
			<p class = "textLogo">Mr Faulty</p>
			<form action="Login" method="post">
				<button type="submit" class = "button">Sign in</button>
				<input type="password" name = "password" class= "rounded" placeholder="Password">
				<input type="text" name="username" class= "rounded" placeholder="Username">
			</form>
		</div>
		
 		<div class = "homePageStripe">
 			<div style = "margin-left:auto;margin-right:auto;width:60%;min-width:900px">
	 			<div style = "float:left; width:600px">
					<h1 class = "homePageTitle">Mr Faulty</h1>
					<h2 class = "homePageSubtitle">Bug Tracking and Reporting System</h2>
				</div>		
	
				<img class = "homePageLogo" src = "../faulty logo.png">

			</div>
		</div>
	</div>
</body>
</html>