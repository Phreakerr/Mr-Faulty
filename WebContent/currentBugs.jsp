<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="WebContent/stylesheet.css" type="text/css">
<link href='http://fonts.googleapis.com/css?family=Rationale|Roboto|Roboto+Condensed:400,300' rel='stylesheet' type='text/css'>
<title>Mr Faulty - Current Bugs</title>
</head>
<body>
	<div class = "topBar">
		<p class = "textLogo">Mr Faulty</p>
		<button class = "button">Sign out</button>
		<p class = "loggedInText">Logged in as <strong>Fraser</strong></p>
	</div>

	<div class = "sidebar">
		<img class = "sidebarLogo" src = "faulty logo.png">
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
                    <tr>
                        <td >
                            #1039
                        </td>
                        <td>
                            Hello world doesn't work
                        </td>
                        <td>
                            In Testing
                        </td>
                        <td>
                        	Fixed
                      	</td>
					</tr>
					<tr>
                        <td >
                            #2013
                        </td>
                        <td>
                            Memory leaking all over the floor
                        </td>
                        <td>
                            In Progress
                        </td>
                        <td>
                        	Open
                      	</td>
					</tr>
                    <tr>
                        <td >
                            #3011
                        </td>
                        <td>
                            Everything appears upside-down
                        </td>
                        <td>
                            Closed
                        </td>
                        <td>
                        	Could not Reproduce
                      	</td>
                    <tr>
                        <td >
                            #1039
                        </td>
                        <td>
                            Hello world doesn't work
                        </td>
                        <td>
                            In Testing
                        </td>
                        <td>
                        	Fixed
                      	</td>
					</tr>
					<tr>
                        <td >
                            #2013
                        </td>
                        <td>
                            Memory leaking all over the floor
                        </td>
                        <td>
                            In Progress
                        </td>
                        <td>
                        	Open
                      	</td>
					</tr>
                    <tr>
                        <td >
                            #3011
                        </td>
                        <td>
                            Everything appears upside-down
                        </td>
                        <td>
                            Closed
                        </td>
                        <td>
                        	Could not Reproduce
                      	</td>
					</tr>
                </table>
		</div>
	</div>
</body>
</html>