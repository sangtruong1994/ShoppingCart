package com.shoppingcart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.shoppingcart.dao.OrderDAO;
import com.shoppingcart.model.OrderInfo;
import com.shoppingcart.model.PaginationResult;

@Controller
public class AdminController {
	
	@Autowired
	private OrderDAO orderDAO;

	@RequestMapping({"/403"})
	public String accessDenied() {
		return "403";
	}
	
	@RequestMapping({"/"})
	public String home() {
		return "index";
	}
	
	//GET: hiển thị trang login
	@RequestMapping(value = {"/login"}, method = RequestMethod.GET)
	public String login(Model model) {
		return "login";
	}
	
	@RequestMapping(value = {"/accountInfo"}, method = RequestMethod.GET)
	public String accountInfo(Model model) {
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		System.out.println("Username: " + userDetails.getUsername());
		System.out.println("Password: " + userDetails.getPassword());
		System.out.println("Enable: " + userDetails.isEnabled());
		
		model.addAttribute("userDetails", userDetails);
		return "accountInfo";
	}
	
	@RequestMapping(value = {"/orderList"}, method = RequestMethod.GET)
	public String orderList(Model model, @RequestParam(value = "page", defaultValue = "1") String pageStr) {
		int page = 1;
		try {
			page = Integer.parseInt(pageStr);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		final int MAX_RESULT = 5;
		final int MAX_NAVIGATION_PAGE = 10;
		PaginationResult<OrderInfo> paginationOrderInfos = orderDAO.getAllOrderInfos(page, MAX_RESULT, MAX_NAVIGATION_PAGE);
		model.addAttribute("paginationOrderInfos", paginationOrderInfos);
		return "orderList";
	}
	
}
