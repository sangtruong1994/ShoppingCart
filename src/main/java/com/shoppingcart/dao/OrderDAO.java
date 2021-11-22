package com.shoppingcart.dao;

import com.shoppingcart.model.CartInfo;
import com.shoppingcart.model.PaginationResult;

public interface OrderDAO {
	
	public void saveOrder(CartInfo cartInfo);
	
}
