package oop.webApp.service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import oop.webApp.model.LoginBean;

import java.sql.Connection;
import java.sql.DriverManager;

public class LoginDea {
	
	public boolean validate(LoginBean loginBean) throws ClassNotFoundException {
		boolean status = false;
		String url = "jdbc:mysql://localhost:3306/mydb";
		String username = "root";
		String password = "root";
		
		Class.forName("com.mysql.jdbc.Driver");
		
		try (Connection connection = DriverManager.getConnection(url, username, password);
				// Step 2:Create a statement using connection object
//				String sql = "SELECT * FROM user WHERE uName = ? AND uPass = ?";
				PreparedStatement preStmt = connection.prepareStatement("SELECT * FROM user WHERE uName = ? AND uPass = ?" )) {
				preStmt.setString(1, loginBean.getuName());
				preStmt.setString(2, loginBean.getuPass());
				
				System.out.println(preStmt);
				
				ResultSet resultSet = preStmt.executeQuery();
				status = resultSet.next();
			
		} catch (SQLException e) {
			e.printStackTrace();
			printSQLException(e);
		}
		return status;
	}
	
	private void printSQLException(SQLException ex) {
		for (Throwable e: ex ) {
			if (e instanceof SQLException) {
				e.printStackTrace(System.err);
				System.err.println("SQLState: " + ((SQLException) e).getSQLState());
				System.err.println("Error Code : " + ((SQLException) e).getErrorCode());
				System.err.println("Message : " + e.getMessage());
				Throwable t = ex.getCause();
				
				while (t != null) {
					System.out.println("Causse: " + t);
					t = t.getCause();
				}
			}
		}
	}
}
