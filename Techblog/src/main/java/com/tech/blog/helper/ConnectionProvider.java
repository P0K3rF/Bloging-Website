package com.tech.blog.helper;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {
	private static Connection con;
	
	public static Connection getConn() {
		try {
			if(con==null) {
				//driver class loading
			Class.forName("com.mysql.cj.jdbc.Driver");
				//Create a connection
				con=DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog","root","khalil95944");
			}
		}catch(Exception e) {		
			e.printStackTrace();
		}
		return con;
	}

}
