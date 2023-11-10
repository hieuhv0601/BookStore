<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="apple-touch-icon" sizes="76x76"
	href="${pageContext.request.contextPath}/assets/img/apple-icon.png">
<link rel="icon" type="image/png"
	href="${pageContext.request.contextPath}/assets/img/favicon.png">
<title>Soft UI Dashboard by Creative Tim</title>
<!--     Fonts and icons     -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
	rel="stylesheet" />
<!-- Nucleo Icons -->
<link
	href="${pageContext.request.contextPath}/assets/css/nucleo-icons.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/assets/css/nucleo-svg.css"
	rel="stylesheet" />
<!-- Font Awesome Icons -->
<script src="https://kit.fontawesome.com/42d5adcbca.js"
	crossorigin="anonymous"></script>
<link
	href="${pageContext.request.contextPath}/assets/css/nucleo-svg.css"
	rel="stylesheet" />
<!-- CSS Files -->
<link id="pagestyle"
	href="${pageContext.request.contextPath}/assets/css/soft-ui-dashboard.css?v=1.0.3"
	rel="stylesheet" />
</head>

<body class="">
	
	<div class="container position-sticky z-index-sticky top-0">

		<main class="main-content  mt-0">
			<section>
				<div class="page-header min-vh-75">
					<div class="container">
						<div class="row">
							<div
								class="col-xl-4 col-lg-5 col-md-6 d-flex flex-column mx-auto">
								<div class="card card-plain mt-8">
									<div class="card-header pb-0 text-left bg-transparent">
										<h3 class="font-weight-bolder text-info text-gradient">Welcome
											back</h3>
										<p class="mb-0">Enter your email and password to sign in</p>
									</div>
									<div class="card-body">
										<form role="form" id="loginForm" action="login" method="post">
											<label>Email</label>
											<div class="mb-3">
												<input type="email" class="form-control" placeholder="Email"
													aria-label="Email" id="email" name="email"
													aria-describedby="email-addon">
											</div>
											<label>Password</label>
											<div class="mb-3">
												<input type="password" class="form-control"
													placeholder="Password" aria-label="Password" id="password"
													name="password" aria-describedby="password-addon">
											</div>
											<div class="form-check form-switch">
												<input class="form-check-input" type="checkbox"
													id="rememberMe" checked=""> <label
													class="form-check-label" for="rememberMe">Remember
													me</label>
											</div>
											<div class="text-center">
												<button type="submit"
													class="btn bg-gradient-info w-100 mt-4 mb-0" value="submit">Sign
													in</button>
											</div>
										</form>
									</div>
									<div class="card-footer text-center pt-0 px-lg-2 px-1">
										<p class="mb-4 text-sm mx-auto">
											Don't have an account? <a href="register"
												class="text-info text-gradient font-weight-bold">Sign up</a>
										</p>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div
									class="oblique position-absolute top-0 h-100 d-md-block d-none me-n8">
									<div
										class="oblique-image bg-cover position-absolute fixed-top ms-auto h-100 z-index-0 ms-n6"
										style="background-image: url('${pageContext.request.contextPath}/assets/img/curved-images/curved6.jpg')"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</main>
	</div>


	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.min.js"></script>
	<!--   Core JS Files   -->
	<script
		src="${pageContext.request.contextPath}/assets/js/authenJs/core/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/authenJs/core/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/authenJs/plugins/perfect-scrollbar.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/authenJs/plugins/smooth-scrollbar.min.js"></script>

	<!-- Github buttons -->
	<script async defer src="https://buttons.github.io/buttons.js"></script>
	<!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->
	<script
		src="${pageContext.request.contextPath}/assets/js/authenJs/soft-ui-dashboard.min.js?v=1.0.3"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#loginForm").validate({
				rules : {
					email : {
						required : true,
						email : true
					},

					password : "required",
				},

				messages : {
					email : {
						required : "Please enter email",
						email : "Please enter an valid email address"
					},

					password : "Please enter password"
				}
			});

		});
	</script>
</body>

</html>