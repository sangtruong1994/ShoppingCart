package com.shoppingcart.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.shoppingcart.dao.AccountDAO;
import com.shoppingcart.entity.Account;
import com.shoppingcart.model.AccountInfo;
import com.shoppingcart.model.CustomerInfo;

@Component
public class AccountInfoValidator implements Validator{
	
	@Autowired
	private AccountDAO accountDAO;
	private Account accountDB;

	public boolean supports(Class<?> clazz) {
		return CustomerInfo.class.isAssignableFrom(clazz);
	}

	public void validate(Object target, Errors errors) {
		AccountInfo accountInfo = (AccountInfo) target;

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", "NotEmpty.accountForm.username");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "NotEmpty.accountForm.password");

		String username = accountInfo.getUsername();
		accountDB = accountDAO.getAccountByUserName(username);
		if(username.equals(accountDB.getUsername())) {
			errors.rejectValue("username", "Duplicate.accountForm.username");
		}
		
	}
	
}
