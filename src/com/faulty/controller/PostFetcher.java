package com.faulty.controller;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

import com.faulty.model.bugreportbean;
import com.faulty.utils.ConnectionManager;

public class PostFetcher {

	public static LinkedList<bugreportbean> getAllPostSummaries()
	{
		//**********************
		//CONNECTING TO DATABASE
		//**********************
		Connection conn = null;
		
		conn = ConnectionManager.getConnection();
		
		if (conn == null)
		{
			System.out.println("Connection Failure");
			return null;
		}
		else
		{
		//**************************
		//END CONNECTING TO DATABASE
		//**************************
		
			java.sql.Statement stmt;
			
			try {
				stmt = conn.createStatement();

				System.out.println("going to execute query");
				ResultSet rs = stmt.executeQuery("select * from bugreport ORDER BY issueid DESC;");

				System.out.println("query done");
				LinkedList<bugreportbean> posts = new LinkedList<bugreportbean>();
				System.out.println("about to add stuff to the list");
				
				while(rs.next())
				{
					bugreportbean beanToAdd = new bugreportbean();
					
					beanToAdd.setIssueID(rs.getInt("issueid"));
					beanToAdd.setSummary(rs.getString("summary"));
					beanToAdd.setStatus(rs.getString("status"));
					beanToAdd.setRationale(rs.getString("rationale"));
					
					System.out.println("SHIT'S BEEN ADDED, 'YO");
					
					posts.add(beanToAdd);
				}
				
				conn.close();	
				return posts;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("query borked");
				e.printStackTrace();
			}
		}
		return null;
	}
}
