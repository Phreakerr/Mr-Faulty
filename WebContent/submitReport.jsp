<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="com.faulty.model.*" %>
<%@ page import="com.faulty.controller.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% try
{if (session.getAttribute("username").equals("") || session.getAttribute("username") == null || session == null)
{
	String redirectURL = "/Mr_Faulty/Faulty/";
    response.sendRedirect(redirectURL);
}
} catch (Exception e) {
	String redirectURL = "/Mr_Faulty/Faulty/";
    response.sendRedirect(redirectURL);
}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="/Mr_Faulty/stylesheet.css" type="text/css">
<link href='http://fonts.googleapis.com/css?family=Rationale|Roboto|Roboto+Condensed:400,300' rel='stylesheet' type='text/css'>
<title>Mr Faulty - Submit Bug Report</title>
</head>
<body>
	<div class = "topBar">
		<p class = "textLogo">Mr Faulty</p>
		<form action="/Mr_Faulty/Faulty/Logout/">
		<input type="submit" class = "button" value="Sign out">
		</form>
		
		<p class = "loggedInText">Logged in as <strong><%= session.getAttribute("username")%></strong></p>
	</div>

	<div class = "sidebar">
		<img class = "sidebarLogo" src = "/Mr_Faulty/faulty logo.png">
		<hr />
		<a href="/Mr_Faulty/Faulty/CurrentBugs/">
		<p class = "sidebarText"> All Current Bugs </p>
		</a>
		<hr />
		<a href="/Mr_Faulty/Faulty/MyBugs/">
		<p class = "sidebarText"> My Submitted Bugs </p>
		</a>
		<hr />
		
		<a href="/Mr_Faulty/Faulty/SubmitReport/">
		<p class = "sidebarText"> Submit Bug Report </p>
		</a>
		<hr />
	</div>
	
	<div class = "mainPage">
		<h1 class = "mainPageHeader">
		Submit Bug Report:
		</h1>
		<br />
		<hr />

		<form action="/Mr_Faulty/Faulty/SubmittingReport/" method="post">
		<table class = "regForm">
		<tr>
		<td>
		<p class="blackBodyText">Summary of fault: </p>
		</td>
		<td>
		<input type = "text" name = "summary" class ="rounded">
		</td>
		</tr>
		
		<tr>
		<td>
		<p class="blackBodyText">Details of fault: </p>
		</td>
		<td>
		<input type = "text" name = "details" class ="rounded">
		</td>
		</tr>
		
		<tr>
		<td>
		<p class="blackBodyText">Expected result: </p>
		</td>
		<td>
		<input type = "text" name = "expectedResult" class ="rounded">
		</td>
		<td>
		</tr>
				
		<tr>
		<td>
		<p class="blackBodyText">Actual result: </p>
		</td>
		<td>
		<input type = "text" name = "actualResult" class ="rounded">
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