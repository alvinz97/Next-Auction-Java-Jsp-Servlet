package oop.webApp.service;

import java.util.ArrayList;

import oop.webApp.model.RegisterBean;

public interface IRegisterService {
	
	void addUser(RegisterBean userID);
	
	public RegisterBean getUserByID(String userID);
	
	public ArrayList<RegisterBean> getuUser();
	
	public RegisterBean updateUser(String userID, RegisterBean registerBean);
	
	public void removeUser(String userID);

}
