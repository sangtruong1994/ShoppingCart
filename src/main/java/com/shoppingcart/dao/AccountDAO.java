package com.shoppingcart.dao;

import com.shoppingcart.entity.Account;
import com.shoppingcart.model.AccountInfo;
import com.shoppingcart.model.PaginationResult;

public interface AccountDAO {

	public Account getAccountByUserName(String userName);

	public PaginationResult<AccountInfo> getAllAccountInfos(int page, int maxResult, int maxNavigationPage);

	public void saveAccountInfo(AccountInfo accountInfo);

	public boolean removeAccountByUsername(String username);
}
