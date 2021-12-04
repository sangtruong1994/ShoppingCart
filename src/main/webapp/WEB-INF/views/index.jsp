<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Index</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fontawesome.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css" />
</head>
<body>
	<jsp:include page="_header.jsp" />
	
	<section class="client_section layout_padding">
		<div class="container">
			<div class="heading_container heading_center">
				<h2>Shopping Cart</h2>
			</div>			
		</div>
		<div class="carousel-wrap ">
			<div class="owl-carousel client_owl-carousel" >
				<div class="item" >
					<div class="box" style="width: 800px; margin-left: 550px;">
						<div class="img-box">
							<img alt="" src="${contextPath }/img/user1.png">
						</div>
						<div class="detail-box">
							<div class="client_info">
								<div class="client_name">
									<h5>Sang Truong</h5>
									<h6>Member</h6>
								</div>
							</div>
							<p>Country: Vietnam</p>
							<p>City: Tp Ho Chi Minh</p>
							<p>Phone: 0788651543</p>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="box" style="width: 800px; margin-left: 550px; ">
						<div class="img-box">
							<img alt="" src="${contextPath }/img/user1.png">
						</div>
						<div class="detail-box">
							<div class="client_info">
								<div class="client_name">
									<h5>Tram Nguyen</h5>
									<h6>Member</h6>
								</div>
							</div>
							<p>Country: Vietnam</p>
							<p>City: Tp Ho Chi Minh</p>
							<p>Phone: ###</p>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="box" style="width: 800px; margin-left: 550px; ">
						<div class="img-box">
							<img alt="" src="${contextPath }/img/user1.png">
						</div>
						<div class="detail-box">
							<div class="client_info">
								<div class="client_name">
									<h5>Kien Nguyen</h5>
									<h6>Member</h6>
								</div>
							</div>
							<p>Country: Vietnam</p>
							<p>City: Tp Ho Chi Minh</p>
							<p>Phone: ###</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<!-- 
	<div class="demo-container">
		<h3>Content</h3>
		
		<ul>
			<li>Buy online</li>
			<li>Admin pages</li>
			<li>Reports</li>
		</ul>
	</div>
	 -->
	
	
	<jsp:include page="_footer.jsp" />
</body>
</html>