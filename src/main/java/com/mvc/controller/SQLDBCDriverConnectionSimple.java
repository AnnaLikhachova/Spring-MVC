package com.mvc.controller;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class SQLDBCDriverConnectionSimple{
	
	public Connection setConnect() {
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost/figures?";
			String login = "root";
			String password = "anna20";
			conn = DriverManager.getConnection(url,login,password);
		} catch (SQLException | ClassNotFoundException e) {
			System.out.println(e.getMessage());
			System.out.println("EEEEERRROR");
		} 
		return conn;
	}


}