package com.faulty.utils;

import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionManager {
	
	static java.sql.Connection con;
	
	public static java.sql.Connection getConnection()
	{
		try
		{
			String url = "jdbc:mysql://arlia.computing.dundee.ac.uk/";
			String dbName = "frasersharp";
			String uname = "FraserSharp";
			String pwd = "ac31004";
			
			Class.forName("com.mysql.jdbc.Driver");
			try
			{
				con = DriverManager.getConnection(url+dbName,uname,pwd);
			}
			catch (SQLException ex)
			{
				ex.printStackTrace();
			}
		}
		catch(ClassNotFoundException e)
		{
			System.out.println(e);
		}
		return con;
	}

}
