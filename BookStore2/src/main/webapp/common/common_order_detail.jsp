<div align="center">
	<h2>Order Overview:</h2>
	<form action="email" method="post">
	<table>
		<tr>
			<td><b>Ordered By: </b></td>
			<td>${order.users.getUserFullName()}</td>	
				<input type="hidden" name="fullName" value="${order.users.getUserFullName()}">
		</tr>
		
		<tr>
			<td><b>Order Status: </b></td>
			<td>${order.orderStatus}</td>
			
		</tr>
		<tr>
			<td><b>Order Date: </b></td>
			<td>${order.orderDate}</td>
			<input type="hidden" name="orderDate" value="${order.orderDate}">
		</tr>
		<tr>
			<td><b>Recipient Method: </b></td>
			<td>${order.paymentMethod}</td>
		</tr>

		<tr>
			<td><b>Total Amount: </b></td>
			<td><fmt:formatNumber value="${order.totalAmount}" type="currency" /></td>
			<input type="hidden" name="totalAmount" value="${order.totalAmount}">
			<input type="hidden" name="email" value="${order.users.email}">
		</tr>
	</table>
	<h2>Recipient Information</h2>
	<table>
		<tr>
			<td><b>First Name: </b></td>
			<td>${order.users.firstName}</td>
		</tr>
		<tr>
			<td><b>Last Name: </b></td>
			<td>${order.users.lastName}</td>
		</tr>
		<tr>
			<td><b>Phone: </b></td>
			<td>${order.users.telephone}</td>
		</tr>

	</table>
		
		<input type="submit" value="Get Invoice">
		</form>
</div>
