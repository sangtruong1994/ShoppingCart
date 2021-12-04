<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Product</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css" />
</head>
<body>
	<jsp:include page="_header.jsp" />
	

	<div class="page-title">Product</div>

	<c:if test="${not empty errorMessage}">
		<div class="error-message">${errorMessage}</div>
	</c:if>
	<form:form modelAttribute="productForm" method="POST"

		enctype="multipart/form-data" action="${contextPath}/product">
		<table style="text-align: left;">
			<tr>
				<td>Code *</td>
				<td style="color: red;"><c:if test="${not empty productForm.code}">
						<form:hidden path="code" /> ${productForm.code}
				</c:if> 
				<c:if test="${empty productForm.code}">
					<form:input path="code" />
					<form:hidden path="newProduct" />
				</c:if></td>
				
				<td><form:errors path="code" class="error-message" /></td>
			</tr>

			<tr>
				<td>Name *</td>
				<td><form:input path="name" /></td>
				<td><form:errors path="name" class="error-message" /></td>
			</tr>

			<tr>
				<td>Price *</td>
				<td><form:input path="price" /></td>
				<td><form:errors path="price" class="error-message" /></td>
			</tr>

			<tr>
				<td>Image</td>
				<td><img
					src="${contextPath}/productImage?code=${productForm.code}"
					width="100" /></td>
				<td></td>
			</tr>

			<tr>
				<td>Upload Image</td>
				<td><form:input type="file" path="fileData" /></td>
				<td></td>
			</tr>

			<tr>
				<td>&nbsp;</td>
				<td><input type="submit" value="Submit" /> <input type="reset"	value="Reset" onclick="customReset();"/></td>
			</tr>
		</table>
	</form:form>

	<jsp:include page="_footer.jsp" />
</body>
</html>