<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="name" value="${pageContext.request.userPrincipal.name}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Account Info</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css" />
</head>
<body>
	<jsp:include page="_header.jsp" />
	
	<section class="contact_section">
		<div class="container">
			<h2>Account Info</h2>
			<div class="row">
				<div class="col-md-6">
					<div class="form_container">
						<ul>
							<li>User name: ${name}</li>
							<li>Role:
							<ul>
								<c:forEach items="${userDetails.authorities }" var="auth">
									<li>${auth.authority }</li>
								</c:forEach>
							</ul>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div style="margin-bottom: 650px;"></div>
	</section>
	
	<!-- 
	<div class="page-title">Account Info</div>
	
	<div class="account-container">
		<ul>
			<li>User name: ${name}</li>
			<li>Role:
				<ul>
					<c:forEach items="${userDetails.authorities }" var="auth">
						<li>${auth.authority }</li>
					</c:forEach>
				</ul>
			</li>
		</ul>
	</div>
	 -->

	
	
	<jsp:include page="_footer.jsp" />
</body>
</html>