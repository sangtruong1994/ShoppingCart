<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Product List</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css" />
</head>
<body>
	<jsp:include page="_header.jsp" />
	<fmt:setLocale value="en_US" scope="session" />
	
	<section class="shop_section layout_padding">
		<div class="container" >
			<div class="heading_container heading_center">
				<h2>Product List</h2>
			</div>
			
			<c:forEach items="${paginationProductInfos.list}" var="productInfo">
				<div class="row" style="display: inline-block;">
					<div class="col-sm-6 col-xl-3" >
						<div class="box" style="width: 220px; height: auto;">
							<ul style="list-style-type: none;">
								<li>
									<img style="width: 120px; height: 80px;" src="${contextPath}/productImage?code=${productInfo.code}" />
								</li>
								<li>Code: ${productInfo.code}</li>
								<li>Name: ${productInfo.name}</li>
								<li>Price: 
									<fmt:formatNumber value="${productInfo.price}" type="currency" />
								</li>
								<li>
									<a style="color: green;" href="${contextPath}/buyProduct?code=${productInfo.code}">Buy Now</a>
								</li>
								<security:authorize access="hasRole('ROLE_MANAGER')">
									<li>
										<a style="color: red;"href="${contextPath}/product?code=${productInfo.code}">Edit Product</a>
									</li>
								</security:authorize>
							</ul>
						</div>
					</div>
				</div>
			</c:forEach>					
		</div>
	</section>
	
	<br />
	<c:if test="${paginationProductInfos.totalPages > 1}">
		<div style="text-align:center;">
			<c:forEach items="${paginationProductInfos.navigationPages}" var="page">
				<c:if test="${page != -1}">
					<a style="font-size: 30px;" href="productList?page=${page}">${page}</a>
				</c:if>
				<c:if test="${page == -1}">
					<span class="nav-item"> ... </span>
				</c:if>
			</c:forEach>
		</div>
	</c:if>
	
	<jsp:include page="_footer.jsp" />
	
	<!-- 
	<div class="page-title">Product List</div>
	<c:forEach items="${paginationProductInfos.list}" var="productInfo">
		<div class="product-preview-container">
			<ul>
				<li>
				<img class="product-image" src="${contextPath}/productImage?code=${productInfo.code}" />
				</li>
				<li>Code: ${productInfo.code}</li>
				<li>Name: ${productInfo.name}</li>
				<li>Price: 
					<fmt:formatNumber value="${productInfo.price}" type="currency" />
				</li>
				<li>
					<a href="${contextPath}/buyProduct?code=${productInfo.code}">Buy Now</a>
				</li>

				 For Manager edit Product 
				<security:authorize access="hasRole('ROLE_MANAGER')">
					<li>
						<a style="color: red;"href="${contextPath}/product?code=${productInfo.code}">Edit Product</a>
					</li>
				</security:authorize>
			</ul>
		</div>
	</c:forEach>
	
	<br />
	<c:if test="${paginationProductInfos.totalPages > 1}">
		<div class="page-navigator">
			<c:forEach items="${paginationProductInfos.navigationPages}" var="page">
				<c:if test="${page != -1}">
					<a href="productList?page=${page}" class="nav-item">${page}</a>
				</c:if>
				<c:if test="${page == -1}">
					<span class="nav-item"> ... </span>
				</c:if>
			</c:forEach>
		</div>
	</c:if>
	<jsp:include page="_footer.jsp" />
	 -->
	
</body>
</html>