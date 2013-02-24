package com.faulty.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FaultyServlet
 */
public class FaultyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FaultyController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		utils ut = new utils();
		String args[]=ut.SplitRequestPath(request);
		
		PrintWriter writer = response.getWriter();
		
		try{
			if(args.length == 1)
			{
				RequestDispatcher dispatcher =  request.getRequestDispatcher("frontpage.jsp");
				dispatcher.forward(request, response);
				return;
			}
			
/*			for(int i = 0; i<args.length; i++)
			{
				writer.println(args[i]);
			}*/

		}
		catch (Exception e)
		{
			writer.println("Exception");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
