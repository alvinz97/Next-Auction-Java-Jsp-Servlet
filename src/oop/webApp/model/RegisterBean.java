package oop.webApp.model;

public class RegisterBean {
	private String uId;
	private String uName;
	private String uMail;
	private String uPass;
	private String uR_Pass;
	
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public String getuMail() {
		return uMail;
	}
	public void setuMail(String uMail) {
		this.uMail = uMail;
	}
	public String getuPass() {
		return uPass;
	}
	public void setuPass(String uPass) {
		this.uPass = uPass;
	}
	public String getuR_Pass() {
		return uR_Pass;
	}
	public void setuR_Pass(String uR_Pass) {
		this.uR_Pass = uR_Pass;
	}
	@Override
	public String toString() {
		return "RegisterBean [uId=" + uId + ", uName=" + uName + ", uMail=" + uMail + ", uPass=" + uPass + ", uR_Pass="
				+ uR_Pass + "]";
	}
	

}
