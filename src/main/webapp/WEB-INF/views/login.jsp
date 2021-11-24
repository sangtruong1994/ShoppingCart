<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
  <%@include file="css/styles.css" %> 
</style>
</head>
<body>
	<jsp:include page="_header.jsp" />	
	<jsp:include page="_menu.jsp" />
	
	<div class="page-title">Login (For Employee, Manager)</div>
	
	<div class="login-container">
		
		<h3>Enter username And password</h3>
		<br>
		<!-- /login?error=true -->
		<c:if test="${param.error == 'true' }">
			<div style="color: red; margin: 10px 0px;">
				
				Login Failed!!! <br/> Reason:
				${sessionSpoce["SPRING_SECURITY_LAST_EXCEPTION"].message }
			</div>
		</c:if>
		<form method="POSt" action="${contextPath}/j_spring_sevurity_check">
			<table>
				<tr>
					<td>Username *</td>
					<td><input name="userName"/></td>
				</tr>
				<tr>
					<td>Password *</td>
					<td><input type="password" name="password" /></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>
						<input type="submit" value="login"/>
						<input type="reset" value="Reset"/>
					</td>
				</tr>
			</table>
		</form>
		
		<span class="error-message">${error }</span>
	</div>
	
	<jsp:include page="_footer.jsp" />
</body>
</html>