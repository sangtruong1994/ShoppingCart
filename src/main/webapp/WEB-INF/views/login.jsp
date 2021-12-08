<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<style>
@
use postcss-preset-env {
	stage: 0;
}

/* ---------- GENERAL ---------- */
* {
	box-sizing: inherit;
}

html {
	box-sizing: border-box;
}

body {
	background-color: #fff;
	font-family: 'Varela Round', sans-serif;
	line-height: 1.5;
	margin: 0;
	min-block-size: 100vh;
	padding: 5vmin;
}

h2 {
	font-size: 1.75rem;
}

input {
	background-image: none;
	border: none;
	font: inherit;
	margin: 0;
	padding: 0;
	transition: all 0.3s;
}

svg {
	height: auto;
	max-width: 100%;
	vertical-align: middle;
}

/* ---------- ALIGN ---------- */
.align {
	display: grid;
	place-items: center;
}

/* ---------- BUTTON ---------- */
.button {
	background-color: #33cc77;
	color: #fff;
	padding: 0.25em 1.5em;
}

.button:focus, .button:hover {
	background-color: #28ad63;
}

/* ---------- ICONS ---------- */
.icons {
	display: none;
}

.icon {
	fill: currentcolor;
	display: inline-block;
	height: 1em;
	width: 1em;
}

/* ---------- LOGIN ---------- */
.login {
	width: 400px;
}

.login__header {
	background-color: #f95252;
	border-top-left-radius: 1.25em;
	border-top-right-radius: 1.25em;
	color: #fff;
	padding: 1.25em 1.625em;
}

.login__header :first-child {
	margin-top: 0;
}

.login__header :last-child {
	margin-bottom: 0;
}

.login h2 .icon {
	margin-right: 14px;
}

.login__form {
	background-color: #fafafa;
	border-bottom-left-radius: 1.25em;
	border-bottom-right-radius: 1.25em;
	color: #777;
	display: grid;
	gap: 0.875em;
	padding: 1.25em 1.625em;
}

.login__form__inside {
	background-color: #fafafa;
	border-bottom-left-radius: 1.25em;
	border-bottom-right-radius: 1.25em;
	color: #616161;
	display: grid;
	gap: 0.875em;
	padding: 1.25em 1.625em;
}

.login input {
	border-radius: 0.1875em;
}

.login input[type="text"], .login input[type="password"] {
	background-color: #fff;
	color: black;
	padding: 0.25em 0.625em;
	width: 100%;
}

.login input[type="submit"] {
	display: block;
	margin: 0 auto;
}
</style>
</head>
<body class="align">
	<jsp:include page="_header.jsp" />	
	
	<div class="login">

		<header class="login__header">
			<h2>
				<svg class="icon">
          <use xlink:href="#icon-lock" />
        </svg>
				Sign In<br />
			</h2>
			<h6>For Manager & Employee only</h6>

		</header>
	
	<div class="login__form" style=" height: 400px;">
			<c:if test="${param.error == 'true'}">
				<div style="color: red; margin: 5px 0px;">
					Login Failed!!!<br /> Reason:
					${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
				</div>
			</c:if>
			<form class="login__form__inside" method="POST"
				action="${contextPath}/j_spring_security_check">
				<div>
					<label  for="text">Username</label> <input type="text" id="text"
						name="username">
				</div>

				<div>
					<label  for="password">Passwords</label> <input type="password"
						name="password">
				</div>

				<div>
					<input class="button" type="submit" value="Sign In">
				</div>
				
			</form>
			<span class="error-message">${error}</span>
		</div>
	</div>
	
		<svg xmlns="http://www.w3.org/2000/svg" class="icons">

    <symbol id="icon-lock" viewBox="0 0 448 512">
      <path
			d="M400 224h-24v-72C376 68.2 307.8 0 224 0S72 68.2 72 152v72H48c-26.5 0-48 21.5-48 48v192c0 26.5 21.5 48 48 48h352c26.5 0 48-21.5 48-48V272c0-26.5-21.5-48-48-48zm-104 0H152v-72c0-39.7 32.3-72 72-72s72 32.3 72 72v72z" />
    </symbol>

  </svg>
	
	<jsp:include page="_footer.jsp" />
</body>
</html>