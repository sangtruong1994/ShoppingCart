package com.shoppingcart.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.shoppingcart.dao.AccountDAO;
import com.shoppingcart.dao.OrderDAO;
import com.shoppingcart.dao.ProductDAO;
import com.shoppingcart.entity.Account;
import com.shoppingcart.entity.Product;
import com.shoppingcart.model.AccountInfo;
import com.shoppingcart.model.OrderDetailInfo;
import com.shoppingcart.model.OrderInfo;
import com.shoppingcart.model.PaginationResult;
import com.shoppingcart.model.ProductInfo;
import com.shoppingcart.validator.AccountInfoValidator;
import com.shoppingcart.validator.ProductValidator;

@Controller
public class AdminController {

	@Autowired
	private OrderDAO orderDAO;

	@Autowired
	private ProductDAO productDAO;

	@Autowired
	private ProductValidator productValidator;

	// newly added
	@Autowired
	private AccountDAO accountDAO;

	// newly added
	@Autowired
	private AccountInfoValidator accountInfoValidator;

	@RequestMapping({ "/403" })
	public String accessDenied() {
		return "403";
	}

	@RequestMapping({ "/" })
	public String home() {
		return "index";
	}

	@RequestMapping(value = { "/login" }, method = RequestMethod.GET)
	public String login(Model model) {
		return "login";
	}

	@RequestMapping(value = { "/accountInfo" }, method = RequestMethod.GET)
	public String accountInfo(Model model) {
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		System.out.println("Username: " + userDetails.getUsername());
		System.out.println("Password: " + userDetails.getPassword());
		System.out.println("Enable: " + userDetails.isEnabled());

		model.addAttribute("userDetails", userDetails);
		return "accountInfo";
	}

	@RequestMapping(value = { "/orderList" }, method = RequestMethod.GET)
	public String orderList(Model model, @RequestParam(value = "page", defaultValue = "1") String pageStr) {
		int page = 1;
		try {
			page = Integer.parseInt(pageStr);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		final int MAX_RESULT = 15;
		final int MAX_NAVIGATION_PAGE = 10;
		PaginationResult<OrderInfo> paginationOrderInfos = orderDAO.getAllOrderInfos(page, MAX_RESULT,
				MAX_NAVIGATION_PAGE);
		model.addAttribute("paginationOrderInfos", paginationOrderInfos);
		return "orderList";
	}

	@RequestMapping(value = { "/order" }, method = RequestMethod.GET)
	public String orderView(Model model, @RequestParam("orderId") String orderId) {
		OrderInfo orderInfo = null;
		if (orderId != null) {
			orderInfo = orderDAO.getOrderInfoById(orderId);
		}
		if (orderInfo == null) {
			return "redirect:/orderList";
		}

		List<OrderDetailInfo> orderDetailInfos = orderDAO.getAllDetailInfos(orderId);
		orderInfo.setOrderDetailInfos(orderDetailInfos);
		model.addAttribute("orderInfo", orderInfo);
		return "order";
	}

	@RequestMapping(value = { "/product" }, method = RequestMethod.GET)
	public String product(Model model, @RequestParam(value = "code", defaultValue = "") String code) {
		ProductInfo productInfo = null;
		if (code != null && code.length() > 0) {
			productInfo = productDAO.getProductInfoByCode(code);
		}
		if (productInfo == null) {
			productInfo = new ProductInfo();
			productInfo.setNewProduct(true);
		}
		model.addAttribute("productForm", productInfo);
		return "product";
	}

	@RequestMapping(value = { "/product" }, method = RequestMethod.POST)
	public String productSave(Model model, @ModelAttribute("productForm") @Validated ProductInfo productInfo,
			BindingResult result) {
		productValidator.validate(productInfo, result);
		if (result.hasErrors()) {
			return "product";
		}
		try {
			productDAO.saveProductInfo(productInfo);
		} catch (Exception e) {
			model.addAttribute("errorMessage", e.getMessage());
			return "product";
		}
		return "redirect:/productList";
	}

	@RequestMapping(value = { "/accountList" }, method = RequestMethod.GET)
	public String accountList(Model model, @RequestParam(value = "page", defaultValue = "1") String pageStr) {
		int page = 1;
		try {
			page = Integer.parseInt(pageStr);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		final int MAX_RESULT = 5;
		final int MAX_NAVIGATION_PAGE = 10;
		PaginationResult<AccountInfo> paginationAccountInfos = accountDAO.getAllAccountInfos(page, MAX_RESULT,
				MAX_NAVIGATION_PAGE);
		model.addAttribute("paginationAccountInfos", paginationAccountInfos);
		return "accountList";
	}

	@RequestMapping(value = { "/account" }, method = RequestMethod.GET)
	public String account(Model model, @RequestParam(value = "username", defaultValue = "") String username) {
		Account account = null;
		if (username != null) {
			account = accountDAO.getAccountByUserName(username);
		}
		if (account == null) {
			account = new Account();
		}
		model.addAttribute("accountForm", account);
		return "account";
	}

	@RequestMapping(value = { "/account" }, method = RequestMethod.POST)
	public String productSave(Model model, @ModelAttribute("accountForm") @Validated AccountInfo accountInfo,
			BindingResult result) {
		accountInfoValidator.validate(accountInfo, result);
		if (result.hasErrors()) {
			return "account";
		}
		try {
			accountDAO.saveAccountInfo(accountInfo);
		} catch (Exception e) {
			model.addAttribute("errorMessage", e.getMessage());
			return "account";
		}
		return "redirect:/accountList";
	}

	@RequestMapping({ "/removeAccount" })
	public String removeAccountHandler(HttpServletRequest request, Model model,
			@RequestParam(value = "username", defaultValue = "") String username) {
		Account account = null;

		if (username != null) {
			account = accountDAO.getAccountByUserName(username);
		}

		if (account != null) {
			accountDAO.removeAccountByUsername(username);
		}
		return "redirect:/accountList";
	}

	@RequestMapping({ "/removeProduct" })
	public String removeProductHandler(HttpServletRequest request, Model model,
			@RequestParam(value = "code", defaultValue = "") String code) {
		Product product = null;

		if (code != null) {
			product = productDAO.getProductByCode(code);
		}

		if (product != null) {
			productDAO.removeProductByCode(code);
		}
		return "redirect:/productList";
	}
}
