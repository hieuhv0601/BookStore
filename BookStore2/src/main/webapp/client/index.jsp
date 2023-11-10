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
	<!-- Categories Section Begin -->
	<section class="categories">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-6 p-0">
					<div class="categories__item categories__large__item set-bg"
						data-setbg="img/categories/category-1.jpg">
						<div class="categories__text">
							<h1>Literacy Fiction</h1>
							<p>Literary fiction delves into profound human experiences
								with an emphasis on exquisite prose and intricate character
								development, setting it apart from mainstream or genre fiction.</p>
							<a href="#">Shop now</a>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="row">
						<div class="col-lg-6 col-md-6 col-sm-6 p-0">
							<div class="categories__item set-bg"
								data-setbg="img/categories/category-2.jpg">
								<div class="categories__text">
									<h4>Romance</h4>
									<a href="view_category?id=4">Shop now</a>
								</div>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6 p-0">
							<div class="categories__item set-bg"
								data-setbg="img/categories/category-3.jpg">
								<div class="categories__text">
									<h4>Kid’s Story</h4>
									<a href="#">Shop now</a>
								</div>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6 p-0">
							<div class="categories__item set-bg"
								data-setbg="img/categories/category-4.jpg">
								<div class="categories__text">
									<h4>Programming</h4>
									<a href="#">Shop now</a>
								</div>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6 p-0">
							<div class="categories__item set-bg"
								data-setbg="img/categories/category-5.jpg">
								<div class="categories__text">
									<h4>Self-help</h4>
									<a href="#">Shop now</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Categories Section End -->

	<!-- Product Section Begin -->
	<section class="product spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-md-4">
					<div class="section-title">
						<h4>New product</h4>
					</div>
				</div>
				<div class="col-lg-8 col-md-8">
					<ul class="filter__controls">
						<li class="active" data-filter="*">All</li>
						<c:forEach items="${categoriesList}" var="category">
							<li data-filter=".${category.categorySlug}">${category.categoryName}</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="row property__gallery">
				<c:forEach items="${newBooksList}" var="book">

					<div
						class="col-lg-3 col-md-4 col-sm-6 mix ${book.categories.categorySlug}">
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
		</div>

	</section>
	<!-- Product Section End -->

	<!-- Banner Section Begin -->
	<section class="banner set-bg" data-setbg="img/banner/banner-1.jpg">
		<div class="container">
			<div class="row">
				<div class="col-xl-7 col-lg-8 m-auto">
					<div class="banner__slider owl-carousel">
						<div class="banner__item">
							<div class="banner__text">
								<span>The Chloe Collection</span>
								<h1>The Project Jacket</h1>
								<a href="#">Shop now</a>
							</div>
						</div>
						<div class="banner__item">
							<div class="banner__text">
								<span>The Chloe Collection</span>
								<h1>The Project Jacket</h1>
								<a href="#">Shop now</a>
							</div>
						</div>
						<div class="banner__item">
							<div class="banner__text">
								<span>The Chloe Collection</span>
								<h1>The Project Jacket</h1>
								<a href="#">Shop now</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Banner Section End -->

	<!-- Trend Section Begin -->
	<section class="trend spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-md-4 col-sm-6">
					<div class="trend__content">
						<div class="section-title">
							<h4>Hot Trend</h4>
						</div>
						<div class="trend__item">
							<div class="trend__item__pic">
								<img src="img/trend/ht-1.jpg" alt="">
							</div>
							<div class="trend__item__text">
								<h6>Chain bucket bag</h6>
								<div class="rating">
									<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i>
								</div>
								<div class="product__price">$ 59.0</div>
							</div>
						</div>
						<div class="trend__item">
							<div class="trend__item__pic">
								<img src="img/trend/ht-2.jpg" alt="">
							</div>
							<div class="trend__item__text">
								<h6>Pendant earrings</h6>
								<div class="rating">
									<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i>
								</div>
								<div class="product__price">$ 59.0</div>
							</div>
						</div>
						<div class="trend__item">
							<div class="trend__item__pic">
								<img src="img/trend/ht-3.jpg" alt="">
							</div>
							<div class="trend__item__text">
								<h6>Cotton T-Shirt</h6>
								<div class="rating">
									<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i>
								</div>
								<div class="product__price">$ 59.0</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-6">
					<div class="trend__content">
						<div class="section-title">
							<h4>Best seller</h4>
						</div>
						<div class="trend__item">
							<div class="trend__item__pic">
								<img src="img/trend/bs-1.jpg" alt="">
							</div>
							<div class="trend__item__text">
								<h6>Cotton T-Shirt</h6>
								<div class="rating">
									<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i>
								</div>
								<div class="product__price">$ 59.0</div>
							</div>
						</div>
						<div class="trend__item">
							<div class="trend__item__pic">
								<img src="img/trend/bs-2.jpg" alt="">
							</div>
							<div class="trend__item__text">
								<h6>
									Zip-pockets pebbled tote <br />briefcase
								</h6>
								<div class="rating">
									<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i>
								</div>
								<div class="product__price">$ 59.0</div>
							</div>
						</div>
						<div class="trend__item">
							<div class="trend__item__pic">
								<img src="img/trend/bs-3.jpg" alt="">
							</div>
							<div class="trend__item__text">
								<h6>Round leather bag</h6>
								<div class="rating">
									<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i>
								</div>
								<div class="product__price">$ 59.0</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-6">
					<div class="trend__content">
						<div class="section-title">
							<h4>Feature</h4>
						</div>
						<div class="trend__item">
							<div class="trend__item__pic">
								<img src="img/trend/f-1.jpg" alt="">
							</div>
							<div class="trend__item__text">
								<h6>Bow wrap skirt</h6>
								<div class="rating">
									<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i>
								</div>
								<div class="product__price">$ 59.0</div>
							</div>
						</div>
						<div class="trend__item">
							<div class="trend__item__pic">
								<img src="img/trend/f-2.jpg" alt="">
							</div>
							<div class="trend__item__text">
								<h6>Metallic earrings</h6>
								<div class="rating">
									<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i>
								</div>
								<div class="product__price">$ 59.0</div>
							</div>
						</div>
						<div class="trend__item">
							<div class="trend__item__pic">
								<img src="img/trend/f-3.jpg" alt="">
							</div>
							<div class="trend__item__text">
								<h6>Flap cross-body bag</h6>
								<div class="rating">
									<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i>
								</div>
								<div class="product__price">$ 59.0</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Trend Section End -->

	<!-- Discount Section Begin -->
	<!--
	<section class="discount">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 p-0">
					<div class="discount__pic">
						<img src="img/discount.jpg" alt="">
					</div>
				</div>
				<div class="col-lg-6 p-0">
					<div class="discount__text">
						<div class="discount__text__title">
							<span>Discount</span>
							<h2>Summer 2019</h2>
							<h5>
								<span>Sale</span> 50%
							</h5>
						</div>
						<div class="discount__countdown" id="countdown-time">
							<div class="countdown__item">
								<span>22</span>
								<p>Days</p>
							</div>
							<div class="countdown__item">
								<span>18</span>
								<p>Hour</p>
							</div>
							<div class="countdown__item">
								<span>46</span>
								<p>Min</p>
							</div>
							<div class="countdown__item">
								<span>05</span>
								<p>Sec</p>
							</div>
						</div>
						<a href="#">Shop now</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	-->
	<!-- Discount Section End -->

	<!-- Services Section Begin -->
	<section class="services spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-4 col-sm-6">
					<div class="services__item">
						<i class="fa fa-car"></i>
						<h6>Free Shipping</h6>
						<p>For all oder over $99</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6">
					<div class="services__item">
						<i class="fa fa-money"></i>
						<h6>Money Back Guarantee</h6>
						<p>If good have Problems</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6">
					<div class="services__item">
						<i class="fa fa-support"></i>
						<h6>Online Support 24/7</h6>
						<p>Dedicated support</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6">
					<div class="services__item">
						<i class="fa fa-headphones"></i>
						<h6>Payment Secure</h6>
						<p>100% secure payment</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Services Section End -->
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

	<script>
		$(document).ready(function() {
			// Find all elements with the 'data-setbg' attribute
			$('[data-setbg]').each(function() {
				var $element = $(this);
				var bgImage = $element.data('setbg');

				// Set the background image of the element
				$element.css('background-image', 'url(' + bgImage + ')');
			});
		});
	</script>

</body>

</html>
