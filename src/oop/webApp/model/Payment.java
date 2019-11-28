package oop.webApp.model;

public class Payment {
	private String id;
	private String cardNo;
	private String cusName;
	private String expiryDate;
	private String cvv;
	private String email;
	private String amount;
	private String phone;
	
	public Payment() {
		
	}
	
	public Payment(String id, String cardNo, String cusName, String expiryDate, String cvv, String email, String amount,
			String phone) {
		super();
		this.id = id;
		this.cardNo = cardNo;
		this.cusName = cusName;
		this.expiryDate = expiryDate;
		this.cvv = cvv;
		this.email = email;
		this.amount = amount;
		this.phone = phone;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String paymentID) {
		this.id = paymentID;
	}
	public String getCardNo() {
		return cardNo;
	}
	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}
	public String getCusName() {
		return cusName;
	}
	public void setCusName(String cusName) {
		this.cusName = cusName;
	}
	public String getExpiryDate() {
		return expiryDate;
	}
	public void setExpiryDate(String expiryDate) {
		this.expiryDate = expiryDate;
	}
	public String getCvv() {
		return cvv;
	}
	public void setCvv(String cvv) {
		this.cvv = cvv;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Override
	public String toString() {
		return "Payment [id=" + id + ", cardNo=" + cardNo + ", cusName=" + cusName + ", expiryDate=" + expiryDate
				+ ", cvv=" + cvv + ", email=" + email + ", amount=" + amount + ", phone=" + phone + "]";
	}
	
}
