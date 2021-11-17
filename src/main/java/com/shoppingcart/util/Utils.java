package com.shoppingcart.util;

import javax.servlet.http.HttpServletRequest;

import com.shoppingcart.model.CartInfo;

public class Utils {
	
	//thông tin mua hàng
	public static CartInfo getCartInfoInSession(HttpServletRequest request) {
		// thông tin giỏ hàng dã lưu vào trong session trước đó
		CartInfo cartInfo = (CartInfo) request.getSession().getAttribute("myCartInfo");
		//nếu chưa tạo giỏ hàng thì tạo mới
		if(cartInfo == null) {
			cartInfo = new CartInfo();
			//lưu vào trong session
			request.getSession().setAttribute("myCartInfo", cartInfo);
		}
		return cartInfo;
	}
	
	public static void removeCartInfoInSession(HttpServletRequest request) {
		request.getSession().removeAttribute("myCartInfo");
	}
	
	public static void storeLastOrderedCartInfoInSession(HttpServletRequest request, CartInfo cartInfo) {
		request.getSession().setAttribute("lastOrderedCartInfo", cartInfo);
	}
	 
	public static CartInfo getLastOrderedCartInfoInSession(HttpServletRequest request) {
		return (CartInfo) request.getSession().getAttribute("lastOrderedCartInfo");
	}
}
