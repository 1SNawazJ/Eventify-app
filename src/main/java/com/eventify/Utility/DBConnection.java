package com.eventify.Utility;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
  public static Connection getConnection() {
	  Connection con = null;
	  try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		try {
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventify_db","root","root");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	  return con;
	  
  }
}
