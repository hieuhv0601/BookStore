<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Page Title</title>
<!-- Include Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="#"> <img
			src="<%=request.getContextPath()%>/images/3inu.png" width="30"
			src="../images/3inu.png" width="30"
			height="30" class="d-inline-block align-top" alt="Logo">
		</a>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item active">Welcome, <c:if
						test="${not empty sessionScope.username}">
                        ${sessionScope.username} | 
                    </c:if>
				</li>
				<li class="nav-item"><c:choose>
						<c:when test="${empty sessionScope.useremail}">
							<!-- User not logged in -->
							<a href="<%=request.getContextPath()%>/login">Login</a>
						</c:when>
						<c:otherwise>
							<!-- User logged in -->
                            <a
								href="<%=request.getContextPath()%>/admin/logout">Logout</a>
						</c:otherwise>
					</c:choose></li>
			</ul>
		</div>
	</nav>
	<div class="container mt-4">
		<div class="row">
			<div class="col">
				<a class="btn btn-primary btn-lg btn-block" href="list_users">Users</a>
			</div>
			<div class="col">
				<a class="btn btn-primary btn-lg btn-block" href="list_categories">Categories</a>
			</div>
			<div class="col">
				<a class="btn btn-primary btn-lg btn-block" href="list_books">Books</a>
			</div>
			<div class="col">
				<a class="btn btn-primary btn-lg btn-block" href="list_reviews">Reviews</a>
			</div>
			<div class="col">
				<a class="btn btn-primary btn-lg btn-block" href="list_orders">Orders</a>
			</div>
			<div class="col">
				<a class="btn btn-primary btn-lg btn-block" href="list_employees">Employees</a>
			</div>
		</div>
	</div>
	<!-- Include Bootstrap JS and jQuery -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>