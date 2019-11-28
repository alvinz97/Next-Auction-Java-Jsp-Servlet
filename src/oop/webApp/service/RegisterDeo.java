//package oop.webApp.service;
//
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.SQLException;
//
//import oop.webApp.model.RegisterBean;
//import oop.webApp.util.DBConnectionUtil;
//
//public class RegisterDeo {
//	
//	public String registerUser(RegisterBean registerBean) throws ClassNotFoundException {
////		String uId = registerBean.getuId();
//		String uName = registerBean.getuName();
//		String uMail = registerBean.getuMail();
//		String uPass = registerBean.getuPass();
//		String uR_Pass = registerBean.getuR_Pass();
//		
//		Connection connection = null;
//		PreparedStatement preparedStatement = null;
//		
//		try {
//			connection = DBConnectionUtil.getDBConnection();
////			String sql = "INSERT INTO user(id, uName, uMail, uPass, uR_Pass) VALUES (NULL,? , ? , PASSWORD(?) , PASSWORD(?))";
//			String sql = "INSERT INTO user(uId, uName, uMail, uPass, uR_Pass) VALUES (NULL, ? , ? , ? , ?)";
//			preparedStatement = connection.prepareStatement(sql);
//			preparedStatement.setString(1, uName);
//			preparedStatement.setString(2, uMail);
//			preparedStatement.setString(3, uPass);
//			preparedStatement.setString(4, uR_Pass);
//			
//			if (uName == "" || uName == null) {
//				return "Username Cannot Be Empty";
//			}else if (uMail == "" || uMail == null) {
//				return "Email Address Cannot Be Empty!";
//			}else if (uPass == "" || uPass == null) {
//				return "Password Cannot Be Empty!";	
//			}else if (uR_Pass == "" || uR_Pass == null)  {
//				return "Confirm Password Cannot Be Empty!";	
//			}else {
//				if (uPass.equals(uR_Pass)) {
//					int i = preparedStatement.executeUpdate();
//					if (i != 0) {
//						System.out.println("Added");
//						return "SUCCESS";
//					}
//				}else {
//					return "Password and Confirm Password aren't MATCH!";
//				}
//			}
//		}catch (SQLException e) {
//			e.printStackTrace();
//		}
//		return "Something Wrong";
//	}
//}