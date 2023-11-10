
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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

<jsp:directive.include file="header.jsp" />
<body>
	<!-- Breadcrumb Begin -->
	<div class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__links">
						<a href="${pageContext.request.contextPath}"><i class="fa fa-home"></i> Home</a> <a
							href="#">${book.categories.categoryName} </a> <span>${book.title}</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb End -->

	<!-- Product Details Section Begin -->
	<section class="product-details spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="product__details__pic">
						<div
							class="product__details__pic__left product__thumb nice-scroll">
							<a class="pt active" href="#product-1"> <c:forEach
									var="bookImage" items="${book.bookImageses}">
									<c:if
										test="${bookImage.books.bookId == book.bookId && not empty bookImage}">
										<img class="book-image"
											src="data:image/jpg;base64, ${bookImage.base64Image}"
											alt="${book.title}" />
									</c:if>
								</c:forEach> <!-- </a> <a class="pt" href="#product-2"> <img
							src="img/product/details/thumb-2.jpg" alt="">
						</a> <a class="pt" href="#product-3"> <img
							src="img/product/details/thumb-3.jpg" alt="">
						</a> <a class="pt" href="#product-4"> <img
							src="img/product/details/thumb-4.jpg" alt="">
						</a> -->
						</div>
						<div class="product__details__slider__content">
							<div class="product__details__pic__slider owl-carousel">
								<c:forEach var="bookImage" items="${book.bookImageses}">
									<c:if
										test="${bookImage.books.bookId == book.bookId && not empty bookImage}">
										<img class="book-image"
											src="data:image/jpg;base64, ${bookImage.base64Image}"
											alt="${book.title}" />
									</c:if>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="product__details__text">
						<h3 id="book-title">${book.title}
							<span>Author: ${book.author}</span>
						</h3>
						<div class="rating">
							<span class="star-rating"> <c:forEach begin="1" end="5"
									var="i">
									<c:set var="starStatus"
										value="${fn:substring(book.ratingStars, (i-1)*3, (i-1)*3+2)}" />
									<c:choose>
										<c:when test="${starStatus == 'on'}">
											<i class="fa fa-star checked"></i>
										</c:when>
										<c:when test="${starStatus == 'half'}">
											<i class="fa fa-star-half checked"></i>
										</c:when>
										<c:otherwise>
											<i class="fa fa-star"></i>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</span> <span>( 138 reviews )</span>
						</div>
						<div class="product__details__price">
							$${book.price} <span>$ 83.0</span>
						</div>
						<div class="product__details__button">
							<div class="quantity">
								<span>Quantity:</span>
								<div class="pro-qty">
									<input type="text" id="quantity" name="quantity" value="1"
										min="1" />
								</div>
							</div>
							<a href="#" id="buttonAddToCart" class="cart-btn"><span
								class="icon_bag_alt"></span> Add to cart</a>
							<ul>
								<li><a href="#"><span class="icon_heart_alt"></span></a></li>
								<!-- <li><a href="#"><span class="icon_adjust-horiz"></span></a></li> -->

							</ul>
						</div>
						<div class="product__details__widget">
							<ul>
								<li><span>Availability:</span>
									<div class="stock__checkbox">
										<c:forEach var="stockQuantity" items="${book.warehouses}">
											<c:set var="availableItems"
												value="${stockQuantity.quantityInStock - stockQuantity.quantitySold}" />
											<p class="stock-quantity">
												${availableItems <= 0 ? 'Out of stock' : availableItems}</p>
										</c:forEach>
									</div></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-12">
					<div class="product__details__tab">
						<ul class="nav nav-tabs" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								data-toggle="tab" href="#tabs-1" role="tab">Description</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#tabs-2" role="tab">Specification</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#tabs-3" role="tab">Reviews ( 2 )</a></li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="tabs-1" role="tabpanel">
								<h6>Description</h6>
								<p>${book.description}.</p>

							</div>
							<div class="tab-pane" id="tabs-2" role="tabpanel">
								<h6>Specification</h6>

							</div>
							<div class="tab-pane" id="tabs-3" role="tabpanel">
								<button id="buttonWriteReview" class="btn btn-primary">Write
									a Customer Review</button>
								<table class="normal">
									<c:forEach items="${book.reviewses}" var="review">

							
										<tr>
											<td>${review.users.firstName} ${review.users.lastName}</td>
										</tr>
										<tr>
											<td><c:forTokens items="${review.stars}" delims=","
													var="star">
													<c:if test="${star eq 'on'}">
														<img
															src="${pageContext.request.contextPath}/assets/img/rating_on.png" />
													</c:if>
													<c:if test="${star eq 'off'}">
														<img
															src="${pageContext.request.contextPath}/assets/img/rating_off.png" />
													</c:if>
												</c:forTokens></td>
										</tr>
										<tr>
											<td>${review.createdAt}</td>

										</tr>
										<tr>
											<td><b>${review.headline}</b></td>

										</tr>

										<tr>
											<td><i>${review.comment}</i></td>
										</tr>
									
									</c:forEach>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="related__title">
						<h5>RELATED PRODUCTS</h5>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6">
					<div class="product__item">
						<div class="product__item__pic set-bg"
							data-setbg="img/product/related/rp-1.jpg">
							<div class="label new">New</div>
							<ul class="product__hover">
								<li><a href="img/product/related/rp-1.jpg"
									class="image-popup"><span class="arrow_expand"></span></a></li>
								<li><a href="#"><span class="icon_heart_alt"></span></a></li>
								<li><a href="#"><span class="icon_bag_alt"></span></a></li>
							</ul>
						</div>
						<div class="product__item__text">
							<h6>
								<a href="#">Buttons tweed blazer</a>
							</h6>
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
	</section>
	<!-- Product Details Section End -->
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
	

	<script type="text/javascript">
		$(document).ready(function() {
			$("#buttonWriteReview").click(function() {
				window.location = "write_review?book_id=" + ${book.bookId};
			});

			var addedItemCount = 0; // Initialize a counter for added items

	        $("#buttonAddToCart").click(function() {
	            // Get the quantity from an input field (assuming the input field has an id of "quantity")
	            var quantity = $("#quantity").val();

	            if (quantity !== "" && !isNaN(quantity) && quantity > 0) {
	                // Use AJAX to send the quantity along with the cart request
	                $.ajax({
	                    type: "GET", // or "GET" depending on your server-side implementation
	                    url: "add_to_cart",
	                    data: {
	                        book_id: ${book.bookId},
	                        quantity: quantity
	                    },
	                    success: function(response) {
	                    	console.log(data);
	                        // Handle the response from the server if needed
	                        addedItemCount++; // Increment the counter
	                        if (addedItemCount === 1) {
	                            alert("Item added to cart successfully.");
	                        }
	                    },
	                    error: function(error) {
	                        // Handle any errors here
	                        console.error("Error adding item to cart: " + error);
	                    }
	                });
	            } else {
	                alert("Please enter a valid quantity.");
	            }
	        });

		});
	</script>
	<script type="text/javascript">
    // Connect to WebSocket
    var wsUrl;
    if (window.location.protocol == 'http:') {
        wsUrl = 'ws://';
    } else {
        wsUrl = 'wss://';
    }
    var ws = new WebSocket(wsUrl + window.location.host + "/BookStore/itemAvailability");

    ws.onmessage = function (event) {
        // Handle item availability updates
        var updatedAvailability = event.data;
        // Update the HTML element displaying availability
        document.getElementById("availability").textContent = updatedAvailability;
    };

    ws.onerror = function (event) {
        console.log("Error ", event)
    }
</script>
	
</body>

</html>
