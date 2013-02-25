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
	<div class = "topBar">
		<a href="/Mr_Faulty/Faulty/">
		<p class = "textLogo">Mr Faulty</p>
		</a>
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
                    	LinkedList<bugreportbean> posts = PostFetcher.getPostsByUser((String)session.getAttribute("username"));
                    	bugreportbean post;
                    	
                    	for (int i = 0; i < posts.size(); i++)
                    	{
                    		post = posts.get(i);
                    	%>
                            <tr>
                            <td >
                            <a href="/Mr_Faulty/Faulty/Bug/<%= post.getIssueID() %>/">
                                #<%= post.getIssueID() %>
                            </a>
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