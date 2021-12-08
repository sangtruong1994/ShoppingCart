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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/Home.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/nicepage.css" />

</head>
<body>
	<jsp:include page="_header.jsp" />
	
	<section class="u-align-center u-clearfix u-palette-3-base u-section-1" id="carousel_2870">
		<div class="u-clearfix u-sheet u-sheet-1">
			<div class="u-absolute-hcenter-xs u-expanded-height u-gradient u-shape u-shape-rectangle u-shape-1"></div>
			<img style="width: 850px;" alt="" src="${contextPath }/img/67-min.jpg">
			<div class="u-align-left u-container-style u-group u-white u-group-1">
				<div class="u-container-layout u-valign-middle u-container-layout-1">
					<h3 class="u-custom-font u-text u-text-font u-text-palette-1-base u-text-1">A cool product ONLY for you!<br>
          			</h3>
          			<p class="u-text u-text-2">Quis viverra nibh cras pulvinar mattis nunc sed. Lacus sed turpis tincidunt id aliquet risus feugiat in.&nbsp; Auctor augue mauris augue neque gravida in fermentum et. Feugiat in fermentum <a href="https://nicepage.com/joomla-templates" class="u-border-1 u-border-black u-btn u-button-link u-button-style u-none u-text-body-color u-btn-1">posuere</a> urna.
          			</p>
          			<a href="#" class="u-active-palette-5-dark-1 u-btn u-button-style u-hover-palette-5-dark-1 u-palette-5-light-1 u-btn-2">learn more</a>
				</div>
			</div>
			<div class="u-shape u-shape-circle u-white u-shape-2"></div>
		</div>
	</section>
	
	<section style="background-image: url('img/cvb1.jpg');" class="u-align-center u-clearfix u-image u-shading u-section-2" id="carousel_136f" data-image-width="1200" data-image-height="1200">
		<div class="u-clearfix u-sheet u-valign-middle-lg u-valign-middle-xl u-sheet-1">			
			<div class="u-clearfix u-layout-wrap u-layout-wrap-1">
				<div class="u-layout">
					<div class="u-layout-col">
						<div class="u-align-center u-container-style u-layout-cell u-size-30 u-white u-layout-cell-1">
							<div class="u-container-layout u-valign-middle u-container-layout-1">
								<h2 class="u-custom-font u-font-oswald u-text u-text-default u-text-1" data-animation-name="" data-animation-duration="0" data-animation-delay="0" data-animation-direction="">
								Join our newsletter</h2>
								<div class="u-align-center u-form u-form-1">
									<form action="#" method="POST" class="u-clearfix u-form-horizontal u-form-spacing-0 u-inner-form" style="padding: 0px;" source="custom" name="form">
										<div class="u-form-email u-form-group">
											<label for="email-cd2c" class="u-form-control-hidden u-label">Email</label>
                      						<input type="email" placeholder="Enter a valid email address" id="email-cd2c" name="email" class="u-border-1 u-border-grey-30 u-input u-input-rectangle u-white" required="">
										</div>
										<div class="u-align-left u-form-group u-form-submit">
											<a href="#" class="u-active-palette-2-dark-1 u-border-1 u-border-active-palette-2-dark-1 u-border-hover-palette-2-dark-1 u-border-palette-2-base u-btn u-btn-submit u-button-style u-hover-palette-2-dark-1 u-palette-2-base u-btn-1">
											notify me</a>
											<input type="submit" value="submit" class="u-form-control-hidden">
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>	
	<jsp:include page="_footer.jsp" />
</body>
</html>