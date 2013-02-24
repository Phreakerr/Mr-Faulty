package com.faulty.controller;

import java.net.URLDecoder;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;

public class utils {

	//********************************************************
	// BEGIN CODE TAKEN FROM ANDY COBLEY, UNIVERISTY OF DUNDEE
	//********************************************************
	
	public static String[] SplitRequestPath(HttpServletRequest request){
		String args[] = null;
		 
			
		StringTokenizer st = SplitString(request.getRequestURI());
		args = new String[st.countTokens()];
		//Lets assume the number is the last argument
		
		int argv=0;
		while (st.hasMoreTokens ()) {;
			args[argv]=new String();
						
			args[argv]=st.nextToken();
			try{
				System.out.println("String was "+URLDecoder.decode(args[argv],"UTF-8") + " argv "+argv);
				args[argv]=URLDecoder.decode(args[argv],"UTF-8");
				
			}catch(Exception et){
				System.out.println("Bad URL Encoding"+args[argv]);
			}
			argv++;
			} 

	//so now they'll be in the args array.  
	// argv[0] should be the user directory
	
		return args;
		}
		
	  private static StringTokenizer SplitString(String str){
	  		return new StringTokenizer (str,"/");

	  }

	//******************************************************
	// END CODE TAKEN FROM ANDY COBLEY, UNIVERISTY OF DUNDEE
	//******************************************************

}
