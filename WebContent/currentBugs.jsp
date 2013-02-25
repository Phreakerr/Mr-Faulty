<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="com.faulty.model.*" %>
<%@ page import="com.faulty.controller.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% //HttpSession session = request.getSession(); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="/Mr_Faulty/stylesheet.css" type="text/css">
<link href='http://fonts.googleapis.com/css?family=Rationale|Roboto|Roboto+Condensed:400,300' rel='stylesheet' type='text/css'>
<title>Mr Faulty - Current Bugs</title>
</head>
<body>
	<div class = "topBar">
		<p class = "textLogo">Mr Faulty</p>
		<button class = "button" onclick="/Mr_Faulty/Faulty/Logout/">Sign out</button>
		<p class = "loggedInText">Logged in as <strong><%= session.getAttribute("username")%></strong></p>
	</div>

	<div class = "sidebar">
		<img class = "sidebarLogo" src = "/Mr_Faulty/faulty logo.png">
		<hr />
		<p class = "sidebarText"> All Current Bugs </p>
		<hr />
		<p class = "sidebarText"> My Submitted Bugs </p>
		<hr />
		<p class = "sidebarText"> Submit Bug Report </p>
		<hr />
	</div>
	
	<div class = "mainPage">
		<h1 class = "mainPageHeader">
		Current Bugs:
		</h1>
		<br />
		<hr />
		<div class = "BugTable">
			                <table >
                    <tr>
                        <td>
                            Issue ID
                        </td>
                        <td >
                            Summary
                        </td>
                        <td>
							Status
                        </td>
                        <td>
							Rationale
                        </td>
                    </tr>
                    
                    <%
                    	LinkedList<bugreportbean> posts = PostFetcher.getAllPostSummaries();
                    	bugreportbean post;
                    	
                    	for (int i = 0; i < posts.size(); i++)
                    	{
                    		post = posts.get(i);
                    	%>
                            <tr>
                            <td >
                                #<%= post.getIssueID() %>
                            </td>
                            <td>
                                <%= post.getSummary() %>
                            </td>
                            <td>
                                <%= post.getStatus() %>
                            </td>
                            <td>
                                <%= post.getRationale() %>
                          	</td>
    					</tr>
    					
                    	<% }
                    %>
                </table>
		</div>
	</div>
</body>
</html>