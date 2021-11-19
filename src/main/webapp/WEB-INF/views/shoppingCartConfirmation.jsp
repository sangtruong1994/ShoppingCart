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
<style type="text/css">
  <%@include file="css/styles.css" %> 
</style>
</head>
<body>
	<jsp:include page="_header.jsp" />
	
	<jsp:include page="_menu.jsp" />
	
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
		
		<!-- Edit Cart -->
		<a class="navi-item" href="${contextPath}/shoppingCart">Edit Cart</a>
		
		<!-- Edit Customer -->
		<a class="navi-item" href="${contextPath}/shoppingCartCustomer">Edit Customer Info</a>
		
		<!-- Edit Customer -->
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
	
	<jsp:include page="_footer.jsp" />
</body>
</html>