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

import oop.webApp.model.Payment;
import oop.webApp.util.CommonConstants;
import oop.webApp.util.CommonUtil;
import oop.webApp.util.DBConnectionUtil;
import oop.webApp.util.QueryUtil;

public class PaymentServiceImpl implements IPaymentService {

	public static final Logger log = Logger.getLogger(PaymentServiceImpl.class.getName());

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
			statement.execute(QueryUtil.queryByID(CommonConstants.QUERY_ID_CREATE_TABLE4));

		} catch (SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException e) {
			log.log(Level.SEVERE, e.getMessage());
		}
	}
	
	@Override
	public void addPayment(Payment payment) {
		
		String paymentID = CommonUtil.generateIDs(getPaymentIDs());
		
		try {
			connection = DBConnectionUtil.getDBConnection();
			
			preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_INSERT_PAYMENT));
			connection.setAutoCommit(false);
			
			payment.setId(paymentID);
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, payment.getId());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_TWO, payment.getCardNo());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_THREE, payment.getCusName());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_FOUR, payment.getExpiryDate());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_FIVE, payment.getCvv());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_SIX, payment.getEmail());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_SEVEN, payment.getAmount());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_EIGHT, payment.getPhone());
			
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
	public Payment getPaymentByID(String paymentID) {
		return actionOnPayments(paymentID).get(0);
	}

	@Override
	public ArrayList<Payment> getPayment() {
		return actionOnPayments(null);
	}
	
	@Override
	public void removePayment(String paymentID) {
		if (paymentID != null && !paymentID.isEmpty()) {
			try {
				connection = DBConnectionUtil.getDBConnection();
				preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_REMOVE_PAYMENT));
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, paymentID);
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
	
	private ArrayList<Payment> actionOnPayments(String paymentID) {

		ArrayList<Payment> paymentList = new ArrayList<Payment>();
		try {
			connection = DBConnectionUtil.getDBConnection();
			if (paymentID != null && !paymentID.isEmpty()) {
			
				preparedStatement = connection
						.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_GET_PAYMENT));
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, paymentID);
			}
			else {
				preparedStatement = connection
						.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_ALL_PAYMENTS));
			}
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				Payment payment = new Payment();
				
				payment.setId(resultSet.getString(CommonConstants.COLUMN_INDEX_ONE));
				payment.setCardNo(resultSet.getString(CommonConstants.COLUMN_INDEX_TWO));
				payment.setCusName(resultSet.getString(CommonConstants.COLUMN_INDEX_THREE));
				payment.setExpiryDate(resultSet.getString(CommonConstants.COLUMN_INDEX_FOUR));
				payment.setCvv(resultSet.getString(CommonConstants.COLUMN_INDEX_FIVE));
				payment.setEmail(resultSet.getString(CommonConstants.COLUMN_INDEX_SIX));
				payment.setAmount(resultSet.getString(CommonConstants.COLUMN_INDEX_SEVEN));
				payment.setPhone(resultSet.getString(CommonConstants.COLUMN_INDEX_EIGHT));
				
				paymentList.add(payment);
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
		return paymentList;
	}
	
	public Payment updatePayment(String paymentID, Payment payment) {

		if (paymentID != null && !paymentID.isEmpty()) {
			try {
				connection = DBConnectionUtil.getDBConnection();
				preparedStatement = connection
						.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_UPDATE_PAYMENT));
				
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, payment.getId());
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_TWO, payment.getCardNo());
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_THREE, payment.getCusName());
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_FOUR, payment.getExpiryDate());
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_FIVE, payment.getCvv());
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_SIX, payment.getEmail());
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_SEVEN, payment.getAmount());
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_EIGHT, payment.getPhone());
				
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
		return getPaymentByID(paymentID);
	}
	
	private ArrayList<String> getPaymentIDs(){
		
		ArrayList<String> arrayList = new ArrayList<String>();
		try {
			connection = DBConnectionUtil.getDBConnection();
			preparedStatement = connection
					.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_GET_PAYMENT_IDS));
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
