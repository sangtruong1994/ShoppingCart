package com.shoppingcart.model;

import com.shoppingcart.entity.Account;

public class AccountInfo {

	private String username;

	private String password;

	private boolean active;

	private String userRole;

	public AccountInfo() {
		super();
	}

	public AccountInfo(Account account) {
		this.username = account.getUsername();
		this.password = account.getPassword();
		this.active = account.isActive();
		this.userRole = account.getUserRole();
	}

	public AccountInfo(String username, String password, boolean active, String userRole) {
		super();
		this.username = username;
		this.password = password;
		this.active = active;
		this.userRole = userRole;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public String getUserRole() {
		return userRole;
	}

	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}
}
