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
<title>Mr Faulty - Current Bugs</title>
</head>
<body>
	<%
		String[] args = utils.SplitRequestPath(request);
	
	%>
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
	
	<%
	bugreportbean bug = PostFetcher.getBugDetails(Integer.parseInt(args[3]));
	
	if(bug != null)
	{
	%>
	
	<div class = "mainPage">
		<h1 class = "mainPageHeader">
		Bug Report #<%=args[3] %>:
		</h1>
		<br />
		<hr />
		
		<table>
		
		<tr>
		<td>
		<p class="blackBodyText"><strong>Bug ID:</strong></p>
		</td>
		<td>
		<p class="blackBodyText"><%= bug.getIssueID() %></p>
		</td>
		</tr>
		
		<tr>
		<td>
		<p class="blackBodyText"><strong>Summary:</strong></p>
		</td>
		<td>
		<p class="blackBodyText"><%= bug.getSummary() %></p>
		</td>
		</tr>
		
		<tr>
		<td>
		<p class="blackBodyText"><strong>Status:</strong></p>
		</td>
		<td>
		<p class="blackBodyText"><%= bug.getStatus() %></p>
		</td>
		</tr>
		
		<tr>
		<td>
		<p class="blackBodyText"><strong>Rationale:</strong></p>
		</td>
		<td>
		<p class="blackBodyText"><%= bug.getRationale() %></p>
		</td>
		</tr>
		
		<tr>
		<td>
		<p class="blackBodyText"><strong>Details of Fault:</strong></p>
		</td>
		<td>
		<p class="blackBodyText"><%= bug.getFaultDetails() %></p>
		</td>
		</tr>
		
		<tr>
		<td>
		<p class="blackBodyText"><strong>Expected Result:</strong></p>
		</td>
		<td>
		<p class="blackBodyText"><%= bug.getExpectedResult() %></p>
		</td>
		</tr>
		
		<tr>
		<td>
		<p class="blackBodyText"><strong>Actual Result:</strong></p>
		</td>
		<td>
		<p class="blackBodyText"><%= bug.getActualResult() %></p>
		</td>
		</tr>
		
		<tr>
		<td>
		<p class="blackBodyText"><strong>Submitter:</strong></p>
		</td>
		<td>
		<p class="blackBodyText"><%= bug.getSubmitterUsername() %></p>
		</td>
		</tr>
		
		</table>
	</div>
	<%} %>
</body>
</html>