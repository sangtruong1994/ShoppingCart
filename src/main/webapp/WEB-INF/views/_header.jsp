<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="name" value="${pageContext.request.userPrincipal.name}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Header</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css" />
</head>
<body>
	<header class="header_section">
		<div class="container-fluid">
			<nav class="navbar navbar-expand-lg custom_nav-container">
				<a class="navbar-brand" href="${contextPath}/">
					<span>Online Shop</span>
				</a>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav">
					<li class="nav-item active">
						<a class="nav-link" href="${contextPath}/">Home</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="${contextPath}/productList">Product List</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="${contextPath}/shoppingCart">My Cart</a>
					</li>
					<security:authorize access="hasAnyRole('ROLE_MANAGER','ROLE_EMPLOYEE')">
					<li class="nav-item">
						<a class="nav-link" href="${contextPath}/orderList">Order List</a>
					</li>
					</security:authorize>
					
					<security:authorize access="hasRole('ROLE_MANAGER')">
					<li class="nav-item">
						<a class="nav-link" href="${contextPath}/product">Create Product</a>
						
					</li>
					<li class="nav-item">
						<a class="nav-link"  href="${contextPath}/accountList"> Account Management </a>
					</li>
					</security:authorize>
				</ul>
				<div class="user_option-box" style="padding-bottom: 10px;">
					<c:if test="${name != null}">
						Hello <a href="${contextPath }/accountInfo">${name }</a>
					&nbsp; &nbsp;
					<a href="${contextPath }/logout">Logout</a>
					</c:if>
					<c:if test="${name == null}">
						<a href="${contextPath }/login">Login</a>
					</c:if>
				</div>
			</div>
			</nav>
		</div>
	</header>
	
</body>
</html>