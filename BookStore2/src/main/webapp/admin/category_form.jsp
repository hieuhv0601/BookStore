<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<div align="center">
		<h2>
			<c:if test="${category != null }"> Edit Category</c:if>
			<c:if test="${category == null }"> Create New Category</c:if>
		</h2>
	</div>
	<div align="center">
		<c:if test="${category != null }">
			<form action="update_category" method="post"
				onsubmit="return validateFormInput()">
				<input type="hidden" name="categoryId"
					value="${category.categoryId}">
		</c:if>

		<c:if test="${category == null }">
			<form action="create_category" method="post"
				onsubmit="return validateFormInput()">
		</c:if>
		<table>

			<tr>
				<td>Category Name</td>
				<td><input type="text" id="categoryName" name="categoryName"
					size="20" value=${category.categoryName}></td>
			</tr>

			<tr>
				<td>Category Slug</td>
				<td><input type="text" id="categorySlug" name="categorySlug"
					size="20" value=${category.categorySlug}></td>
			</tr>

			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr align="center">
				<td colspan="2" align="center"><input type="submit"
					value="Save"> <input type="button" value="Cancel"
					onclick="javascript:history.go(-1);"></td>
			</tr>
		</table>
		</form>
	</div>

	<div align="center">
		<hr width="60%">

	</div>

	<jsp:directive.include file="footer.jsp" />

	<script type="text/javascript">
		function validateFormInput() {
			var fieldCategoryName = document.getElementById("categoryName");
			var fieldCategorySlug = document.getElementById("categorySlug");

			if (fieldCategoryName.value.length == 0) {
				alert("Category name is required!");
				fieldCategoryName.focus();
				return false;
			}
			if (fieldCategorySlug.value.length == 0) {
				alert("Category slug is required!");
				fieldEmail.focus();
				return false;
			}
			return true;
		}
	</script>
</body>

</html>