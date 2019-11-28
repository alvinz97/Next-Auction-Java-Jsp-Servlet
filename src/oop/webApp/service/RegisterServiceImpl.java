package oop.webApp.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.xml.parsers.ParserConfigurationException;

import org.xml.sax.SAXException;

import oop.webApp.model.RegisterBean;
import oop.webApp.util.CommonConstants;
import oop.webApp.util.CommonUtil;
import oop.webApp.util.DBConnectionUtil;
import oop.webApp.util.QueryUtil;

public class RegisterServiceImpl implements IRegisterService {
	
	public static final Logger log = Logger.getLogger(ItemServiceImpl.class.getName());

	private static Connection connection;

	private static Statement statement;
	
	static{
		//create table or drop if exist
		createUserTable();
	}
	
	private PreparedStatement preparedStatement;
	
	public static void createUserTable() {

		try {
			connection = DBConnectionUtil.getDBConnection();
			statement = connection.createStatement();
			statement.executeUpdate(QueryUtil.queryByID(CommonConstants.QUERY_ID_DROP_TABLE));

			statement.executeUpdate(QueryUtil.queryByID(CommonConstants.QUERY_ID_CREATE_TABLE3));

		} catch (SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException e) {
			log.log(Level.SEVERE, e.getMessage());
		}
	}

	@Override
	public void addUser(RegisterBean registerBean) {
		
		String userID = CommonUtil.generateIDs(getUserIDs());
		
		try {
			connection = DBConnectionUtil.getDBConnection();
			
			preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_INSERT_USERS));
			connection.setAutoCommit(false);
			
			registerBean.setuId(userID);
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, registerBean.getuId());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_TWO, registerBean.getuName());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_THREE, registerBean.getuMail());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_FOUR, registerBean.getuPass());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_FIVE, registerBean.getuR_Pass());
			
			preparedStatement.execute();
			connection.commit();
		}catch (SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException e) {
			log.log(Level.SEVERE, e.getMessage());
		} finally {
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				log.log(Level.SEVERE, e.getMessage());
			}
		}

	}

	@Override
	public RegisterBean getUserByID(String userID) {
		return actionOnUser(userID).get(0);
	}

	@Override
	public ArrayList<RegisterBean> getuUser() {
		return actionOnUser(null);
	}

	@Override
	public void removeUser(String userID) {
		if (userID != null && !userID.isEmpty()) {
			try {
				connection = DBConnectionUtil.getDBConnection();
				preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_REMOVE_USER));
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, userID);
				preparedStatement.executeUpdate();
			} catch (SQLException | SAXException | IOException | ParserConfigurationException
					| ClassNotFoundException e) {
				log.log(Level.SEVERE, e.getMessage());
			} finally {
				/*
				 * Close prepared statement and database connectivity at the end
				 * of transaction
				 */
				try {
					if (preparedStatement != null) {
						preparedStatement.close();
					}
					if (connection != null) {
						connection.close();
					}
				} catch (SQLException e) {
					log.log(Level.SEVERE, e.getMessage());
				}
			}
		}
	}		

	private ArrayList<RegisterBean> actionOnUser(String userID) {

		ArrayList<RegisterBean> userList = new ArrayList<RegisterBean>();
		try {
			connection = DBConnectionUtil.getDBConnection();
			if (userID != null && !userID.isEmpty()) {
			
				preparedStatement = connection
						.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_GET_USER));
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, userID);
			}
			else {
				preparedStatement = connection
						.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_ALL_USERS));
			}
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				RegisterBean registerBean = new RegisterBean();
				
				registerBean.setuId(resultSet.getString(CommonConstants.COLUMN_INDEX_ONE));
				registerBean.setuName(resultSet.getString(CommonConstants.COLUMN_INDEX_TWO));
				registerBean.setuMail(resultSet.getString(CommonConstants.COLUMN_INDEX_THREE));
				registerBean.setuPass(resultSet.getString(CommonConstants.COLUMN_INDEX_FOUR));
				registerBean.setuR_Pass(resultSet.getString(CommonConstants.COLUMN_INDEX_FIVE));
				
				userList.add(registerBean);
			}
		} catch (SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException e) {
			log.log(Level.SEVERE, e.getMessage());
		} finally {
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				log.log(Level.SEVERE, e.getMessage());
			}
		}
		return userList;
	}

	@Override
	public RegisterBean updateUser(String userID, RegisterBean registerBean) {

		if (userID != null && !userID.isEmpty()) {
			try {
				connection = DBConnectionUtil.getDBConnection();
				preparedStatement = connection
						.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_UPDATE_USER));
				
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, registerBean.getuId());
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_TWO, registerBean.getuName());
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_THREE, registerBean.getuMail());
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_FOUR, registerBean.getuPass());
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_FIVE, registerBean.getuR_Pass());
				
				preparedStatement.executeUpdate();

			} catch (SQLException | SAXException | IOException | ParserConfigurationException
					| ClassNotFoundException e) {
				log.log(Level.SEVERE, e.getMessage());
			} finally {
				try {
					if (preparedStatement != null) {
						preparedStatement.close();
					}
					if (connection != null) {
						connection.close();
					}
				} catch (SQLException e) {
					log.log(Level.SEVERE, e.getMessage());
				}
			}
		}
		return getUserByID(userID);
	}

	private ArrayList<String> getUserIDs(){
		
		ArrayList<String> arrayList = new ArrayList<String>();
		try {
			connection = DBConnectionUtil.getDBConnection();
			preparedStatement = connection
					.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_GET_USER_IDS));
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				arrayList.add(resultSet.getString(CommonConstants.COLUMN_INDEX_ONE));
			}
		} catch (SQLException | SAXException | IOException | ParserConfigurationException
				| ClassNotFoundException e) {
			log.log(Level.SEVERE, e.getMessage());
		} finally {
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				log.log(Level.SEVERE, e.getMessage());
			}
		}
		return arrayList;
	}
}

