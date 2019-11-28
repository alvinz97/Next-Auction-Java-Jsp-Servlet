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

import oop.webApp.model.Category;
import oop.webApp.util.CommonConstants;
import oop.webApp.util.CommonUtil;
import oop.webApp.util.DBConnectionUtil;
import oop.webApp.util.QueryUtil;

public class CategoryServiceImpl implements ICategoryService {

	/** Initialise logger */
	public static final Logger log = Logger.getLogger(ItemServiceImpl.class.getName());

	private static Connection connection;

	private static Statement statement;
	
	static{
		//create table or drop if exist
		createItemTable();
	}
	
	private PreparedStatement preparedStatement;
	
	public static void createItemTable() {

		try {
			connection = DBConnectionUtil.getDBConnection();
			statement = connection.createStatement();
			// Drop table if already exists and as per SQL query available in
			// Query.xml
			statement.executeUpdate(QueryUtil.queryByID(CommonConstants.QUERY_ID_DROP_TABLE));
			// Create new items table as per SQL query available in
			// Query.xml
			statement.executeUpdate(QueryUtil.queryByID(CommonConstants.QUERY_ID_CREATE_TABLE2));

		} catch (SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException e) {
			log.log(Level.SEVERE, e.getMessage());
		}
	}
	
	@Override
	public void addCategory(Category category) {
		
		String categoryID = CommonUtil.generateIDs(getCategoryIDs());
		
		try {
			connection = DBConnectionUtil.getDBConnection();
			
			preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_INSERT_CATEGORYS));
			connection.setAutoCommit(false);
			
			category.setCatNo(categoryID);
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, category.getCatNo());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_TWO, category.getCatName());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_THREE, category.getSubName());
			
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
	public Category getCategoryByID(String categoryID) {
		return actionOnCategory(categoryID).get(0);
	}

	@Override
	public ArrayList<Category> getCategory() {
		return actionOnCategory(null);
	}

	@Override
	public void removeCategory(String categoryID) {
		if (categoryID != null && !categoryID.isEmpty()) {
			try {
				connection = DBConnectionUtil.getDBConnection();
				preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_REMOVE_CATEGORY));
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, categoryID);
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
	
	private ArrayList<Category> actionOnCategory(String categoryID) {

		ArrayList<Category> categoryList = new ArrayList<Category>();
		try {
			connection = DBConnectionUtil.getDBConnection();
			if (categoryID != null && !categoryID.isEmpty()) {
			
				preparedStatement = connection
						.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_GET_CATEGORY));
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, categoryID);
			}
			else {
				preparedStatement = connection
						.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_ALL_CATEGORYS));
			}
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				Category category = new Category();
				
				category.setCatNo(resultSet.getString(CommonConstants.COLUMN_INDEX_ONE));
				category.setCatName(resultSet.getString(CommonConstants.COLUMN_INDEX_TWO));
				category.setSubName(resultSet.getString(CommonConstants.COLUMN_INDEX_THREE));
				
				categoryList.add(category);
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
		return categoryList;
	}
	
	@Override
	public Category updateCategory(String categoryID, Category category) {

		if (categoryID != null && !categoryID.isEmpty()) {
			try {
				connection = DBConnectionUtil.getDBConnection();
				preparedStatement = connection
						.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_UPDATE_CATEGORY));
				
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, category.getCatNo());
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_TWO, category.getCatName());
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_THREE, category.getSubName());
				
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
		return getCategoryByID(categoryID);
	}
	
	private ArrayList<String> getCategoryIDs(){
		
		ArrayList<String> arrayList = new ArrayList<String>();
		try {
			connection = DBConnectionUtil.getDBConnection();
			preparedStatement = connection
					.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_GET_CATEGORY_IDS));
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
