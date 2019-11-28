package oop.webApp.model;

import java.io.Serializable;

public class LoginBean implements Serializable {

	private static final long serialVersionUID = 1L;
	private String uName;
	private String uPass;
	
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public String getuPass() {
		return uPass;
	}
	public void setuPass(String uPass) {
		this.uPass = uPass;
	}
	
	@Override
	public String toString() {
		return "LoginBean [uName=" + uName + ", uPass=" + uPass + "]";
	}
	
	
}
