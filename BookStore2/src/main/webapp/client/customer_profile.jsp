<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Amazon Book Store | Customer Profile</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon" href="assets/img/icon.png">

<!-- CSS here -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="assets/css/flaticon.css">
<link rel="stylesheet" href="assets/css/slicknav.css">
<link rel="stylesheet" href="assets/css/animate.min.css">
<link rel="stylesheet" href="assets/css/magnific-popup.css">
<link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
<link rel="stylesheet" href="assets/css/themify-icons.css">
<link rel="stylesheet" href="assets/css/slick.css">
<link rel="stylesheet" href="assets/css/nice-select.css">
<link rel="stylesheet" href="assets/css/style.css">
<script type="text/javascript" src="./assets/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="./assets/js/jquery.validate.min.js"></script>
</head>
<body>
    <header>
        <!-- Header Start -->
        <jsp:directive.include file="header.jsp" />
        <!-- Header End -->
    </header>
    <main>
        <!-- Login Part Area -->
        <section class="login-part">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-6 col-md-6">
                        <div class="login-part-text text-center">
                            <div class="login-part-text-inner">
                                <h2>Do you already have an account?</h2>
                                <p>Help with your account | Subscriptions | Unsubscribe | Terms of Use and Privacy | Cookie Preferences</p>
                                <a href="${pageContext.request.contextPath}/" class="btn-3">Home Page</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="login-part-form">
                            <div class="login-part-form-inner">
                            <br>
                                <h3>Profile & Settings</h3>
                                <h3>${message}</h3>
                                <form class="row contact-form" action="update_profile" method="post" id="customerForm">
                                    <!-- Email Field -->
                                    <div class="col-md-12 form-group p-star">
                                        <label style="color: red;">Username(*)</label>
                                        <input type="text" class="form-control" placeholder="${loggedCustomer.username}" readonly="readonly">
                                    </div>
                                    <div class="col-md-12 form-group p-star">
                                        <label for="email">Email(*)</label>
                                        <input type="text" class="form-control"id="email" name="email"  value="${loggedCustomer.email}">
                                    </div>
                                    <!-- First Name Field -->
                                    <div class="col-md-12 form-group p-star">
                                    <label for="firstname">First Name(*)</label>
                                        <input type="text" class="form-control" id="firstname" name="firstname" size="45" placeholder="First Name(*)" value="${loggedCustomer.firstName}">
                                    </div>
                                    <!-- Last Name Field -->
                                    <div class="col-md-12 form-group p-star">
                                    <label for="lastname">Last Name(*)</label>
                                        <input type="text" class="form-control" id="lastname" name="lastname" size="45" placeholder="Last Name(*)" value="${loggedCustomer.lastName}">
                                    </div>
                                    <!-- Password Fields -->
                                    <label for="password">Password(*)</label>
                                    <div class="col-md-12 form-group p-star">
                                        <input type="password" class="form-control" id="password" name="password" size="15" placeholder="Password">
                                    </div>
                                    <div class="col-md-12 form-group p-star">
                                    <label for="confirmPassword">Confirm Password(*)</label>
                                        <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" size="15" placeholder="Confirm Password">
                                    </div>
                                    <!-- Phone Field -->
                                    <div class="col-md-12 form-group p-star">
                                    <label for="telephone">Phone number(*)</label>
                                        <input type="text" class="form-control" id="telephone" name="telephone" size="15" placeholder="Phone(*)" value="${loggedCustomer.telephone}">
                                    </div>
                                    <c:forEach items="${loggedCustomer.userAddresses}" var="address">
                                        <!-- Address Line 1 -->
                                        <div class="col-md-12 form-group p-star">
                                            <label for="addressLine1">Address Line 1(*)</label>
                                            <input type="text" class="form-control" id="addressLine1" name="addressLine1" size="45" value="${address.addressLine1}">
                                        </div>
                                        <!-- Address Line 2 -->
                                        <div class="col-md-12 form-group p-star">
                                            <label for="addressLine2">Address Line 2(*)</label>
                                            <input type="text" class="form-control" id="addressLine2" name="addressLine2" size="45" value="${address.addressLine2}">
                                        </div>
                                        <!-- Street -->
                                        <div class="col-md-12 form-group p-star">
                                            <label for="street">Street(*)</label>
                                            <input type="text" class="form-control" id="street" name="street" size="45" value="${address.city}">
                                        </div>
                                        <!-- City -->
                                        <div class="col-md-12 form-group p-star">
                                            <label for="city">City(*)</label>
                                            <input type="text" class="form-control" id="city" name="city" size="45" value="${address.city}">
                                        </div>
                                        <!-- State -->
                                        <div class="col-md-12 form-group p-star">
                                            <label for="state">State(*)</label>
                                            <input type="text" class="form-control" id="state" name="state" size="45" value="${address.state}">
                                        </div>
                                        <!-- Zip Code -->
                                        <div class="col-md-12 form-group p-star">
                                            <label for="postalCode">Postal Code(*)</label>
                                            <input type="text" class="form-control" id="postalCode" name="postalCode" size="45" value="${address.postalCode}">
                                        </div>
                                        <div class="col-md-12 form-group p-star">
                                        <select class="form-select" name="country" id="country">
                                            <c:forEach items="${mapCountries}" var="country">
                                                <option value="${country.value}" <c:if test="${address.country eq country.value}">selected='selected'</c:if>>${country.key}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    </c:forEach>
                                    <!-- Country Dropdown (You can uncomment this section if needed) -->
                                    <!-- Update Button -->
                                    <div class="col-md-12 form-group">
                                        <button type="submit" value="submit" class="btn-3">Update Your Account</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
		<!--================login_part end =================-->
	</main>
	<footer>
		<!-- Footer Start-->
		<jsp:directive.include file="footer.jsp" />
		<!-- Footer End-->
	</footer>

	<!-- JS here -->
	<script type="text/javascript">
		$(document).ready(function() {
			$("#customerForm").validate({
				rules : {
					email : {
						required : true,
						email : true
					},
					firstname : "required",
					lastname : "required",

					confirmPassword : {
						equalTo : "#password"
					},

					phone : "required",
					address1 : "required",
					address2 : "required",
					city : "required",
					state : "required",
					zipCode : "required",
					country : "required",
				},

				messages : {
					email : {
						required : "Please enter e-mail address",
						email : "Please enter a valid e-mail address"
					},

					firstname : "Please enter first name",
					lastname : "Please enter last name",

					confirmPassword : {
						equalTo : "Confirm password does not match password"
					},

					phone : "Please enter phone number",
					address1 : "Please enter address line 1",
					address2 : "Please enter address line 2",
					city : "Please enter city",
					state : "Please enter state",
					zipCode : "Please enter zip code",
					country : "Please enter country",
				}
			});

		});
	</script>

	<script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>
	<!-- Jquery, Popper, Bootstrap -->

	<script src="./assets/js/popper.min.js"></script>
	<script src="./assets/js/bootstrap.min.js"></script>
	<!-- Jquery Mobile Menu -->
	<script src="./assets/js/jquery.slicknav.min.js"></script>

	<!-- Jquery Slick , Owl-Carousel Plugins -->
	<script src="./assets/js/owl.carousel.min.js"></script>
	<script src="./assets/js/slick.min.js"></script>

	<!-- One Page, Animated-HeadLin -->
	<script src="./assets/js/wow.min.js"></script>
	<script src="./assets/js/animated.headline.js"></script>

	<!-- Scroll up, nice-select, sticky -->
	<script src="./assets/js/jquery.scrollUp.min.js"></script>
	<script src="./assets/js/jquery.nice-select.min.js"></script>
	<script src="./assets/js/jquery.sticky.js"></script>
	<script src="./assets/js/jquery.magnific-popup.js"></script>

	<!-- contact js -->
	<script src="./assets/js/contact.js"></script>
	<script src="./assets/js/jquery.form.js"></script>
	<script src="./assets/js/mail-script.js"></script>
	<script src="./assets/js/jquery.ajaxchimp.min.js"></script>

	<!-- Jquery Plugins, main Jquery -->
	<script src="./assets/js/plugins.js"></script>
	<script src="./assets/js/main.js"></script>

</body>

</html>