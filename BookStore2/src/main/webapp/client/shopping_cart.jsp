<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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

	<!-- Offcanvas Menu Begin -->
	<div class="offcanvas-menu-overlay"></div>
	<div class="offcanvas-menu-wrapper">
		<div class="offcanvas__close">+</div>
		<ul class="offcanvas__widget">
			<li><span class="icon_search search-switch"></span></li>
			<li><a href="#"><span class="icon_heart_alt"></span>
					<div class="tip">2</div> </a></li>
			<li><a href="#"><span class="icon_bag_alt"></span>
					<div class="tip">2</div> </a></li>
		</ul>
		<div class="offcanvas__logo">
			<a href="./index.html"><img src="img/logo.png" alt=""></a>
		</div>
		<div id="mobile-menu-wrap"></div>
		<div class="offcanvas__auth">
			<a href="#">Login</a> <a href="#">Register</a>
		</div>
	</div>
	<!-- Offcanvas Menu End -->

	<!-- Header Section Begin -->
	<jsp:directive.include file="header.jsp" />
	<!-- Header Section End -->

	<!-- Breadcrumb Begin -->
	<div class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__links">
						<a href="./index.html"><i class="fa fa-home"></i> Home</a> <span>Shopping
							cart</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb End -->

	<!-- Shop Cart Section Begin -->

	<section class="shop-cart spad">
		<div class="container">
			<form action="delete_from_cart" method="get">
				<div class="row">

					<div class="col-lg-12">
						<div class="shop__cart__table">
							<table>
								<thead>
									<tr>
										<th colspan="2">Book Title</th>
										<th>Price</th>
										<th>Quantity</th>
										<th>Total</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="cartItem" items="${listItems}">
										<tr>
											<td><input type="checkbox" name="selectedItems"
												value="${cartItem.cartId}" /></td>
											<td class="cart__product__item"><c:forEach
													var="bookImage" items="${cartItem.books.bookImageses}">
													<c:if
														test="${bookImage.books.bookId == cartItem.books.bookId && not empty bookImage}">
														<a href="view_book?id=${bookImage.books.bookId}"><img
															src="data:image/jpg;base64, ${bookImage.base64Image}"
															width="84" height="110" /> </a>
													</c:if>
												</c:forEach>
												<div class="cart__product__item__title">
													<h6>${cartItem.books.title}</h6>
													<div class="rating">
														<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
															class="fa fa-star"></i> <i class="fa fa-star"></i> <i
															class="fa fa-star"></i>
													</div>
												</div></td>
											<td class="cart__price"><fmt:formatNumber
													value="${cartItem.books.price}" type="currency"
													currencySymbol="$" /></td>
											<td class="cart__quantity">
												<div class="pro-qty">
													<input type="number" value="${cartItem.quantity}" class="quantity-input" data-cart-item-id="${cartItem.cartId}">
												</div>
											</td>
											<td class="cart__total"><fmt:formatNumber
													value="${cartItem.quantity * cartItem.books.price}"
													type="currency" currencySymbol="$" /></td>
											<td class="cart__close"><span class="icon_close"></span></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-6 col-md-6 col-sm-6">
						<div class="cart__btn">
							<a href="${pageContext.request.contextPath}">Continue
								Shopping</a>
						</div>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-6">
						<div class="cart__btn update__btn">
							<input type="submit" value="Delete Selected Items"
								class="btn btn-danger">
						</div>
					</div>
				</div>
			</form>


			<div class="row">
				<div class="col-lg-6">
					<div class="discount__content">
						<h6>Discount codes</h6>
						<form action="#">
							<input type="text" placeholder="Enter your coupon code">
							<button type="submit" class="site-btn">Apply</button>
						</form>
					</div>
				</div>
				<div class="col-lg-4 offset-lg-2">
					<div class="cart__total__procced">
						<h6>Cart total</h6>
						<ul>
							<li>Subtotal <span>$ 750.0</span></li>
							<li>Total <span>$ 750.0</span></li>
							
						</ul>
						<form id="checkoutForm" action="checkout" method="get">
							<input type="submit" value="Proceed to checkout"
								class="btn btn-primary">
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Footer Section Begin -->
	<jsp:directive.include file="footer.jsp" />
	<!-- Footer Section End -->

	<!-- Search End -->

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

	<script>
	$(document).ready(function() {
	    // Prevent the default form submission
	    $("#checkoutForm").submit(function(event) {
	        event.preventDefault();

	        // Collect the selected items (checkboxes with the name "selectedItems")
	        var selectedItems = [];
	        $("input[name='selectedItems']:checked").each(function() {
	            selectedItems.push($(this).val());
	        });

	        // Check if any items are selected
	        if (selectedItems.length === 0) {
	            alert("Please select at least one item before checking out.");
	            return;
	        }

	        // Convert the array to a JSON string
	        var dataToSend = JSON.stringify({selectedItems });
			console.log(dataToSend)
	        // Perform an AJAX request to the "checkout" servlet with the selected items
	        $.ajax({
	            type: "GET",
	            url: "checkout",
	            data: { selectedItems: dataToSend }, // Send the JSON data as a parameter
	            contentType: "application/json; charset=utf-8",
	            success: function(data) {
	                // Handle the response from the servlet
	            	window.location.href = "checkout?selectedItems=" + encodeURIComponent(dataToSend);
	            },
	            error: function(xhr, status, error) {
	                console.error("Error: " + error);
	            }
	        });
	    });
	});
</script>

<script>
$(document).ready(function() {
    $(".quantity-input").on("change", function() {
        // Get the new quantity and cart item ID
        var newQuantity = $(this).val();
        var cartItemId = $(this).data("cart-item-id");

        // Prepare the data to be sent
        var dataToSend = {
            cartItemId: cartItemId,
            newQuantity: newQuantity
        };

        // Send an AJAX request to update the quantity in the database
        $.ajax({
            type: "POST", // You can use POST for updates
            url: "update_cart", // Replace with the actual URL to update quantity
            data: dataToSend, // Send the cart item ID and new quantity
            success: function(response) {
                // Handle the response from the server (if needed)
                console.log("Quantity updated successfully.");
            },
            error: function(xhr, status, error) {
                // Handle any errors that occur during the request
                console.error("Error: " + error);
            }
        });
    });
});
</script>



</body>
</html>
