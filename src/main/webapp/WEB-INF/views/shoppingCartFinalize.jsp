<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Shopping Cart Finalize</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css" />
</head>
<body>
	<jsp:include page="_header.jsp" />
	
	<section class="about_section layout_padding" style="background-color: green; margin-bottom: 10px;">
		<div class="container" >
			<div class="col-md-6 col-lg-7">
				<div class="detail-box">
					<div class="heading_container">
						<h3>Thank you for Oder</h3>
						You order number is: ${lastOrderedCartInfo.orderNum}
						<p>Wishing you a very nice day</p>
						<p>Good luck</p>
					</div>
				</div>
				<div style="margin-bottom: 425px;"></div>				
			</div>	
		</div>
	</section>
	
	<jsp:include page="_footer.jsp" />
</body>
</html>