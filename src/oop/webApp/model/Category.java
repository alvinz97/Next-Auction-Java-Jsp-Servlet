package oop.webApp.model;

public class Category {
	
	private String catNo;
	private String catName;
	private String subName;
	
	public String getCatNo() {
		return catNo;
	}
	public void setCatNo(String catNo) {
		this.catNo = catNo;
	}
	public String getCatName() {
		return catName;
	}
	public void setCatName(String catName) {
		this.catName = catName;
	}
	public String getSubName() {
		return subName;
	}
	public void setSubName(String subName) {
		this.subName = subName;
	}
	@Override
	public String toString() {
		return "Category [catNo=" + catNo + ", catName=" + catName + ", subName=" + subName + "]";
	}
}
