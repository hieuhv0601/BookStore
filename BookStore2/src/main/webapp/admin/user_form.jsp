<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><c:choose><c:when test="${user != null}">Edit User</c:when><c:otherwise>Create New User</c:otherwise></c:choose> - BookStore</title>
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>
    <div class="container mt-4">
        <jsp:directive.include file="header.jsp" />
        
        <div class="text-center">
            <h2><c:choose><c:when test="${user != null}">Edit User</c:when><c:otherwise>Create New User</c:otherwise></c:choose></h2>
        </div>
        <div class="text-center mt-3">
            <form
            	<c:choose>
            <c:when test="${user != null}">action="update_user"</c:when>
            <c:otherwise>action="create_user"</c:otherwise>
            	</c:choose>
                method="post" onsubmit="return validateFormInput()">
                <input type="hidden" name="userId" value="${user.userId}" />
                <div class="form-row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="username">Username</label>
                            <input type="text" class="form-control" id="username" name="username" size="20" value="${user.username}" />
                        </div>
                        <div class="form-group">
                            <label for="firstName">First Name</label>
                            <input type="text" class="form-control" id="firstName" name="firstName" size="20" value="${user.firstName}" />
                        </div>
                        <div class="form-group">
                            <label for="email">E-mail Address</label>
                            <input type="text" class="form-control" id="email" name="email" size="20" value="${user.email}" />
                        </div>
                        <div class="form-group">
                            <label for="telephone">Phone number</label>
                            <input type="text" class="form-control" id="telephone" name="telephone" size="20" value="${user.telephone}" />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="lastName">Last Name</label>
                            <input type="text" class="form-control" id="lastName" name="lastName" size="20" value="${user.lastName}" />
                        </div>
         
				<div class="form-group">
				    <label for="role">Role</label>
				    <select class="form-control" id="role" name="role">
				        <c:choose>
				            <c:when test="${empty user.userId}">
				                <!-- When creating a new user, display a dropdown with 4 role options -->
				                <option value="customer">Customer</option>
				                <option value="guest">Guest</option>
				                <option value="admin">Admin</option>
				                <option value="employee">Employee</option>
				            </c:when>
				            <c:otherwise>
				                <!-- When editing an existing user, display all role options and preselect the user's current role -->
				                <c:forEach var="userRole" items="${user.userRoleses}">
				                    <option value="customer" <c:if test="${userRole.role eq 'customer'}">selected</c:if>>Customer</option>
				                    <option value="guest" <c:if test="${userRole.role eq 'guest'}">selected</c:if>>Guest</option>
				                    <option value="admin" <c:if test="${userRole.role eq 'admin'}">selected</c:if>>Admin</option>
				                    <option value="employee" <c:if test="${userRole.role eq 'employee'}">selected</c:if>>Employee</option>
				                </c:forEach>
				            </c:otherwise>
				        </c:choose>
				    </select>
				</div>



                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" class="form-control" id="password" name="password" size="20" value="${user.password}" />
                        </div>
                        <div class="form-group">
                            <label for="confirmPassword">Confirm Password</label>
                            <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" size="20" />
                        </div>
                        <div class="form-group text-center">
                            <input type="submit" class="btn btn-primary" value="Save" />
                            <input type="button" class="btn btn-secondary" value="Cancel" onclick="javascript:history.go(-1);" />
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <hr class="mt-4">
    </div>

    <jsp:directive.include file="footer.jsp" />

    <!-- Include Bootstrap JS and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/script.js"></script>
</body>
</html>
