<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css" />
</head>
<body>
	<jsp:include page="_header.jsp" />	
	
	<section class="feature_section layout_padding">
		<div class="container">
			<div class="heading_container">
				<h2>Order Info</h2>
			</div>
		</div>
	</section>
	<div style="margin-left: 50px; margin-bottom: 20px; margin-right: 50px;">
		<div style="color: #000080; margin-left: 200px; ">
			<h3>Customer Information</h3>				
		</div>
		<ul style="font-size: 20px; margin-left: 200px; list-style-type: none;">
			<li>Name: ${orderInfo.customerName }</li>
			<li>Email: ${orderInfo.customerEmail }</li>
			<li>Phone: ${orderInfo.customerPhone}</li>
			<li>Address: ${orderInfo.customerAddress}</li>
		</ul>
		<h3 style="margin-left: 200px;">Order Summary: </h3>
		<ul style="font-size: 20px; margin-left: 200px; list-style-type: none;">
			<li>Total:
				<span class="total">
					<fmt:formatNumber value="${orderInfo.amount }" type="currency"></fmt:formatNumber>
				</span>
			</li>
		</ul>
		<br/>
	
		<table border="2" style="width: 100%; font-size: 20px;">
			<tr style="text-align: center;">
				<th>Product Code</th>
				<th>Product Name</th>
				<th>Quantity</th>
				<th>Price</th>
				<th>Total</th>
			</tr>
			<c:forEach items="${orderInfo.orderDetailInfos }" var="orderDetailInfos">
				<tr>
					<td>${orderDetailInfos.productCode }</td>
					<td>${orderDetailInfos.productName }</td>
					<td style="text-align: right;">${orderDetailInfos.quantity }</td>
					<td style="text-align: right;">
						<fmt:formatNumber value="${orderDetailInfos.price }" type="currency"></fmt:formatNumber>
					</td>
					<td style="text-align: right;">
						<fmt:formatNumber value="${orderDetailInfos.amount }" type="currency"></fmt:formatNumber>
					</td>
				</tr>
			</c:forEach>
		</table>
		<div style="margin-bottom: 210px;"></div>
	</div>
	
	<c:if test="${paginationOrderInfos.totalPages > 1 }">
		<div class="page-navigator">
			
			<c:forEach items="${paginationOrderInfos.navigationPages }" var="page">
				<c:if test="${page != -1 }">
					<a href="orderList?page=${page }" class="nav-item">${page }</a>
				</c:if>
				<c:if test="${page == -1 }">
					<span class="nav-item">...</span>
				</c:if>
			</c:forEach>
		</div>
	</c:if>
	<jsp:include page="_footer.jsp" />
</body>
</html>