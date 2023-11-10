<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Profile</title>
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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style type="text/css">
/* Style for the form */
.contact-form {
    margin: 20px;
    padding: 20px;
    background-color: #f8f9fa;
    border: 1px solid #ccc;
    border-radius: 10px;
}

/* Style for the address section */
.address-section {
    margin-bottom: 20px;
    padding: 20px;
    background-color: #ffffff;
    border: 1px solid #ddd;
    border-radius: 10px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

/* Style for the "Update" button */
.update-button {
    float: right;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 5px;
    padding: 10px 20px;
    cursor: pointer;
    font-weight: bold;
}

.update-button:hover {
    background-color: #0056b3;
}

/* Style for the "Update Your Account" button */
.update-your-account-button {
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 5px;
    padding: 10px 20px;
    cursor: pointer;
    font-weight: bold;
}

.update-your-account-button:hover {
    background-color: #0056b3;
}
</style>
</head>
<body>
    <!-- Your header content -->
    <jsp:directive.include file="header.jsp" />

    <form class="row contact-form" action="" method="post" id="customerForm">
        <c:forEach items="${loggedCustomer.userAddresses}" var="address" varStatus="loop">
            <div class="col-md-6">
                <div class="card mb-4">
                    <div class="card-header">
                        <h4>Address ${loop.index + 1}</h4>
                        <c:if test="${address.isPrimary == 1}">
                            <span class="badge badge-primary">Default Address</span>
                        </c:if>
                    </div>
                    <div class="card-body">
                        <p class="card-text">
                            ${loggedCustomer.firstName} ${loggedCustomer.lastName} | ${loggedCustomer.telephone}
                        </p>
                        <p class="card-text">
                            ${address.addressLine1}, ${address.addressLine2}, ${address.street}, ${address.city}, ${address.state}, ${country.key}
                            <br><strong>Postal Code:</strong> ${address.postalCode}
                        </p>
                    </div>
                    <div class="card-footer text-right">
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#updateModal"
                            data-address-line1="${address.addressLine1}"
                            data-address-line2="${address.addressLine2}"
                            data-street="${address.street}" data-city="${address.city}"
                            data-state="${address.state}"
                            data-postal-code="${address.postalCode}"
                            data-country="${address.country}">
                            Update Address
                        </button>
                    </div>
                </div>
            </div>
        </c:forEach>
    </form>

    <!-- Update Address Modal -->
    <form class="row contact-form" action="" method="post" id="customerForm">
        <c:forEach items="${loggedCustomer.userAddresses}" var="address" varStatus="loop">
    <div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <!-- Input fields for updating the address data -->
                    <table class="table">
                        <tr>
                            <td><label for="updateAddressLine1">Address Line 1(*)</label></td>
                            <td><input type="text" class="form-control" id="updateAddressLine1" name="updateAddressLine1" value="${address.addressLine1}"></td>
                        </tr>
                        <tr>
                            <td><label for="updateAddressLine2">Address Line 2(*)</label></td>
                            <td><input type="text" class="form-control" id="updateAddressLine2" name="updateAddressLine2" value="${address.addressLine2}"></td>
                        </tr>
                        <tr>
                            <td><label for="updateStreet">Street(*)</label></td>
                            <td><input type="text" class="form-control" id="updateStreet" name="updateStreet" value="${address.street}"></td>
                        </tr>
                        <tr>
                            <td><label for="updateCity">City(*)</label></td>
                            <td><input type="text" class="form-control" id="updateCity" name="updateCity" value="${address.city}"></td>
                        </tr>
                        <tr>
                            <td><label for="updateState">State(*)</label></td>
                            <td><input type="text" class="form-control" id="updateState" name="updateState" value="${address.state}"></td>
                        </tr>
                        <tr>
                            <td><label for="updatePostalCode">Postal Code(*)</label></td>
                            <td><input type="text" class="form-control" id="updatePostalCode" name="updatePostalCode" value="${address.postalCode}"></td>
                        </tr>
                        <tr>
                            <td><label for="updateCountry">Country(*)</label></td>
                            <td>
                                <select class="form-select" name="updateCountry" id="updateCountry">
                                    <!-- Populate the country options here -->
                                    <c:forEach items="${mapCountries}" var="country">
                                        <option value="${country.value}">${country.key}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                    </table>
                </div>
                	<div class="modal-footer">
                            <!-- Save and Cancel buttons -->
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                            <button type="button" class="btn btn-primary" id="saveChangesButton${loop.index}">Save</button>
                   </div>
            </div>
        </div>
    </div>
     </c:forEach>
    </form>
    <!-- Your footer content -->
    <jsp:directive.include file="footer.jsp" />

    <script>
        $(document).ready(function() {
            $('.update-button').on('click', function() {
                // Get the address data from the data attributes
                var addressLine1 = $(this).data('address-line1');
                var addressLine2 = $(this).data('address-line2');
                var street = $(this).data('street');
                var city = $(this).data('city');
                var state = $(this).data('state');
                var postalCode = $(this).data('postal-code');
                var country = $(this).data('country');

                // Populate the modal with address data
                var modalContent = `
                    <div class="modal-header">
                        <h5 class="modal-title" id="updateModalLabel">Update Address</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <!-- Input fields for updating the address data -->
                        <div class="col-md-6 form-group">
                            <label for="updateAddressLine1">Address Line 1(*)</label>
                            <input type="text" class="form-control" id="updateAddressLine1" name="updateAddressLine1" value="${addressLine1}">
                        </div>
                        <div class="col-md-6 form-group">
                            <label for="updateAddressLine2">Address Line 2(*)</label>
                            <input type="text" class="form-control" id="updateAddressLine2" name="updateAddressLine2" value="${addressLine2}">
                        </div>
                        <div class="col-md-4 form-group">
                            <label for="updateStreet">Street(*)</label>
                            <input type="text" class="form-control" id="updateStreet" name="updateStreet" value="${street}">
                        </div>
                        <div class="col-md-4 form-group">
                            <label for="updateCity">City(*)</label>
                            <input type="text" class="form-control" id="updateCity" name="updateCity" value="${city}">
                        </div>
                        <div class="col-md-4 form-group">
                            <label for="updateState">State(*)</label>
                            <input type="text" class="form-control" id="updateState" name="updateState" value="${state}">
                        </div>
                        <div class="col-md-4 form-group">
                            <label for="updatePostalCode">Postal Code(*)</label>
                            <input type="text" class="form-control" id="updatePostalCode" name="updatePostalCode" value="${postalCode}">
                        </div>
                        <div class="col-md-4 form-group">
                            <label for="updateCountry">Country(*)</label>
                            <select class="form-select" name="updateCountry" id="updateCountry">
                                <!-- Populate the country options here -->
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" id="saveChangesButton">Save Changes</button>
                    </div>`;

                // Set the modal content
                $('#updateModal .modal-content').html(modalContent);

                // Show the update modal
                $('#updateModal').modal('show');
            });

            // JavaScript to handle saving changes in the modal
            $('#saveChangesButton').on('click', function() {
                // Retrieve the updated data from the modal input fields
                var updatedAddressLine1 = $('#updateAddressLine1').val();
                var updatedAddressLine2 = $('#updateAddressLine2').val();
                var updatedStreet = $('#updateStreet').val();
                var updatedCity = $('#updateCity').val();
                var updatedState = $('#updateState').val();
                var updatedPostalCode = $('#updatePostalCode').val();
                var updatedCountry = $('#updateCountry').val();

                // You can use AJAX to send the updated data to the server for processing.
                // For simplicity, we'll just update the displayed data here.
                // Update the displayed data
                // $('#addressLine1').val(updatedAddressLine1);
                // $('#addressLine2').val(updatedAddressLine2);
                // $('#street').val(updatedStreet);
                // $('#city').val(updatedCity);
                // $('#state').val(updatedState);
                // $('#postalCode').val(updatedPostalCode);
                // $('#country').val(updatedCountry);

                // Close the update modal
                $('#updateModal').modal('hide');
            });
        });
    </script>
</body>
</html>
