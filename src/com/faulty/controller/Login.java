package com.faulty.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.faulty.utils.*;

/**
 * Servlet implementation class LoginServlet
 */

public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		

		//**********************
		//CONNECTING TO DATABASE
		//**********************
		Connection conn = null;
		
		conn = ConnectionManager.getConnection();
		
		if (conn == null)
		{
			System.out.println("Connection Failure");
		}
		else
		{
		//**************************
		//END CONNECTING TO DATABASE
		//**************************
			
			java.sql.Statement stmt;
			
			try {
				stmt = conn.createStatement();
				
				ResultSet rs = stmt.executeQuery("select * from users where username = \"" + userName + "\";");
				
				while(rs.next())
				{
					if (rs.getString("password").equalsIgnoreCase(Encryptor.Encrypt(password)))
					{
						HttpSession session = request.getSession();
						
						session.setAttribute("username", rs.getString("username"));
						session.setAttribute("isadmin", rs.getBoolean("isadmin"));
						
						response.sendRedirect("/Mr_Faulty/Faulty/CurrentBugs/");
					}
					else
					{
						response.sendRedirect("/Mr_Faulty/Faulty/");
					}
				}
				
			conn.close();	
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}


