<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<link rel="icon" href="favicon.ico" />
<title>Tiny Dashboard - A Bootstrap Dashboard Template</title>
<!-- Simple bar CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/admin/simplebar.css" />
<!-- Fonts CSS -->
<link
	href="https://fonts.googleapis.com/css2?family=Overpass:ital,wght@0,100;0,200;0,300;0,400;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet" />
<!-- Icons CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/admin/feather.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/admin/dataTables.bootstrap4.css" />
<!-- Date Range Picker CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/admin/daterangepicker.css" />
<!-- App CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/admin/app-light.css"
	id="lightTheme" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/admin/app-dark.css"
	id="darkTheme" disabled />
</head>
<body class="vertical light">
	<div class="wrapper">
		<jsp:directive.include file="header.jsp" />
		<jsp:directive.include file="sidebar.jsp" />
		<main role="main" class="main-content">
			<div class="container-fluid">
				<div class="row justify-content-center">
					<div class="col-12">
						<div class="row">
							<!-- Small table -->
							<div class="col-md-12 my-4">
								<h2 class="h4 mb-1">Users List</h2>

								<div class="card shadow">
									<div class="card-body">
										<div class="toolbar">
											<form class="form">
												<div class="form-row">
													<div class="form-group col-auto mr-auto">
														<label class="my-1 mr-2 sr-only"
															for="inlineFormCustomSelectPref1">Show</label> <select
															class="custom-select mr-sm-2"
															id="inlineFormCustomSelectPref1">
															<option value="">...</option>
															<option value="1">12</option>
															<option value="2" selected>32</option>
															<option value="3">64</option>
															<option value="3">128</option>
														</select>
													</div>
													<div class="form-group col-auto">
														<label for="search" class="sr-only">Search</label> <input
															type="text" class="form-control" id="search1" value=""
															placeholder="Search">
													</div>
												</div>
											</form>
										</div>
										<!-- table -->
										<table class="table table-borderless table-hover">
											<thead>
												<tr>
													<td>
														<div class="custom-control custom-checkbox">
															<input type="checkbox" class="custom-control-input"
																id="all2"> <label class="custom-control-label"
																for="all2"></label>
														</div>
													</td>
													<th>Index</th>
													<th>ID</th>
													<th>Image</th>
													<th>Title</th>
													<th>Author</th>
													<th>Category</th>
													<th>Price</th>
													<th>Publish Date</th>
													<th>Actions</th>
												</tr>
											</thead>
											<c:forEach var="book" items="${listBooks}" varStatus="status">
												<tbody>
													<tr>

														<td>
															<div class="custom-control custom-checkbox">
																<input type="checkbox" class="custom-control-input"
																	id="${book.bookId}"> <label
																	class="custom-control-label" for="${book.bookId}"></label>
															</div>
														</td>
														<td><small class="mb-0 text-muted">${status.index}</small>
														</td>
														<td>
															<p class="mb-0 text-muted">
																<strong>${book.bookId}</strong>
															</p>
														</td>
														<td><c:forEach var="bookImage"
																items="${book.bookImageses}">
																<c:if
																	test="${bookImage.books.bookId == book.bookId && not empty bookImage}">
																	<img
																		src="data:image/jpg;base64, ${bookImage.base64Image}"
																		width="84" height="110" />
																</c:if>
															</c:forEach></td>
														<td>
															<p class="mb-0 text-muted">
																<strong>${book.title}</strong>
															</p>
														</td>
														<td>
															<p class="mb-0 text-muted">${book.author}</p>
														</td>
														<td>
															<p class="mb-0 text-muted">${book.categories.categoryName}</p>
														</td>
														<td>
															<p class="mb-0 text-muted">$ ${book.price}</p>
														</td>
														<td><fmt:formatDate pattern='MM/dd/yyyy'
																value='${book.publishDate}' /></td>
														<td><button
																class="btn btn-sm dropdown-toggle more-horizontal"
																type="button" data-toggle="dropdown"
																aria-haspopup="true" aria-expanded="false">
																<span class="text-muted sr-only">Action</span>
															</button>
															<div class="dropdown-menu dropdown-menu-right">
																<a class="dropdown-item"
																	href="edit_review?id=${review.reviewId}">Edit</a> <a
																	class="dropdown-item" href="#"
																	onclick="confirmDelete(${review.reviewId}); return false;">Remove</a>
															</div></td>
													</tr>
												</tbody>
											</c:forEach>
										</table>
										<nav aria-label="Table Paging" class="mb-0 text-muted">
											<ul class="pagination justify-content-center mb-0">
												<li class="page-item"><a class="page-link" href="#">Previous</a></li>
												<li class="page-item"><a class="page-link" href="#">1</a></li>
												<li class="page-item active"><a class="page-link"
													href="#">2</a></li>
												<li class="page-item"><a class="page-link" href="#">3</a></li>
												<li class="page-item"><a class="page-link" href="#">Next</a></li>
											</ul>
										</nav>
									</div>
								</div>
							</div>
							<!-- customized table -->
						</div>
						<!-- .row -->
					</div>
					<!-- .container-fluid -->
				</div>
			</div>
		</main>
		<!-- main -->
	</div>

	<!-- JS plugins -->
	<script
		src="${pageContext.request.contextPath}/assets/js/admin/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/admin/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/admin/moment.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/admin/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/admin/simplebar.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/admin/daterangepicker.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/admin/jquery.stickOnScroll.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/admin/tinycolor-min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/admin/config.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/admin/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/admin/dataTables.bootstrap4.min.js"></script>
	<script>
        function confirmDelete(userId) {
            if (confirm("Are you sure to delete the user with ID " + userId + "?")) {
                window.location = "delete_user?id=" + userId;
            }
        }
    </script>
</body>
</html>
