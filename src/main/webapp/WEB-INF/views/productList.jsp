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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css" />
</head>
<body>
	<jsp:include page="_header.jsp" />
	<fmt:setLocale value="en_US" scope="session" />
	
	<section class="shop_section layout_padding">
	<form method="GET" action="${contextPath}/productList">
		<div class="container" >
			<div class="heading_container heading_center">
				<h2>Product List</h2>				
					<table>
						<tr>
							<td ><input style="margin-right: 5px;" type="text" name="name"></td>
							<td colspan="2" align="center">
								<input style="color: white; background-color: #33CC00; border-radius: 5px;" type="submit" value="Search">
							</td>
						</tr>
					</table>	
						
			</div>
			
			<c:forEach items="${paginationProductInfos.list}" var="productInfo">
				<div class="row" style="display: inline-block;">
					<div class="col-sm-6 col-xl-3" >
						<div class="box" style="width: 350px; height: auto; margin-left: 10px;">
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
										<a style="color: red;" href="${contextPath}/product?code=${productInfo.code}">Edit Product</a>
										
									</li>
									<li>
										<a style="color: red;" href="${contextPath}/removeProduct?code=${productInfo.code}">Delete Product</a>
									</li>
								</security:authorize>
							</ul>
						</div>
					</div>
				</div>
			</c:forEach>					
		</div>
		</form>		
	</section>
	
	<br />
	<c:if test="${paginationProductInfos.totalPages > 1}">
		<div style="text-align:center;">
			<c:forEach items="${paginationProductInfos.navigationPages}" var="page">
				<c:if test="${page != -1}">
					<a style="font-size: 20px;" href="productList?page=${page}">${page}</a>
				</c:if>
				<c:if test="${page == -1}">
					<span class="nav-item"> ... </span>
				</c:if>
			</c:forEach>
		</div>
	</c:if>
	
	<jsp:include page="_footer.jsp" />	
</body>
</html>