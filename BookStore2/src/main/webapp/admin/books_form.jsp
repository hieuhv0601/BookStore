<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Create New Book</title>
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900|Roboto+Slab:400,700" />

<style>
/* Add custom CSS styles here */
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
}

.container {
	max-width: 800px;
	margin: 0 auto;
	background-color: #fff;
	padding: 20px;
	border: 1px solid #e1e1e1;
	border-radius: 5px;
	box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.2);
}

.form-group {
	margin-bottom: 15px;
}

label {
	font-weight: bold;
}

input[type="text"], input[type="date"], input[type="file"], textarea {
	width: 100%;
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 3px;
	font-size: 14px;
}

input[type="file"] {
	cursor: pointer;
}

select {
	width: 100%;
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 3px;
	font-size: 14px;
	background-color: #fff;
}

.thumbnail {
	max-width: 100%;
	height: auto;
	margin-top: 10px;
}

.btn {
	padding: 10px 20px;
	background-color: #007BFF;
	color: #fff;
	border: none;
	border-radius: 3px;
	cursor: pointer;
}

.btn-secondary {
	background-color: #6c757d;
}
</style>
</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<div class="container">
		<h2 class="pageheading">
			<c:if test="${book != null}">Edit Book</c:if>
			<c:if test="${book == null}">Create New Book</c:if>
		</h2>

		<c:choose>
			<c:when test="${book != null}">
				<form action="update_book" method="post"
					enctype="multipart/form-data" onsubmit="return validateFormInput()">
					<input type="hidden" name="bookId" value="${book.bookId}">
			</c:when>
			<c:otherwise>
				<form action="create_book" method="post"
					enctype="multipart/form-data" onsubmit="return validateFormInput()">
			</c:otherwise>
		</c:choose>

		<div class="form-group">
			<label for="category">Category:</label> <select id="category"
				name="category">
				<c:forEach items="${listCategory}" var="category">
					<option value="${category.categoryId}"
						<c:if test="${category.categoryId eq book.categories.categoryId}">selected</c:if>>${category.categoryName}</option>
				</c:forEach>
			</select>
		</div>
		<div class="form-group">
			<label for="title">Title:</label> <input type="text" id="title"
				name="title" value="${book.title}" />
		</div>
		<div class="form-group">
			<label for="author">Author:</label> <input type="text" id="author"
				name="author" value="${book.author}" />
		</div>
		<div class="form-group">
			<label for="isbn">ISBN:</label> <input type="text" id="isbn"
				name="isbn" value="${book.isbn}" />
		</div>

		<div class="form-group">
			<label for="publishDate">Publish Date:</label> <input type="date"
				id="publishDate" name="publishDate"
				value="<fmt:formatDate pattern='yyyy-MM-dd' value='${book.publishDate}' />" />
		</div>


		<div class="text-center">
			<div class="text-center">
				<label>File Image(*)</label>
				<c:choose>
					<c:when test="${empty book.bookId || empty book.bookImageses}">
						<input type="file" id="bookImage" name="bookImage" size="20"
							accept="image/*" onchange="showImageThumbnail(this);" />
						<img class="thumbnail" id="thumbnail" alt="Image Preview"
							style="width: 200px; margin-top: 10px" />
					</c:when>
					<c:otherwise>
						<c:forEach var="bookImage" items="${book.bookImageses}">
							<input type="file" id="bookImage" name="bookImage" size="20"
								accept="image/*" onchange="showImageThumbnail(this);" />
							<img src="data:image/jpeg;base64,${bookImage.base64Image}"
								class="thumbnail" id="thumbnail" alt="Existing Image"
								style="width: 500px; margin-top: 10px" />
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="form-group">
			<label for="price">Price:</label> <input type="text" id="price"
				name="price" value="${book.price}" />
		</div>
		<div class="form-group">
			<label for="description">Description:</label>
			<textarea rows="5" cols="50" name="description" id="description">${book.description}</textarea>
		</div>
		<div class="text-center">
			<input type="submit" class="btn btn-lg bg-gradient-warning"
				value="Save" /> <input type="button" id="buttonCancel"
				class="btn btn-secondary" value="Cancel"
				onclick="javascript:history.go(-1);" />
		</div>
		</form>
	</div>

	<jsp:directive.include file="footer.jsp" />
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.19.3/jquery.validate.min.js"></script>

<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery.richtext/0.11.4/jquery.richtext.min.js"></script>
<script src="https://cdn.tiny.cloud/1/89vrcxyt5wjvsi64edxn0d9f43lyx5c9tnqzikjg9ffryytw/tinymce/6/tinymce.min.js" referrerpolicy="origin"></script>
<script type="text/javascript">
tinymce.init({
    selector: "textarea#description",
    plugins: "autoresize",
    toolbar: "undo redo | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link",
    autoresize_max_height: 400,
    autoresize_bottom_margin: 16,
});

$(document).ready(function() {
	$('#publishDate').datepicker();
	$('#description').richText();
	
	$('#bookImage').change(function() {
		showImageThumbnail(this);
	});
	
	
	$("#bookForm").validate({
		rules: {
			category: "required",
			title: "required",
			author: "required",
			isbn: "required",
			publishDate: "required",
			
			<c:if test="${book == null}">
			bookImage: "required",
			</c:if>
			
			price: "required",
			description: "required",
		},
		
		messages: {
			category: "Please select a category for the book",
			title: "Please enter title of the book",
			author: "Please enter author of the book",
			isbn: "Please enter ISBN of the book",
			publishDate: "Please enter publish date of the book",
			bookImage: "Please choose an image of the book",
			price: "Please enter price of the book",
			description: "Please enter description of the book"
		}
	});
	
});


function showImageThumbnail(fileInput) {
	var file = fileInput.files[0];
	
	var reader = new FileReader();
	
	reader.onload = function(e) {
		$('#thumbnail').attr('src', e.target.result);
	};
	
	reader.readAsDataURL(file);
}
</script>
</html>
