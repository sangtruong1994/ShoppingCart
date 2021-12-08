<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
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
	
	<section class="contact_section">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<div class="form_container">
						<div class="heading_container">
							<h2>Enter Customer Information</h2>
						</div>
						<form:form method="POST" modelAttribute="customerForm" action="${contextPath}/shoppingCartCustomer">
							<table style="font-size: 20px">
								<tr>
									<td>Name *</td>
									<td><form:input path="name"/></td>
									<td style="color: red;"><form:errors path="name" class="error-message"/></td>
								</tr>
								<tr>
									<td>Email *</td>
									<td><form:input path="email"/></td>
									<td style="color: red;"><form:errors path="email" class="error-message"/></td>
								</tr>
								<tr>
									<td>Phone *</td>
									<td><form:input path="phone"/></td>
									<td style="color: red;"><form:errors path="phone" class="error-message"/></td>
								</tr>
								<tr>
									<td>Address *</td>
									<td><form:input path="address"/></td>
									<td style="color: red;"><form:errors path="address" class="error-message"/></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td>
										<button style="background-color: green;" type="submit" value="Submit">Submit</button>
										<button type="reset" value="Reset" onclick="customReset();">Reset</button>									

									</td>
								</tr>
							</table>
						</form:form>				
					</div>					
				</div>
			</div>
		</div>
	</section>
	
	<div style="margin-bottom: 328px;"></div>
	
	<jsp:include page="_footer.jsp" />
</body>
</html>