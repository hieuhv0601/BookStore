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
	<jsp:directive.include file="header.jsp" />
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

	<!-- Checkout Section Begin -->
	<section class="checkout spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h6 class="coupon__link">
						<span class="icon_tag_alt"></span> <a href="#">Have a coupon?</a>
						Click here to enter your code.
					</h6>
				</div>
			</div>
			<form id="orderForm" action="place_order" method="post"
				class="checkout__form">
				<div class="row">
					<div class="col-lg-8">
						<h5>Billing detail</h5>
						<div class="row">
							<div class="address-section">
								<h2>Shipping Address</h2>
								<c:forEach var="address" items="${user.userAddresses}"
									varStatus="loop">
									<c:choose>
										<c:when test="${address.isPrimary == 1}">
											<div class="address" id="address-${loop.index}">
												<!-- Address details here -->
												<div class="card-body">
													<c:if test="${address.isPrimary == 1}">
														<span class="badge badge-primary">Default Address</span>
													</c:if>
													<p class="card-text">${loggedCustomer.firstName}
														${loggedCustomer.lastName} | ${loggedCustomer.telephone}</p>
													<p class="card-text">
														${address.addressLine1}, ${address.addressLine2},
														${address.street}, ${address.city}, ${address.state},
														${country.key} <br> <strong>Postal Code:</strong>
														${address.postalCode}
													</p>
												</div>
											</div>
										</c:when>
										<c:otherwise>
											<div class="address" id="address-${loop.index}"
												style="display: none;">
												<!-- Address details here -->
												<p>Address Line 1: ${address.addressLine1}</p>
												<p>Address Line 2: ${address.addressLine2}</p>
												<p>City: ${address.city}</p>
												<p>State: ${address.state}</p>
												<p>Postal Code: ${address.postalCode}</p>
												<p>Country: ${address.country}</p>
											</div>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<div class="dropdown">
									<button class="btn btn-primary dropdown-toggle" type="button"
										id="addressDropdown" data-toggle="dropdown"
										aria-haspopup="true" aria-expanded="false">Change
										Address</button>
									<div class="dropdown-menu" aria-labelledby="addressDropdown">
										<c:forEach var="address" items="${user.userAddresses}">
											<a class="dropdown-item" href="#"
												onclick="displayAddress(${address.addressId})">${address.addressLine1}</a>
										</c:forEach>
									</div>
								</div>
							</div>
							<div class="col-lg-12">
								<div class="shop__cart__table">
									<table>
										<thead>
											<tr>
												<th>Book Title</th>
												<th>Price</th>
												<th>Quantity</th>
												<th>Total</th>
												<th></th>
											</tr>
										</thead>
										<tbody>
											<c:set var="totalAmount" value="0" scope="page" />

											<c:forEach var="cartItem" items="${listItems}">
												<c:if
													test="${selectedItemIds.contains(cartItem.cartId.toString())}">
													<tr>
														<td class="cart__product__item"><c:forEach
																var="bookImage" items="${cartItem.books.bookImageses}">
																<c:if
																	test="${bookImage.books.bookId == cartItem.books.bookId && not empty bookImage}">
																	<img
																		src="data:image/jpg;base64, ${bookImage.base64Image}"
																		width="84" height="110" />
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
														<td class="cart__price">
															<div class="cart__price">${cartItem.quantity}</div>
														</td>
														<td class="cart__total"><fmt:formatNumber
																value="${cartItem.quantity * cartItem.books.price}"
																type="currency" currencySymbol="$" /></td>
														<c:set var="totalAmount"
															value="${totalAmount + (cartItem.quantity * cartItem.books.price)}"
															scope="page" />
													</tr>
												</c:if>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							<div class="col-lg-12">
								<div>
									<h2>Select Transport Unit</h2>

									<label for="transportUnit">Transport Unit:</label> <select
										name="transportUnit" id="transportUnit">
										<c:forEach var="unit" items="${transportUnits}">
											<option value="${unit.unitId}">${unit.name}</option>

										</c:forEach>

									</select> <input type="hidden" name="selectedTransportUnitId"
										id="selectedTransportUnitId" value="" />
								</div>
								<div class="checkout__form__checkbox">
									<label for="note"> Note about your order, e.g, special
										noe for delivery <input type="checkbox" id="note"> <span
										class="checkmark"></span>
									</label>
								</div>
								<div class="checkout__form__input">
									<p>
										Oder notes <span>*</span>
									</p>
									<input type="text"
										placeholder="Note about your order, e.g, special noe for delivery">
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="checkout__order">
							<h5>Your order</h5>

							<div class="checkout__order__product">
								<ul>
									<li><span class="top__text">Product</span> <span
										class="top__text__right">Total</span></li>
									<c:forEach var="cartItem" items="${listItems}" varStatus="loop">
										<c:if
											test="${selectedItemIds.contains(cartItem.cartId.toString())}">

											<li>0${loop.index + 1}.
												${fn:substring(cartItem.books.title, 0, 22)}... <span><fmt:formatNumber
														value="${cartItem.quantity * cartItem.books.price}"
														type="currency" currencySymbol="$" /></span>
											</li>
										</c:if>
									</c:forEach>
								</ul>
							</div>
							<div class="checkout__order__total">
								<ul>

									<li>Subtotal <span><fmt:formatNumber
												value="${totalAmount}" type="currency" currencySymbol="$" /></span></li>
										<!-- <li>Shipping <span><fmt:formatNumber value="${shippingPrice}" type="currency" currencySymbol="$" /></span></li> -->
									
								</ul>
								<input type="hidden" name="totalAmount" value="${totalAmount}" />
							</div>


							<div class="checkout__order__widget">
								<span>Payment</span>
								<p>Choose your payment method:</p>
								<select name="paymentMethod">
									<option value="Cash On Delivery">Cash On Delivery</option>
									<option value="Paypal">PayPal or Credit card</option>
								</select>
							</div>
							<button id="placeOrderButton" type="submit" class="site-btn">Place
								oder</button>
						</div>
					</div>
				</div>
			</form>
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
	<script>
    function displayAddress(addressId) {
        const addressElements = document.querySelectorAll(".address");
        
        // Hide all address elements
        addressElements.forEach((element) => {
            element.style.display = "none";
        });

        // Show the selected address by its ID
        const selectedAddress = document.getElementById(`address-${addressId}`);
        if (selectedAddress) {
            selectedAddress.style.display = "block";
        }
    }
    
 // Attach the sendToastNotificationInfo function to a button click event
    const placeOrderButton = document.getElementById("placeOrderButton");
    placeOrderButton.addEventListener("click", () => {
        // This code will run when the "Place Order" button is clicked
        // You can place any additional logic here before showing the notification
        console.log("Place Order button clicked"); // Add this line
        sendToastNotificationInfo(); // Call the function to show the toast notification
    });
   

</script>
</body>
</html>
