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

import java.util.ArrayList;
import java.util.logging.Logger;

import oop.webApp.model.Item;

public interface IItemService {

	/** Initialise logger */
	public static final Logger log = Logger.getLogger(IItemService.class.getName());


	/**
	 * Add items for item table
	 * @param item
	 */
	public void addItem(Item item);

	/**
	 * Get a particular Item
	 * 
	 * @param empoyeeID
	 * @return Item
	 */
	public Item getItemByID(String itemID);
	
	/**
	 * Get all list of items
	 * 
	 * @return ArrayList<Item>
	 */
	public ArrayList<Item> getItems();
	
	/**
	 * Update existing item
	 * @param itemID
	 * @param item
	 * 
	 * @return
	 */
	public Item updateItem(String itemID, Item item);

	/**
	 * Remove existing item
	 * 
	 * @param itemID
	 */
	public void removeItem(String itemID);

}
