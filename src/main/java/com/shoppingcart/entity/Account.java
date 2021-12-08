package com.shoppingcart.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Id;

@Entity
@Table(name = "Account")
public class Account implements Serializable {

	private static final long serialVersionUID = 1L;

	public static final String ROLE_MANAGER = "MANAGER";
	public static final String ROLE_EMPLOYEE = "EMPLOYEE";

	@Id
	@Column(name = "User_Name", length = 20, nullable = false)
	private String username;

	@Column(name = "Password", nullable = false)
	private String password;

	@Column(name = "Active", length = 1, nullable = false)
	private boolean active;

	@Column(name = "User_Role", length = 20, nullable = false)
	private String userRole;

	public String getUsername() {
		return username;
	}

	public void setUsername(String userName) {
		this.username = userName;
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
