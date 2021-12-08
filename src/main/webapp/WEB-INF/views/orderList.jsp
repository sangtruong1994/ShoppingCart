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
<title>Order List</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css" />
</head>
<body>
	<jsp:include page="_header.jsp" />
	
	<section class="feature_section layout_padding">
		<div class="container">
			<div class="heading_container">
				<h2>Order List</h2>
			</div>
			<div style="font-size: 25px; color: #000080">Total Order Count : ${paginationOrderInfos.totalRecords}</div>
			<table border="2" style="width: 100%">
				<tr>
					<th>Order Num</th>
					<th>Order Date</th>
					<th>Customer Name</th>
					<th>Customer Address</th>
					<th>Customer Email</th>
					<th>Amount</th>
					<th>View</th>
				</tr>
				<c:forEach items="${paginationOrderInfos.list }" var="orderInfo">
					<tr>
						<td style="text-align: center;">${orderInfo.orderNum }</td>
						<td>
							<fmt:formatDate value="${orderInfo.orderDate }" pattern="dd/MM/yyyy HH:mm:ss"/>
						</td>
						<td style="text-align: left;">${orderInfo.customerName }</td>
						<td style="text-align: left;">${orderInfo.customerAddress}</td>
						<td style="text-align: left;">${orderInfo.customerEmail }</td>
						<td style="color: red; text-align: right;">
							<fmt:formatNumber value="${orderInfo.amount }" type="currency"></fmt:formatNumber>
						</td>
						<td>
							<a href="${contextPath}/order?orderId=${orderInfo.id }">View</a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div style="margin-bottom: 300px;"></div>
	</section>
	
	<c:if test="${paginationOrderInfos.totalPages > 1 }">
		<div style="text-align:center;">
			
			<c:forEach items="${paginationOrderInfos.navigationPages }" var="page">
				<c:if test="${page != -1 }">
					<a style="font-size: 20px;" href="orderList?page=${page }" class="nav-item">${page }</a>
				</c:if>
				<c:if test="${page == -1 }">
					<span>...</span>
				</c:if>
			</c:forEach>
		</div>
		<div style="margin-bottom: 50px;"></div>
	</c:if>
	
	<jsp:include page="_footer.jsp" />
</body>
</html>