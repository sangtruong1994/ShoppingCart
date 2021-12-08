<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Shopping Cart</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css" />
</head>
<body>
	<jsp:include page="_header.jsp" />
	<fmt:setLocale value="en_US" scope="session" />
	
	<section class="shop_section layout_padding">
		<div class="container" >
			<div class="heading_container heading_center">
				<h2>My Cart</h2>
			</div>
			<c:if test="${empty cartForm or empty cartForm.cartLineInfos }">
				<h3>There is no items in Cart</h3>
				<a href="${contextPath}/productList">Show Product List</a>
			</c:if>
			
			<c:if test="${not empty cartForm and not empty cartForm.cartLineInfos }">
				<form:form method="POST" modelAttribute="cartForm" action="${contextPath}/shoppingCart">
					<c:forEach items="${cartForm.cartLineInfos }" var="cartLineInfo" varStatus="varStatus">
						<div class="row" style="display: inline-block; margin-left: 180px;">
							<div class="col-sm-6 col-xl-3" >
								<div class="box" style="width: 250px; height: auto;">
									<ul style="list-style-type: none;">
										<li><img style="width: 120px; height: 80px;" src="${contextPath}/productImage?code=${cartLineInfo.productInfo.code}"/>
										<li>Code: ${cartLineInfo.productInfo.code}
											<form:hidden path="cartLineInfos[${varStatus.index }].productInfo.code"/>
										</li>
										<li>Name: ${cartLineInfo.productInfo.name}</li>
										<li>Price: 
											<span class="price">
												<fmt:formatNumber value="${cartLineInfo.productInfo.price}" type="currency"></fmt:formatNumber>
											</span>
										</li>
										<li>Quantity
											<form:input path="cartLineInfos[${varStatus.index}].quantity" />
										</li>
										<li>Subtotal:
											<span class="subtotal">
											<fmt:formatNumber value="${cartLineInfo.amount }" type="currency"></fmt:formatNumber>
											</span>
										</li>
										<li>
											<a style="color: red;" href="${contextPath}/shoppingCartRemoveProduct?code=${cartLineInfo.productInfo.code}">Delete</a>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</c:forEach>
					<div class="box" style="width: 500px; height: auto; text-align: center; margin-left: 340px; font-size: 20px">
						<input style="border-radius: 10px; color: white; background-color: blue;" type="submit" value="Update Quantity">
						<a style="padding-left: 20px; color: green;" class="navi-item" href="${contextPath}/shoppingCartCustomer"> Enter Customer</a>
						<a style="padding-left: 20px; color: blue;" class="navi-item" href="${contextPath}/productList">Continue Buy </a>
					</div>
				</form:form>
			</c:if>
		</div>
	</section>
	
	<div style="margin-bottom: 480px;"></div>
	
	<jsp:include page="_footer.jsp" />
</body>
</html>