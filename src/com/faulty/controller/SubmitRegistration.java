package com.faulty.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.faulty.utils.ConnectionManager;
import com.faulty.utils.Encryptor;

/**
 * Servlet implementation class SubmitRegistration
 */
public class SubmitRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubmitRegistration() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Starting");
		String userName = request.getParameter("username");
		String password1 = request.getParameter("password1");
		String password2 = request.getParameter("password2");

		System.out.println("Got post data.  Starting encryption");
		String encryptedpass1 = Encryptor.Encrypt(password1);
		String encryptedpass2 = Encryptor.Encrypt(password2);
		
		if(encryptedpass1.equalsIgnoreCase(encryptedpass2))
		{
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

				System.out.println("Connection successful");
				java.sql.Statement checkStmt;
				
				try {
					checkStmt = conn.createStatement();
					
					ResultSet rs = checkStmt.executeQuery("SELECT * FROM users WHERE username = \"" + userName + "\"");
					
					if(!rs.next())
					{
						System.out.println("Username is available");
						java.sql.Statement submitStmt;
						
						try {
							submitStmt = conn.createStatement();

							System.out.println("Inserting..");
							submitStmt.executeUpdate("INSERT INTO users VALUES ('" + userName + "','" + encryptedpass1 + "',false)" );

							System.out.println("Inserted! ..hopefully");
							conn.close();
							
							response.sendRedirect("/Mr_Faulty/Faulty/");
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}

					}
					else
					{
						System.out.println("Username taken.");
						response.sendRedirect("/Mr_Faulty/Faulty/");
					}
	
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		else
		{
			System.out.println("Passwords don't match.");
			System.out.println(encryptedpass1);
			System.out.println(encryptedpass2);
			response.sendRedirect("/Mr_Faulty/Faulty/Registration/");
		}
	}
}
