package com.faulty.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.faulty.utils.ConnectionManager;

/**
 * Servlet implementation class UpdateReport
 */

public class UpdateReport extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateReport() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String status = request.getParameter("status");
		String rationale = request.getParameter("rationale");
		String[] args = utils.SplitRequestPath(request);
		String issueid = args[3];
		
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
				submitStmt.executeUpdate("UPDATE bugreport SET status = '" + status + "', rationale = '" + rationale + "' WHERE issueid = '" + issueid + "'");
				
				System.out.println(status + rationale + issueid);

				System.out.println("Updated! ..hopefully");
				conn.close();
				
				response.sendRedirect("/Mr_Faulty/Faulty/CurrentBugs/");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
