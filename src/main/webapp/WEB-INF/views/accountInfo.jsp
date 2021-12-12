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
	
	<section class="client_section layout_padding">
		<div class="container">
			<div class="heading_container heading_center">
				<h2>Account Info</h2>
			</div>
			<div class="carousel-wrap ">
				<div class="owl-carousel client_owl-carousel">
					<div class="item">
						<div class="box">
							<div class="img-box">
								<img alt="" src="${contextPath}/img/user1.png">
							</div>
							<div class="detail-box">
								<div class="client_info">
									<div class="client_name">
										<h5>User name: ${name}</h5>
										<h5 style="text-align: left;">Role:
											<ul>
												<c:forEach items="${userDetails.authorities }" var="auth">
													<li>${auth.authority }</li>
												</c:forEach>
											</ul>
										</h5>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div style="margin-bottom: 245px;"></div>
	</section>
		
	<jsp:include page="_footer.jsp" />
</body>
</html>