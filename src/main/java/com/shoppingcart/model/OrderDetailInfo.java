package com.shoppingcart.model;

public class OrderDetailInfo {
	
	private String id;
	
	private String productCode;
	
	private String productName;
	
	private int quatity;
	
	private double price;
	
	private double amount;

	//Using for Hibernate Query
	//Sử dụng cho Hibernate Query
	public OrderDetailInfo(String id, String productCode, String productName, int quatity, double price,
			double amount) {
		super();
		this.id = id;
		this.productCode = productCode;
		this.productName = productName;
		this.quatity = quatity;
		this.price = price;
		this.amount = amount;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getQuatity() {
		return quatity;
	}

	public void setQuatity(int quatity) {
		this.quatity = quatity;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}
	
	
}
