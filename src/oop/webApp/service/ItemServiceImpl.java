/**
 * OOP 2018
 * 
 * @author Udara Samaratunge  Department of Software Engineering, SLIIT 
 * 
 * @version 1.0
 * Copyright: SLIIT, All rights reserved
 * 
 */
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

import oop.webApp.model.Item;
import oop.webApp.util.CommonConstants;
import oop.webApp.util.CommonUtil;
import oop.webApp.util.DBConnectionUtil;
import oop.webApp.util.QueryUtil;

public class ItemServiceImpl implements IItemService {

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
			statement.executeUpdate(QueryUtil.queryByID(CommonConstants.QUERY_ID_CREATE_TABLE));

		} catch (SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException e) {
			log.log(Level.SEVERE, e.getMessage());
		}
	}

	@Override
	public void addItem(Item item) {

		String itemID = CommonUtil.generateIDs(getItemIDs());
		
		try {
			connection = DBConnectionUtil.getDBConnection();
			/*
			 * Query is available in ItemQuery.xml file and use
			 * insert_item key to extract value of it
			 */
			preparedStatement = connection
					.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_INSERT_ITEMS));
			connection.setAutoCommit(false);
			
			//Generate item IDs
			item.setItemNo(itemID);
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, item.getItemNo());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_TWO, item.getTitle());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_THREE, item.getCategory());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_FOUR, item.getCondition());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_FIVE, item.getBrand());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_SIX, item.getColor());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_SEVEN, item.getStartDate());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_EIGHT, item.getEndDate());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_NINE, item.getStartPrice());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_TEN, item.getBuyPrice());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_ELEVEN, item.getReservePrice());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_TWELVE, item.getDesc());
			// Add item
			preparedStatement.execute();
			connection.commit();

		} catch (SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException e) {
			log.log(Level.SEVERE, e.getMessage());
		} finally {
			/*
			 * Close prepared statement and database connectivity at the end of
			 * transaction
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

	@Override
	public Item getItemByID(String itemID) {

		return actionOnItem(itemID).get(0);
	}

	@Override
	public ArrayList<Item> getItems() {
		
		return actionOnItem(null);
	}

	@Override
	public void removeItem(String itemID) {

		// Before deleting check whether item ID is available
		if (itemID != null && !itemID.isEmpty()) {
			/*
			 * Remove item query will be retrieved from ItemQuery.xml
			 */
			try {
				connection = DBConnectionUtil.getDBConnection();
				preparedStatement = connection
						.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_REMOVE_ITEM));
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, itemID);
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

	private ArrayList<Item> actionOnItem(String itemID) {

		ArrayList<Item> itemList = new ArrayList<Item>();
		try {
			connection = DBConnectionUtil.getDBConnection();
			/*
			 * Before fetching item it checks whether item ID is
			 * available
			 */
			if (itemID != null && !itemID.isEmpty()) {
				/*
				 * Get item by ID query will be retrieved from
				 * ItemQuery.xml
				 */
				preparedStatement = connection
						.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_GET_ITEM));
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, itemID);
			}
			/*
			 * If item ID is not provided for get item option it display
			 * all items
			 */
			else {
				preparedStatement = connection
						.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_ALL_ITEMS));
			}
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				Item item = new Item();
				item.setItemNo(resultSet.getString(CommonConstants.COLUMN_INDEX_ONE));
				item.setTitle(resultSet.getString(CommonConstants.COLUMN_INDEX_TWO));
				item.setCategory(resultSet.getString(CommonConstants.COLUMN_INDEX_THREE));
				item.setCondition(resultSet.getString(CommonConstants.COLUMN_INDEX_FOUR));
				item.setBrand(resultSet.getString(CommonConstants.COLUMN_INDEX_FIVE));
				item.setColor(resultSet.getString(CommonConstants.COLUMN_INDEX_SIX));
				item.setStartDate(resultSet.getString(CommonConstants.COLUMN_INDEX_SEVEN));
				item.setEndDate(resultSet.getString(CommonConstants.COLUMN_INDEX_EIGHT));
				item.setStartPrice(resultSet.getString(CommonConstants.COLUMN_INDEX_NINE));
				item.setBuyPrice(resultSet.getString(CommonConstants.COLUMN_INDEX_TEN));
				item.setReservePrice(resultSet.getString(CommonConstants.COLUMN_INDEX_ELEVEN));
				item.setDesc(resultSet.getString(CommonConstants.COLUMN_INDEX_TWELVE));
				itemList.add(item);
			}
		} catch (SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException e) {
			log.log(Level.SEVERE, e.getMessage());
		} finally {
			/*
			 * Close prepared statement and database connectivity at the end of
			 * transaction
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
		return itemList;
	}
	@Override
	public Item updateItem(String itemID, Item item) {

		/*
		 * Before fetching item it checks whether item ID is available
		 */
		if (itemID != null && !itemID.isEmpty()) {
			/*
			 * Update item query will be retrieved from ItemQuery.xml
			 */
			try {
				connection = DBConnectionUtil.getDBConnection();
				preparedStatement = connection
						.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_UPDATE_ITEM));
				
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, item.getTitle());
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_TWO, item.getCategory());
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_THREE, item.getCondition());
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_FOUR, item.getBrand());
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_FIVE, item.getColor());
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_SIX, item.getStartDate());
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_SEVEN, item.getEndDate());
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_EIGHT, item.getStartPrice());
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_NINE, item.getBuyPrice());
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_TEN, item.getReservePrice());
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_ELEVEN, item.getDesc());

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
		// Get the updated item
		return getItemByID(itemID);
	}
	
	private ArrayList<String> getItemIDs(){
		
		ArrayList<String> arrayList = new ArrayList<String>();
		/*
		 * List of item IDs will be retrieved from ItemQuery.xml
		 */
		try {
			connection = DBConnectionUtil.getDBConnection();
			preparedStatement = connection
					.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_GET_ITEM_IDS));
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				arrayList.add(resultSet.getString(CommonConstants.COLUMN_INDEX_ONE));
			}
		} catch (SQLException | SAXException | IOException | ParserConfigurationException
				| ClassNotFoundException e) {
			log.log(Level.SEVERE, e.getMessage());
		} finally {
			/*
			 * Close prepared statement and database connectivity at the end of
			 * transaction
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
		return arrayList;
	}
}
