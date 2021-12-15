<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Shopping Cart Conformation</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css" />
</head>
<body>
	<jsp:include page="_header.jsp" />
	
	<section class="shop_section layout_padding">
		<div class="container">
			<div class="heading_container heading_center">
				<h2>Confirmation</h2>
			</div>
			<h3>Customer Information</h3>
			<ul>
				<li>Name: ${myCartInfo.customerInfo.name}</li>
				<li>Email: ${myCartInfo.customerInfo.email}</li>
				<li>Phone: ${myCartInfo.customerInfo.phone}</li>
				<li>Address: ${myCartInfo.customerInfo.address}</li>
			</ul>
			<h3>Cart Summary</h3>
			<ul>
				<li>Quantity: ${myCartInfo.quantityTotal}</li>
				<li>Total: <span class="total">
					<fmt:formatNumber value="${myCartInfo.amountTotal}" type="currency">
					</fmt:formatNumber></span>
				</li>
			</ul>
			<form method="POST" action="${contextPath}/shoppingCartConfirmation">
				<a style="margin-right: 15px; color: #CC0000; font-size: 20px;" href="${contextPath}/shoppingCart">Edit Cart</a>
				<a style="margin-right: 15px; color: blue; font-size: 20px;" class="navi-item" href="${contextPath}/shoppingCartCustomer">Edit Customer Info</a>
				<button style="font-size: 20px; border-radius: 15px; background-color: #009900; color: white;" type="submit" value="Send">Send</button>				
			</form>
			<c:forEach items="${myCartInfo.cartLineInfos }" var="cartLineInfo">
				<div class="row" style="display: inline-block;">
					<div class="col-md-6 ">
						<div class="box" style="width: 220px; height: auto;">
							<ul style="list-style-type: none;">
								<li><img style="width: 120px; height: 80px;" class="product-image" src="${contextPath}/productImage?code=${cartLineInfo.productInfo.code}"></li>
								<li>Code: ${cartLineInfo.productInfo.code}
									<input type="hidden" name="code" value="${cartLineInfo.productInfo.code}"/>
								</li>
								<li>Name: ${cartLineInfo.productInfo.name}</li>
								<li>Price:
									<span class="price">
										<fmt:formatNumber value="${cartLineInfo.productInfo.price}" type="currency"></fmt:formatNumber>
									</span>
								</li>
								<li>Quantity: ${cartLineInfo.quantity}</li>
								<li>Subtotal: 
									<span class="subtotal">
										<fmt:formatNumber value="${cartLineInfo.amount}" type="currency"></fmt:formatNumber>
									</span>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</c:forEach>			
		</div>
	</section>
	
	<!-- 
	<fmt:setLocale value="en_US" scope="session" />
	
	<div class="page-tile">Confirmation</div>
	
	<div class="customer-info-container">
		<h3>Customer Information</h3>
		<ul>
			<li>Name: ${myCartInfo.customerInfo.name}</li>
			<li>Email: ${myCartInfo.customerInfo.email}</li>
			<li>Phone: ${myCartInfo.customerInfo.phone}</li>
			<li>Address: ${myCartInfo.customerInfo.address}</li>
		</ul>
		<h3>Cart Summary</h3>
		<ul>
			<li>Quantity: ${myCartInfo.quantityTotal}</li>
			<li>Total: <span class="total">
				<fmt:formatNumber value="${myCartInfo.amountTotal}" type="currency">
				</fmt:formatNumber></span>
			</li>
		</ul>
	</div>
	
	<form method="POST" action="${contextPath}/shoppingCartConfirmation">
		
		
		<a class="navi-item" href="${contextPath}/shoppingCart">Edit Cart</a>
		
		
		<a class="navi-item" href="${contextPath}/shoppingCartCustomer">Edit Customer Info</a>
		
		
		<input type="submit" value="Send" class="button-send-sc"/>
	</form>
	
	<div class="container">
		<c:forEach items="${myCartInfo.cartLineInfos }" var="cartLineInfo">
			<div class="product-priview-container">
				<ul>
					<li><img class="product-image" src="${contextPath}/productImage?code=${cartLineInfo.productInfo.code}"></li>
					<li>Code: ${cartLineInfo.productInfo.code}
						<input type="hidden" name="code" value="${cartLineInfo.productInfo.code}"/>
					</li>
					<li>Name: ${cartLineInfo.productInfo.name}</li>
					<li>Price:
						<span class="price">
						<fmt:formatNumber value="${cartLineInfo.productInfo.price}" type="currency"></fmt:formatNumber>
						</span>
					</li>
					<li>Quantity: ${cartLineInfo.quantity}</li>
					<li>Subtotal: 
						<span class="subtotal">
							<fmt:formatNumber value="${cartLineInfo.amount}"></fmt:formatNumber>
						</span>
					</li>
				</ul>
			</div>
		</c:forEach>
	</div>
	 -->
	
	<jsp:include page="_footer.jsp" />
</body>
</html>