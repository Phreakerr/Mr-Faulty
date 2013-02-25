package com.faulty.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.faulty.model.bugreportbean;
import com.faulty.utils.ConnectionManager;

/**
 * Servlet implementation class SubmitBugReport
 */
public class SubmitBugReport extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubmitBugReport() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		bugreportbean post = new bugreportbean();
		post.setSummary(request.getParameter("summary"));
		post.setFaultDetails(request.getParameter("details"));
		post.setExpectedResult(request.getParameter("expectedResult"));
		post.setActualResult(request.getParameter("actualResult"));
		post.setSubmitterUsername((String)session.getAttribute("username"));
		
		System.out.println("Passwords match");
		//**********************
		//CONNECTING TO DATABASE
		//**********************
		Connection conn = null;
		
		conn = ConnectionManager.getConnection();
		
		if (conn == null)
		{
			
		}
		else
		{
		//**************************
		//END CONNECTING TO DATABASE
		//**************************
			
			try {
				java.sql.Statement submitStmt;
				
				submitStmt = conn.createStatement();

				System.out.println("Inserting..");
				submitStmt.executeUpdate("INSERT INTO bugreport (summary, status, rationale, faultdetail, expectedresult, actualresult, submitter) VALUES ('" + post.getSummary() + "','" + "Pending" + "','" + "Open" + "','" + post.getFaultDetails() + "','" + post.getExpectedResult() + "','" + post.getActualResult() + "','" + post.getSubmitterUsername() + "')"  );

				System.out.println("Inserted! ..hopefully");
				conn.close();
				
				response.sendRedirect("/Mr_Faulty/Faulty/CurrentBugs/");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
