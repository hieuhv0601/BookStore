<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Ashion Template">
<meta name="keywords" content="Ashion, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Ashion | Template</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cookie&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/jquery-ui.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/magnific-popup.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/style.css"
	type="text/css">
</head>

<body>

	<jsp:directive.include file="header.jsp" />
	<!-- Breadcrumb Begin -->
	<div class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__links">
						<a href="./index.html"><i class="fa fa-home"></i> Home</a> <span>Shop</span>
					</div>
				</div>
				<c:if test="${fn:length(result) == 0}">
					<h2>No Results for "${keyword}"</h2>
				</c:if>
			</div>
		</div>
	</div>
	<!-- Breadcrumb End -->


	<!-- Shop Section Begin -->
	<section class="shop spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-3">
					<div class="shop__sidebar">
						<div class="sidebar__categories">
							<div class="section-title">
								<h4>Categories</h4>
							</div>
							<div class="categories__accordion">
								<div class="accordion" id="accordionExample">
									<div class="card">
										<div class="card-heading active">
											<a data-toggle="collapse" data-target="#collapseOne">Women</a>
										</div>
										<div id="collapseOne" class="collapse show"
											data-parent="#accordionExample">
											<div class="card-body">
												<ul>
													<c:forEach items="${categoriesList}" var="category">
														<li><a href="#">${category.categoryName}</a></li>
													</c:forEach>

												</ul>
											</div>
										</div>
									</div>

								</div>
							</div>
						</div>
						<div class="sidebar__filter">
							<div class="section-title">
								<h4>Shop by price</h4>
							</div>
							<div class="filter-range-wrap">
								<div
									class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
									data-min="33" data-max="99"></div>
								<div class="range-slider">
									<div class="price-input">
										<p>Price:</p>
										<input type="text" id="minamount"> <input type="text"
											id="maxamount">
									</div>
								</div>
							</div>
							<a href="#">Filter</a>
						</div>
					</div>
				</div>

				<div class="col-lg-9 col-md-9">
					<c:if test="${fn:length(result) > 0}">
						<h2>Results for "${keyword}":</h2>
						<div class="row">

							<br> <br>

							<c:forEach items="${result}" var="book">
								<div class="col-lg-4 col-md-6">

									<div class="product__item">
										<c:forEach var="bookImage" items="${book.bookImageses}">
											<c:if
												test="${bookImage.books.bookId == book.bookId && not empty bookImage}">

												<div class="product__item__pic set-bg">
													<div class="label new">New</div>
													<img src="data:image/jpg;base64, ${bookImage.base64Image}"
														class="product__item__pic set-bg">
													<ul class="product__hover">
														<li><a
															href="data:image/jpg;base64, ${bookImage.base64Image}"
															class="image-popup"><span class="arrow_expand"></span></a></li>
														<li><a href="#"><span class="icon_heart_alt"></span></a></li>
														<li><a href="#"><span class="icon_bag_alt"></span></a></li>
													</ul>
												</div>
											</c:if>
										</c:forEach>
										<div class="product__item__text">
											<h6>
												<a href="view_book?id=${book.bookId}">${fn:substring(book.title, 0, 35)}...</a>
											</h6>
											<p>by ${fn:substring(book.author, 0, 30)}...</p>
											<div class="rating">
												<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i>
											</div>
											<div class="product__price">$ ${book.price}</div>
										</div>
									</div>
								</div>
							</c:forEach>

						</div>

						<div class="col-lg-12 text-center">
							<div class="pagination__option">
								<a href="#"><i class="fa fa-angle-left"></i></a> <a href="#">1</a>
								<a href="#">2</a> <a href="#">3</a> <a href="#"><i
									class="fa fa-angle-right"></i></a>
							</div>
						</div>
					</c:if>
				</div>

			</div>
		</div>
	</section>
	<jsp:directive.include file="footer.jsp" />

	<!-- Js Plugins -->
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery-3.3.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.magnific-popup.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery-ui.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/mixitup.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.countdown.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.slicknav.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/owl.carousel.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.nicescroll.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
</html>
