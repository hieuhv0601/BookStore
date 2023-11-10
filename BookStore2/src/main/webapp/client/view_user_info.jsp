<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit User Information</title>

<!-- Include Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- Include jQuery UI CSS (You may need to adjust the path) -->
<link rel="stylesheet" href="path-to-your-jquery-ui-theme.css">

<!-- Include your custom CSS styles -->
<style>
.edit-user-info {
	padding: 20px;
}

.form-group {
	margin-bottom: 15px;
}

label {
	font-weight: bold;
}
/* Additional custom styles can be added here */
</style>
</head>
<body>
	<header>
		<!-- Header content here -->
		<jsp:directive.include file="header.jsp" />
	</header>
	<main>
		<section class="edit-user-info">
			<div class="container">
				<h2>Edit User Information</h2>
				<form action="${pageContext.request.contextPath}/updateUserInfo"
					method="post">
					<div class="form-group">
						<label for="username">Username:</label> <input type="text"
							id="username" name="username" value="${loggedCustomer.username}"
							class="form-control" disabled>
					</div>
					<div class="form-group">
						<label for="email">Email:</label> <input type="text" id="email"
							name="email" value="${loggedCustomer.email}" class="form-control">
					</div>
					<div class="form-group">
						<label for="firstName">First Name:</label> <input type="text"
							id="firstName" name="firstName"
							value="${loggedCustomer.firstName}" class="form-control">
					</div>
					<div class="form-group">
						<label for="lastName">Last Name:</label> <input type="text"
							id="lastName" name="lastName" value="${loggedCustomer.lastName}"
							class="form-control">
					</div>
					<div class="form-group">
						<label for="telephone">Phone:</label> <input type="text"
							id="telephone" name="telephone"
							value="${loggedCustomer.telephone}" class="form-control">
					</div>
					<div>
						<button type="submit" class="btn btn-primary">Update
							Information</button>
						<a href="${pageContext.request.contextPath}/userInfo"
							class="btn btn-secondary">Cancel</a>
					</div>
					<!-- Add more fields for other user information -->

				</form>

			</div>
		</section>
	</main>
	<footer>
		<!-- Footer content here -->
	</footer>

	<!-- Include Bootstrap JS (if needed) -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
