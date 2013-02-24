package com.faulty.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.jdbc.pool.DataSource;

import sun.net.ConnectionResetException;

import com.faulty.utils.*;
import com.mysql.jdbc.Statement;

/**
 * Servlet implementation class LoginServlet
 */

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		
		PrintWriter writer = response.getWriter();

		//**********************
		//CONNECTING TO DATABASE
		//**********************
		Connection conn = null;
		
		conn = ConnectionManager.getConnection();
		
		if (conn == null)
		{
			writer.println("Connection Failure");
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
					if (rs.getString("password") == Encryptor.Encrypt(password).trim())
					{
						writer.println("YUP");
					}
					else
					{
						writer.println("NOPE");
						writer.println("Expected = " + rs.getString("password"));
						writer.println("Actual = " + Encryptor.Encrypt(password));
					}
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}


