<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form12"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Account</title>
<link rel="stylesheet" href="css/normalize.css">
<link href='https://fonts.googleapis.com/css?family=Nunito:400,300'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/main.css">
<style>
*, *:before, *:after {
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
}

body {
	font-family: 'Nunito', sans-serif;
	color: #384047;
}

form {
	max-width: 300px;
	margin: 10px auto;
	padding: 10px 20px;
	background: #f4f7f8;
	border-radius: 8px;
}

h1 {
	margin: 0 0 30px 0;
	text-align: center;
}

input[type="text"], input[type="password"], input[type="date"], input[type="datetime"],
	input[type="email"], input[type="number"], input[type="search"], input[type="tel"],
	input[type="time"], input[type="url"], textarea, select {
	background: rgba(255, 255, 255, 0.1);
	border: none;
	font-size: 16px;
	height: auto;
	margin: 0;
	outline: 0;
	padding: 15px;
	width: 100%;
	background-color: #e8eeef;
	color: #8a97a0;
	box-shadow: 0 1px 0 rgba(0, 0, 0, 0.03) inset;
	margin-bottom: 30px;
}

input[type="radio"], input[type="checkbox"] {
	margin: 0 4px 8px 0;
}

select {
	padding: 6px;
	height: 32px;
	border-radius: 2px;
}

button {
	padding: 19px 39px 18px 39px;
	color: #FFF;
	background-color: #4bc970;
	font-size: 18px;
	text-align: center;
	font-style: normal;
	border-radius: 5px;
	width: 100%;
	border: 1px solid #3ac162;
	border-width: 1px 1px 3px;
	box-shadow: 0 -1px 0 rgba(255, 255, 255, 0.1) inset;
	margin-bottom: 10px;
}

.reset {
	padding: 19px 39px 18px 39px;
	color: #FFF;
	background-color: #80cbc4;
	font-size: 18px;
	text-align: center;
	font-style: normal;
	border-radius: 5px;
	width: 100%;
	border: 1px solid #80cbc4;
	border-width: 1px 1px 3px;
	box-shadow: 0 -1px 0 rgba(255, 255, 255, 0.1) inset;
	margin-bottom: 10px;
}

fieldset {
	margin-bottom: 30px;
	border: none;
}

legend {
	font-size: 1.4em;
	margin-bottom: 10px;
}

label {
	display: block;
	margin-bottom: 8px;
}

label.light {
	font-weight: 300;
	display: inline;
}

.number {
	background-color: #5fcf80;
	color: #fff;
	height: 30px;
	width: 30px;
	display: inline-block;
	font-size: 0.8em;
	margin-right: 4px;
	line-height: 30px;
	text-align: center;
	text-shadow: 0 1px 0 rgba(255, 255, 255, 0.2);
	border-radius: 100%;
}

@media screen and (min-width: 480px) {
	form {
		max-width: 480px;
	}
}
</style>
</head>
<body>
	<jsp:include page="_header.jsp" />
	
	<form12:form action="${contextPath}/account" method="post"
		modelAttribute="accountForm">

		<fieldset>
			<form12:errors style="color: red;" path="username"
				class="error-message"></form12:errors>
			<label for="username">Username:</label>
			<c:if test="${not empty accountForm.username}">
						<form12:input type="text" id="username" path="username"
				placeholder="Enter your username" /> ${accountForm.username}
				</c:if>
				<c:if test="${empty accountForm.username}">
						<form12:input type="text" id="username" path="username"
				placeholder="Enter your username" />
				</c:if>

			<div>
				<form12:errors style="color: red;" path="password"
					class="error-message"></form12:errors>
				<label for="password">Password:</label>
				<form12:input type="password" id="password" path="password"
					placeholder="Enter your password" />
			</div>

			<form12:errors style="color: red;" path="userRole"
				class="error-message"></form12:errors>
			<label for="role">User Role:</label>
			<form12:select path="userRole" id="role">
				<form12:option value="MANAGER" label="MANAGER" />
				<form12:option value="EMPLOYEE" label="EMPLOYEE" />
			</form12:select>
			<form12:errors path="userRole" class="error-message"></form12:errors>

			<form12:errors style="color: red;" path="active"
				class="error-message"></form12:errors>
			<label for="active">Active:</label>
			<form12:select path="active" id="active">
				<form12:option value="1" label="Yes" />
				<form12:option value="0" label="No" />
			</form12:select>
			<form12:errors path="active" class="error-message"></form12:errors>

		</fieldset>
		<button style="margin-bottom: 10px; margin-top: 10px; border-radius: 5px;" type="submit">Apply &nbsp;</button>
		<button class="reset" type="reset" onclick="customReset();">Reset</button>
	</form12:form>
	
	<div style="margin-bottom: 240px;"></div>
	
	<jsp:include page="_footer.jsp" />
</body>
</html>